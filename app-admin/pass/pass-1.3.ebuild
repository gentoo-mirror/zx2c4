# Copyright 2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit bash-completion-r1

DESCRIPTION="Stores, retrieves, generates, and synchronizes passwords securely using gpg, pwgen, and git."
HOMEPAGE="http://zx2c4.com/projects/password-store/"
SRC_URI="http://git.zx2c4.com/password-store/snapshot/password-store-${PV}.tar.xz"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE="+git X zsh-completion fish-completion"

RDEPEND="
	app-crypt/gnupg
	app-admin/pwgen
	app-text/tree
	git? ( dev-vcs/git )
	X? ( x11-misc/xclip )
	zsh-completion? ( app-shells/zsh )
	fish-completion? ( app-shells/fish )
"

S="${WORKDIR}/password-store-${PV}"

src_install() {
	newbin src/password-store.sh pass
	doman man/pass.1
	dodoc README COPYING INSTALL
	newbashcomp contrib/pass.bash-completion ${PN}
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		newins contrib/pass.zsh-completion _pass
	fi
	if use fish-completion ; then
		insinto /usr/share/fish/completions
		newins contrib/pass.fish-completion pass.fish
	fi
}
