# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-crypt/truecrypt/truecrypt-7.0a-r6.ebuild,v 1.1 2011/07/15 17:53:07 c1pher Exp $

EAPI="4"

inherit flag-o-matic linux-info multilib toolchain-funcs wxwidgets eutils \
	pax-utils

DESCRIPTION="Free open-source disk encryption software"
HOMEPAGE="http://www.truecrypt.org/"
SRC_URI="${P}.tar.gz\
	mirror://gentoo/${PN}-pkcs11.h.bz2"

LICENSE="truecrypt-3.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~ppc ~x86"
IUSE="X"
RESTRICT="mirror fetch bindist"

RDEPEND="|| ( >=sys-fs/lvm2-2.02.45 sys-fs/device-mapper )
	sys-fs/fuse
	x11-libs/wxGTK:2.8[X?]
	app-admin/sudo"
DEPEND="${RDEPEND}
	!ppc? ( dev-lang/nasm )"

S="${WORKDIR}/${P}-source"

#See bug 241650.
pkg_nofetch() {
	elog "Please download ${P}-linux-{86,64}.tar.gz source from:"
	elog "http://www.truecrypt.org/downloads2"
	elog "Then put the file in ${DISTDIR}/${P}.tar.gz"
}

pkg_setup() {
	local CONFIG_CHECK="~BLK_DEV_DM ~DM_CRYPT ~FUSE_FS ~CRYPTO ~CRYPTO_XTS"
	linux-info_pkg_setup

	local WX_GTK_VER="2.8"
	if use X; then
		need-wxwidgets unicode
	else
		need-wxwidgets base-unicode
	fi
}

src_prepare() {
	if has_version x11-libs/wxGTK[X]; then
		# Fix linking when NOGUI=1
		sed -e "s/WX_CONFIG_LIBS := base/&,core/" -i Main/Main.make || die "sed Main/Main.make failed"
	fi

	epatch "${FILESDIR}/makefile-archdetect.diff"
	epatch "${FILESDIR}/execstack-fix.diff"
	mkdir "${T}"/pkcs11 || die
	ln -s "${WORKDIR}"/truecrypt-pkcs11.h "${T}"/pkcs11/pkcs11.h || die
}

src_compile() {
	local EXTRA

	use X || EXTRA+=" NOGUI=1"
	append-flags -DCKR_NEW_PIN_MODE=0x000001B0 -DCKR_NEXT_OTP=0x000001B1

	emake \
		${EXTRA} \
		NOSTRIP=1 \
		NOTEST=1 \
		VERBOSE=1 \
		CC="$(tc-getCC)" \
		CXX="$(tc-getCXX)" \
		AR="$(tc-getAR)" \
		RANLIB="$(tc-getRANLIB)" \
		TC_EXTRA_CFLAGS="${CFLAGS}" \
		TC_EXTRA_CXXFLAGS="${CXXFLAGS}" \
		TC_EXTRA_LFLAGS="${LDFLAGS}" \
		WX_CONFIG="${WX_CONFIG}" \
		PKCS11_INC="${T}/pkcs11/"
}

src_test() {
	"${S}/Main/truecrypt" --text --test || die "tests failed"
}

src_install() {
	dobin Main/truecrypt
	dodoc Readme.txt "Release/Setup Files/TrueCrypt User Guide.pdf"
	exeinto "/$(get_libdir)/rcscripts/addons"
	newexe "${FILESDIR}/${PN}-stop.sh" "${PN}-stop.sh"

	newinitd "${FILESDIR}/${PN}.init" ${PN}

	if use X; then
		newicon Resources/Icons/TrueCrypt-48x48.xpm truecrypt.xpm
		make_desktop_entry ${PN} "TrueCrypt" ${PN} "System"
	fi

	pax-mark -m "${D}/usr/bin/truecrypt"
}

pkg_postinst() {
	elog "There is now an init script for TrueCrypt for Baselayout-2."
	elog "If you are a baselayout-2 user and you would like the TrueCrypt"
	elog "mappings removed on shutdown in order to prevent other file systems"
	elog "from unmounting then run:"
	elog "rc-update add truecrypt boot"
	elog ""

	ewarn "If you're getting errors about DISPLAY while using the terminal"
	ewarn "it's a known upstream bug. To use TrueCrypt from the terminal"
	ewarn "all that's necessary is to run: unset DISPLAY"
	ewarn "This will make the display unaccessable from that terminal "
	ewarn "but at least you will be able to access your volumes."
	ewarn ""

	ewarn "TrueCrypt has very restrictive license."
	ewarn "Please read the ${LICENSE} license in ${PORTDIR}/licenses"
	ewarn "directory before using TrueCrypt. Please be explicitly aware of"
	ewarn "the limitations on redistribution of binaries or modified source."
}
