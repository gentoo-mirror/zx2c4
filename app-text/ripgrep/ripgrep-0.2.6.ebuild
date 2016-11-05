# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="ag/grep replacement"
HOMEPAGE="https://github.com/BurntSushi/ripgrep"
SRC_URI="https://github.com/BurntSushi/ripgrep/releases/download/${PV}/${P}-x86_64-unknown-linux-musl.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-x86_64-unknown-linux-musl"

src_install() {
	dobin rg
	doman rg.1
}
