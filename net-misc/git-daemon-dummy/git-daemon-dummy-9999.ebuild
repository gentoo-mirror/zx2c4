# Copyright 2016 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

EAPI=7

inherit git-r3

DESCRIPTION="A redirector for old git:// endpoints"
HOMEPAGE="https://git.zx2c4.com/git-daemon-dummy"
SRC_URI=""
EGIT_REPO_URI="https://git.zx2c4.com/git-daemon-dummy"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
    dobin git-daemon-dummy
	newinitd openrc/git-daemon-dummy.initd git-daemon-dummy
	keepdir /var/empty
}
