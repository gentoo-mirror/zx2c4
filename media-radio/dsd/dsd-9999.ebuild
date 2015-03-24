# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="Digital Speech Decoder"
HOMEPAGE="http://wiki.radioreference.com/index.php/Digital_Speech_Decoder_%28software_package%29"
EGIT_REPO_URI="https://github.com/szechyjs/dsd.git"

LICENSE="GPL-2 ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/mbelib sci-libs/itpp media-libs/libsndfile media-libs/portaudio"
RDEPEND="${DEPEND}"
