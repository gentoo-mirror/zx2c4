# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/iftop/iftop-0.17.ebuild,v 1.12 2010/01/01 17:36:43 fauli Exp $

inherit eutils

MY_P=${P/_pre/pre}
DESCRIPTION="display bandwidth usage on an interface"
SRC_URI="http://www.ex-parrot.com/~pdw/iftop/download/${MY_P}.tar.gz"
HOMEPAGE="http://www.ex-parrot.com/~pdw/iftop/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses
	net-libs/libpcap"

S=${WORKDIR}/${MY_P}

src_install() {
	dosbin iftop
	doman iftop.8
	dodoc ChangeLog README "${FILESDIR}"/iftoprc
}
