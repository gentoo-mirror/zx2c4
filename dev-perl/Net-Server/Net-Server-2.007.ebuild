# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-Server-Mail/Net-Server-Mail-0.180.0.ebuild,v 1.1 2012/05/14 17:24:30 tove Exp $

EAPI=5

MODULE_AUTHOR=RHANDOM
MODULE_VERSION=${PV}
inherit perl-module

DESCRIPTION="Extensible, general Perl server engine"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	virtual/perl-libnet
"
DEPEND="${RDEPEND}
"
