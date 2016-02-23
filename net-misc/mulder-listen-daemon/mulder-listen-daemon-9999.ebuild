# Copyright 2012 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

inherit git-2

DESCRIPTION="The truth is out there."
HOMEPAGE="https://git.zx2c4.com/mulder-listen-daemon"
SRC_URI=""
EGIT_REPO_URI="https://git.zx2c4.com/mulder-listen-daemon"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
    dobin mulderd
	newinitd mulderd.initd mulderd
	keepdir /var/empty
}
