# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Parallel Network Login Auditor"
HOMEPAGE="http://www.foofus.net/jmk/medusa.html"
SRC_URI="http://www.foofus.net/jmk/tools/${P}.tar.gz"
RESTRICT="nomirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="nostrip"
IUSE="ssl ssh2 ncp postgres svn"

DEPEND="
	dev-libs/libpcre
	ssl? ( dev-libs/openssl )
	ssh2? ( net-libs/libssh2 )
	ncp? ( net-fs/ncpfs )
	postgres? ( dev-db/libpq )
	svn? ( dev-util/subversion )
"

src_compile() {
	export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"
	export LIBS="$LIBS -lssl -lm"
	econf \
		--with-default-mod-path="/usr/lib/medusa/modules" \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "Install failed!"
	dodoc README TODO ChangeLog
	dohtml doc/*.html
}
