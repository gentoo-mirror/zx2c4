# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="CUDA accelerated litecoin mining application based on pooler's CPU miner"
HOMEPAGE="https://github.com/cbuchner1/CudaMiner"
SRC_URI=""
EGIT_REPO_URI="https://github.com/cbuchner1/CudaMiner.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="<dev-util/nvidia-cuda-toolkit-5.5"
RDEPEND="${DEPEND}"

src_configure() {
	export CFLAGS=""
	export LDFLAGS="-L/opt/cuda/lib64"
	econf
}
