# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib user flag-o-matic eutils pam

DESCRIPTION="Lightweight but featured SMTP daemon from OpenBSD"
HOMEPAGE="http://www.opensmtpd.org/"
SRC_URI="http://www.opensmtpd.org/archives/opensmtpd-portable-latest.tar.gz"

LICENSE="ISC BSD BSD-1 BSD-2 BSD-4 SSLeay"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam"

DEPEND="dev-libs/openssl
		sys-libs/zlib
		pam? ( virtual/pam )
		sys-libs/db
		dev-db/sqlite:3
		dev-libs/libevent
		!net-mail/mailwrapper
		!mail-mta/courier
		!mail-mta/esmtp
		!mail-mta/exim
		!mail-mta/mini-qmail
		!mail-mta/msmtp[mta]
		!mail-mta/nbsmtp
		!mail-mta/netqmail
		!mail-mta/nullmailer
		!mail-mta/postfix
		!mail-mta/qmail-ldap
		!mail-mta/sendmail
		!mail-mta/ssmtp[mta]
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}.xp1

src_prepare() {
	epatch "${FILESDIR}"/pam.patch
	epatch "${FILESDIR}"/build-warnings.patch
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
	newinitd "${FILESDIR}"/smtpd.initd smtpd
	use pam && newpamd "${FILESDIR}"/smtpd.pam smtpd
}

pkg_preinst() {
	enewgroup smtpd 25
	enewuser smtpd 25 -1 /var/empty smtpd
}
