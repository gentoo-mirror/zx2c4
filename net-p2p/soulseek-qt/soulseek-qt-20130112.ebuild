# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Official binary Qt SoulSeek client."
HOMEPAGE="http://www.soulseekqt.net/"
LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~amd64 ~x86"
BINARY_NAME="SoulseekQt-$((${PV:4:2}))-$((${PV:6:2}))-${PV:0:4}"
BASE_URI="http://www.soulseekqt.net/SoulseekQT/Linux/${BINARY_NAME}"
IUSE=""
SRC_URI="
	x86? ( ${BASE_URI}.tgz )
	amd64? ( ${BASE_URI}-64bit.tgz )
	"
DEPEND=""
RDEPEND="
	x11-libs/qt-gui:4
	x11-libs/qt-core:4
	"
RESTRICT="mirror"
S="${WORKDIR}"
src_install() {
	exeinto /usr/bin
	if use amd64; then
		BINARY_NAME="${BINARY_NAME}-64bit"
	fi
	newexe "$BINARY_NAME" soulseek-qt
}
