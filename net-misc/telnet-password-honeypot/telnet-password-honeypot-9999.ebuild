# Copyright 2012 Jason A. Donenfeld <Jason@zx2c4.com>

inherit git-2

DESCRIPTION="A password honeypot for telnet."
HOMEPAGE="http://www.zx2c4.com"
SRC_URI=""
EGIT_REPO_URI="http://git.zx2c4.com/telnet-password-honeypot"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
    dobin honeypot
	newinitd honeypot.initd honeypot
	keepdir /var/empty
}
