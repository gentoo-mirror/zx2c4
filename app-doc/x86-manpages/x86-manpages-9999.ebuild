# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Man pages for x86 instructions"
HOMEPAGE="https://github.com/ttmo-O/x86-manpages"
SRC_URI=""
EGIT_REPO_URI="https://github.com/ttmo-O/x86-manpages"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() { :; }
src_install() {
	doman manpages/*
}
