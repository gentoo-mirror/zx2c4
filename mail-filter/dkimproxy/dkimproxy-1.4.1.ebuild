# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="An SMTP proxy server for adding DKIM headers."
HOMEPAGE="http://dkimproxy.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/Mail-DKIM dev-perl/Net-Server dev-perl/Error"
RDEPEND="${DEPEND}"
