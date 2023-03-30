########################################################################
# Copyright (c) 1988-2023 $organization$
#
# This software is provided by the author and contributors ``as is''
# and any express or implied warranties, including, but not limited to,
# the implied warranties of merchantability and fitness for a particular
# purpose are disclaimed. In no event shall the author or contributors
# be liable for any direct, indirect, incidental, special, exemplary,
# or consequential damages (including, but not limited to, procurement
# of substitute goods or services; loss of use, data, or profits; or
# business interruption) however caused and on any theory of liability,
# whether in contract, strict liability, or tort (including negligence
# or otherwise) arising in any way out of the use of this software,
# even if advised of the possibility of such damage.
#
#   File: medusaxde.pri
#
# Author: $author$
#   Date: 3/6/2023
#
# build specific QtCreator project file for texta framework medusaxde
########################################################################
# Depends: xde

contains(BUILD_OS,Uname) {
UNAME = $$system(uname)

contains(UNAME,Darwin) {
BUILD_OS = macosx
} else {
contains(UNAME,Linux) {
BUILD_OS = linux
} else {
contains(UNAME,Windows) {
BUILD_OS = windows
} else {
BUILD_OS = os
} # contains(UNAME,Windows)
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)
} else {
contains(BUILD_OS,MEDUSAXDE_OS) {
} else {
BUILD_OS = os
} # contains(BUILD_OS,MEDUSAXDE_OS)
} # contains(BUILD_OS,Uname)

#BUILD_CPP_VERSION = 11

thirdparty_HOME = ../../../../../../thirdparty
thirdparty_build_HOME = ../$${thirdparty_HOME}

########################################################################
# libiconv
#
# pkg-config --cflags --libs libiconv
#
libiconv_HOME = $${thirdparty_HOME}
libiconv_build_HOME = $${thirdparty_build_HOME}

# build libiconv INCLUDEPATH
#
build_libiconv_INCLUDEPATH += \
$${libiconv_HOME}/build/libiconv/include \

# build libiconv DEFINES
#
build_libiconv_DEFINES += \

# build libiconv LIBS
#
build_libiconv_LIBS += \
-L$${libiconv_build_HOME}/build/libiconv/lib \
-liconv \

########################################################################
# zlib
#
# pkg-config --cflags --libs zlib
#
zlib_HOME = $${thirdparty_HOME}
zlib_build_HOME = $${thirdparty_build_HOME}

# build zlib INCLUDEPATH
#
build_zlib_INCLUDEPATH += \
$${zlib_HOME}/build/zlib/include \

# build zlib DEFINES
#
build_zlib_DEFINES += \

# build zlib LIBS
#
build_zlib_LIBS += \
-L$${zlib_build_HOME}/build/zlib/lib \
-lz \

########################################################################
# libxml2
#
# pkg-config --cflags --libs libxml2
#
libxml2_HOME = $${thirdparty_HOME}
libxml2_build_HOME = $${thirdparty_build_HOME}

# build libxml2 INCLUDEPATH
#
build_libxml2_INCLUDEPATH += \
$${libxml2_HOME}/build/libxml2/include/libxml2 \

# build libxml2 DEFINES
#
build_libxml2_DEFINES += \

# build libxml2 LIBS
#
build_libxml2_LIBS += \
-L$${libxml2_build_HOME}/build/libxml2/lib \
-lxml2 \
$${build_zlib_LIBS} \
$${build_libiconv_LIBS} \

########################################################################
# libxslt
#
# pkg-config --cflags --libs libxslt
#
libxslt_HOME = $${thirdparty_HOME}
libxslt_build_HOME = $${thirdparty_build_HOME}

# build libxslt INCLUDEPATH
#
build_libxslt_INCLUDEPATH += \
$${libxslt_HOME}/build/libxslt/include \
$${build_libxml2_INCLUDEPATH} \

# build libxslt DEFINES
#
build_libxslt_DEFINES += \

# build libxslt LIBS
#
build_libxslt_LIBS += \
-L$${libxslt_build_HOME}/build/libxslt/lib \
-lxslt \
-lexslt \
$${build_libxml2_LIBS} \

########################################################################
# medusaxde

# build medusaxde INCLUDEPATH
#
build_medusaxde_INCLUDEPATH += \
$${build_libxslt_INCLUDEPATH} \
$${build_libxml2_INCLUDEPATH} \


# build medusaxde DEFINES
#
build_medusaxde_DEFINES += \
$${build_libxml2_DEFINES} \
$${build_libxslt_DEFINES} \


# build medusaxde FRAMEWORKS
#
build_medusaxde_FRAMEWORKS += \
$${build_libxslt_FRAMEWORKS} \
$${build_libxml2_FRAMEWORKS} \


# build medusaxde LIBS
#
build_medusaxde_LIBS += \
$${build_libxslt_LIBS} \
$${build_libxml2_LIBS} \

########################################################################
