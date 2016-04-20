# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit multiprocessing eutils

if [[ ${PV} == "9999" ]];
then
	inherit git-r3
	EGIT_REPO_URI="https://git.torproject.org/pluggable-transports/obfs4.git"
else
	SRC_URI="https://github.com/Yawning/obfs4/archive/${P}.zip -> ${P}.zip"
	KEYWORDS="~amd64"
fi

DESCRIPTION="An obfuscating proxy supporting Tor's pluggable transport protocol obfs4"
HOMEPAGE="https://github.com/Yawning/obfs4"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=""

DEPEND="
	dev-lang/go
	dev-vcs/git
"

# ${WORKDIR} = ${PORTAGE_BUILDDIR}/work = ${PORTAGE_TMPDIR}/portage/${CATEGORY}/${PF}/work = /var/tmp/portage/net-proxy/obfs4proxy-${PVR}/work
# ${S} = ${WORKDIR}/${P} = work/obfs4proxy-${PV}
PREFIX_DIR="git.torproject.org/pluggable-transports"
SOURCE_DIR="${WORKDIR}/src/${PREFIX_DIR}/obfs4.git"

src_unpack() {
	if [[ ${PV} == "9999" ]];
	then
		EGIT_BRANCH="master"
		EGIT_CHECKOUT_DIR=${SOURCE_DIR}
	else
		default
		mkdir -p ${PREFIX_DIR} || die
		mv obfs4-${P} ${PREFIX_DIR}/obfs4.git || die
	fi
}

src_compile() {
	export GOPATH="${WORKDIR}"

	go get -v -x -work ${SOURCE_DIR}/obfs4proxy || die
}

src_install() {
	into /usr/bin
	dobin ${GOPATH}/bin/obfs4proxy
}
