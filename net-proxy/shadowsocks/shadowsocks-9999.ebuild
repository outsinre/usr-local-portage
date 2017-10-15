# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 )

EGIT_REPO_URI="https://github.com/shadowsocks/shadowsocks.git"
EGIT_BRANCH="master"
EGIT_CLONE_TYPE="single"

inherit distutils-r1 git-r3

DESCRIPTION="A fast tunnel proxy that helps you bypass firewalls"
HOMEPAGE="http://shadowsocks.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/libsodium-1.0.8
        "
