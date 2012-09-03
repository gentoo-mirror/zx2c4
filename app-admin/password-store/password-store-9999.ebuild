# Copyright 2012 Jason A. Donenfeld <Jason@zx2c4.com>

EAPI=4

inherit bash-completion-r1 git-2

DESCRIPTION="Stores, retrieves, generates, and synchronizes passwords securely using gpg, pwgen, and git."
HOMEPAGE="http://www.zx2c4.com"
SRC_URI=""
EGIT_REPO_URI="http://git.zx2c4.com/password-store"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="X +git"

RDEPEND="app-crypt/gnupg
		 app-admin/pwgen
		 app-text/tree
		 git? ( dev-vcs/git )
		 X? ( x11-misc/xclip )
"

src_compile() {
	mv src/password-store.sh src/pass
}

src_install() {
    dobin src/pass
	doman man/pass.1
	dodoc README
	newbashcomp bash-completion/pass-bash-completion.sh ${PN}
}
