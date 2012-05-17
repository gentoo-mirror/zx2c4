# Copyright 2012 Grafitroniks
# $Header: $

EAPI=4

inherit qt4-r2 git-2

DESCRIPTION="A utility from Grafitroniks for compositing multiple input media for slicing and dicing."
HOMEPAGE="http://www.grafitroniks.fr/logiciels_gtk/gtk_printcompositor/"
SRC_URI=""

EGIT_REPO_URI="ssh://gitcode@zx2c4.com/GrafitroniksPrintCompositor"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 ~amd64 x86 ~x86"
IUSE="debug"

DEPEND="media-gfx/qrencode
		sys-libs/zlib
		x11-libs/qt-core:4
		x11-libs/qt-gui:4
		x11-libs/qt-script:4
"
RDEPEND="${DEPEND}
		x11-libs/qtscriptgenerator
		media-gfx/imagemagick[gs,jpeg,png,svg,zlib,tiff]
		app-text/ghostscript-gpl
		app-text/poppler[utils,lcms]
"
src_install() {
		newbin "bin/PrintCompositor" ${PN}
		newicon "resources/${PN}.png" "${PN}.png"
		make_desktop_entry ${PN} PrintCompositor "" "Qt;Graphics"
}
