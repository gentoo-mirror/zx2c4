# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator

MY_PV=$(replace_version_separator 3 -) 

DESCRIPTION="Brother scan key tool"
HOMEPAGE="http://brother.com"
SRC_URI="i386? ( http://www.brother.com/pub/bsc/linux/dlf/${PN}-${MY_PV}.i386.deb )
	amd64? ( http://www.brother.com/pub/bsc/linux/dlf/${PN}-${MY_PV}.amd64.deb )"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"


S=${WORKDIR}

src_unpack() {
		 unpack ${A}
		 unpack ./data.tar.gz 
		 rm -f data.tar.gz
}

src_install() {
	cp -pPR opt "${D}"/ || die "installing data failed" 
	mkdir -p --mode=755  "${D}"/etc/opt/brother/scanner/brscan-skey/
	ln -s /opt/brother/scanner/brscan-skey/brscan_mail.config "${D}"/etc/opt/brother/scanner/brscan-skey/
	ln -s /opt/brother/scanner/brscan-skey/brscan_mailmessage.txt "${D}"/etc/opt/brother/scanner/brscan-skey/
	ln -s /opt/brother/scanner/brscan-skey/brscan-skey-0.2.4-0.cfg "${D}"/etc/opt/brother/scanner/brscan-skey/
	mkdir -p "${D}"/usr/bin/
	ln -s /opt/brother/scanner/brscan-skey/brscan-skey "${D}"/usr/bin/
}

pkg_postinst() {
	${ROOT}/opt/brother/scanner/${PN}/${PN}-${MY_PV}.sh 0
}

pkg_prerm() {
	${ROOT}/opt/brother/scanner/${PN}/${PN}-${MY_PV}.sh R
}
