# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs eutils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://palm.cdnetworks.net/opensource/1.4.5/${PN}-${PV}.tgz
	http://palm.cdnetworks.net/opensource/1.4.5/${PN}-${PV}-patch.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	cd $S
	epatch ../${PN}-${PV}-patch
}

src_compile() {
	tc-getCC
	emake
}

src_install() {
	cd ${S}
	dodir /usr/include/cjson
	insinto /usr/include/cjson
	doins *.h
	cd ${S}/release-${ARCH}
	dodir /usr/lib
	dolib.so libcjson.so
}
