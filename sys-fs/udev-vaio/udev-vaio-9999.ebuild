EAPI=4

DESCRIPTION="Udev keymap for Sony Vaio."
HOMEPAGE="http://code.google.com/p/vaio-f11-linux/wiki/ProgrammableKeys"
SRC_URI="http://vaio-f11-linux.googlecode.com/files/module-sony"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="sys-fs/udev"

src_unpack() {
	mkdir "${S}"
	mv "${DISTDIR}/${A}" "${S}"
}
src_install() {
	mkdir -p "${D}/lib/udev/keymaps/"
	cp -L "${A}" "${D}/lib/udev/keymaps/"
}
