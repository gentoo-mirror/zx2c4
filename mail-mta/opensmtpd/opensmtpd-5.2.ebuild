# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib user flag-o-matic eutils pam

DESCRIPTION="Lightweight but featured SMTP daemon from OpenBSD"
HOMEPAGE="http://www.opensmtpd.org/"
SRC_URI="http://www.opensmtpd.org/archives/opensmtpd-portable-latest.tar.gz"

LICENSE="ISC BSD BSD-1 BSD-2 BSD-4"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam"

DEPEND="dev-libs/openssl
		sys-libs/zlib
		pam? ( virtual/pam )
		sys-libs/db
		dev-db/sqlite:3
		dev-libs/libevent
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}.xp1

src_prepare() {
	epatch "${FILESDIR}"/pam.patch
}

src_configure() {
	./bootstrap
	econf \
		--with-privsep-user=smtpd \
		--with-privsep-path=/var/empty \
		--with-sock-dir=/var/run \
		--sysconfdir=/etc/opensmtpd \
		$(use_with pam)
}

src_install() {
	default
	newinitd "${FILESDIR}"/opensmtpd.initd opensmtpd
	use pam && newpamd "${FILESDIR}"/opensmtpd.pam opensmtpd
}

pkg_preinst() {
	enewgroup smtpd 25
	enewuser smtpd 25 -1 /var/empty smtpd
}
