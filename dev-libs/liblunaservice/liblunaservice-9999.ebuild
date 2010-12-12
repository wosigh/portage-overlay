# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="git://git.webos-internals.org/libraries/lunaservice.git"

inherit git toolchain-funcs

DESCRIPTION="Luna Service Library"
HOMEPAGE="http://git.webos-internals.org/?p=libraries/lunaservice.git"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {

	tc-getCC
	emake prefix=/usr

}

src_install() {
	cd ${S}
	dodir /usr/include/liblunaservice
	insinto /usr/include/liblunaservice
	doins *.h
	dodir /usr/lib
	dolib.so liblunaservice.so
}

