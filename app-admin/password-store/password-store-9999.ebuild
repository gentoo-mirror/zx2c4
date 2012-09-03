# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit bash-completion-r1 git-2

DESCRIPTION="Stores, retrieves, generates, and synchronizes passwords securely using gpg, pwgen, and git."
HOMEPAGE="http://www.zx2c4.com"
SRC_URI=""
EGIT_REPO_URI="http://git.zx2c4.com/password-store"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS=""
IUSE="X +git"

RDEPEND="app-crypt/gnupg
		 app-admin/pwgen
		 app-text/tree
		 git? ( dev-vcs/git )
		 X? ( x11-misc/xclip )
"

src_install() {
	newbin src/password-store.sh pass
	doman man/pass.1
	dodoc README
	newbashcomp bash-completion/pass-bash-completion.sh ${PN}
}
