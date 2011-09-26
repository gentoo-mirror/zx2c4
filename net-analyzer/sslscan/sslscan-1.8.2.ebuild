EAPI=4

DESCRIPTION="Fast SSL Scanner"
HOMEPAGE="http://sourceforge.net/projects/sslscan"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"
SLOT="0"
KEYWORDS="~amd64 ~x86"
DEPEND="dev-libs/openssl"

src_install() {
	doman sslscan.1 || die
	dobin sslscan || die
}
