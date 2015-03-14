# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator

MY_PN="qt5"
MY_PV="$(get_version_component_range 1)$(get_version_component_range 2)"
MY_PV_MICRO="0"

DESCRIPTION="Documentation for Qt5, for use with Qt Creator and other Qt documentation tools."
HOMEPAGE="https://www.qt.io/ https://qt-project.org/"
LICENSE="|| ( LGPL-2.1 LGPL-3 )"

SLOT="5"
KEYWORDS="~amd64 ~x86"
SRC_URI="http://download.qt.io/online/qtsdkrepository/linux_x64/desktop/${MY_PN}_${MY_PV}_src_doc_examples/qt.${MY_PV}.doc/${PV}-${MY_PV_MICRO}${MY_PN}_docs.7z"

DEPEND="app-arch/p7zip"

S="${WORKDIR}/Docs/Qt-$(get_version_component_range 1-2)"

src_install() {
	rm -rf global # We remove the docs that conflict with qtcore

	local target="/usr/share/doc/qt-${PV}"
	dodir "${target}"
	docompress -x "${target}"
	insinto "${target}"
	doins -r *
}
