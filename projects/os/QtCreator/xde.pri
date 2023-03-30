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
#   File: xde.pri
#
# Author: $author$
#   Date: 3/6/2023
#
# os specific QtCreator project file for texta framework xde
########################################################################

UNAME = $$system(uname)

contains(UNAME,Darwin) {
DARWIN_VERSION = $$system(sw_vers -productVersion)
} else {
contains(UNAME,Linux) {
LINUX_VERSION = $$system(uname -r)
} else {
contains(UNAME,Windows) {
WINDOWS_VERSION = $$system(ver)
} else {
} # contains(UNAME,Windows)
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)

contains(UNAME,Darwin) {
contains(DARWIN_VERSION,12.5.1) {
DARWIN_VERSION_NAME = Monterey
DARWIN_VERSION_NUMBER = 12+
} else {
contains(DARWIN_VERSION,11.5.1) {
DARWIN_VERSION_NAME = Bigsur
DARWIN_VERSION_NUMBER = 11+
} else {
contains(DARWIN_VERSION,10.12.6) {
DARWIN_VERSION_NAME = Sierra
DARWIN_VERSION_NUMBER = 10+
} else {
DARWIN_VERSION_NAME = Mavricks
DARWIN_VERSION_NUMBER = 9+
} # contains(DARWIN_VERSION,10.12.6)
} # contains(DARWIN_VERSION,11.5.1)
} # contains(DARWIN_VERSION,12.5.1)
} # contains(UNAME,Darwin)

contains(UNAME,Darwin) {
XDE_OS = macosx
} else {
contains(UNAME,Linux) {
XDE_OS = linux
} else {
XDE_OS = windows
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)

contains(BUILD_OS,XDE_OS) {
XDE_BUILD = $${XDE_OS}
} else {
XDE_BUILD = $${BUILD_OS}
} # contains(BUILD_OS,XDE_OS)

contains(BUILD_CPP_VERSION,10) {
CONFIG += c++0x
} else {
contains(BUILD_CPP_VERSION,98|03|11|14|17) {
CONFIG += c++$${BUILD_CPP_VERSION}
} else {
} # contains(BUILD_CPP_VERSION,98|03|11|14|17)
} # contains(BUILD_CPP_VERSION,10)

contains(XDE_OS,macosx) {
contains(DARWIN_VERSION_NUMBER,12+) {
QMAKE_CFLAGS += -Wno-implicit-function-declaration
} else {
contains(DARWIN_VERSION_NUMBER,11+) {
QMAKE_CFLAGS += -Wno-implicit-function-declaration
} else {
} # contains(DARWIN_VERSION_NUMBER,11+)
} # contains(DARWIN_VERSION_NUMBER,12+)
} else {
contains(XDE_OS,linux) {
QMAKE_CXXFLAGS += -fpermissive
} else {
contains(XDE_OS,windows) {
} else {
} # contains(XDE_OS,windows)
} # contains(XDE_OS,linux)
} # contains(XDE_OS,macosx)
########################################################################
# xde

# xde INCLUDEPATH
#
xde_INCLUDEPATH += \

# xde DEFINES
#
xde_DEFINES += \

# xde os LIBS
#
contains(XDE_OS,macosx|linux) {
xde_os_LIBS += \
-lpthread \
-ldl
} else {
} # contains(XDE_OS,macosx|linux)

contains(XDE_OS,linux) {
xde_os_LIBS += \
-lrt
} else {
} # contains(XDE_OS,linux)


# xde base LIBS
#
xde_base_LIBS += \


# xde LIBS
#
xde_LIBS += \
$${xde_base_LIBS} \
$${build_xde_LIBS} \
$${xde_os_LIBS} \

########################################################################
