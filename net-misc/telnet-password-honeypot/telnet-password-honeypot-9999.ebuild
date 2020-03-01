# Copyright 2012 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

inherit git-r3

DESCRIPTION="A password honeypot for telnet."
HOMEPAGE="https://git.zx2c4.com/telnet-password-honeypot"
SRC_URI=""
EGIT_REPO_URI="https://git.zx2c4.com/telnet-password-honeypot"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
    dobin honeypot
	newinitd honeypot.initd honeypot
	keepdir /var/empty
}
