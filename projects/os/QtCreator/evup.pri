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
#   File: evup.pri
#
# Author: $author$
#   Date: 3/6/2023
#
# os specific QtCreator project file for texta framework evup
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
} # contains(UNAME,Darwin)

contains(UNAME,Darwin) {
EVUP_OS = macosx
} else {
contains(UNAME,Linux) {
EVUP_OS = linux
} else {
EVUP_OS = windows
} # contains(UNAME,Linux)
} # contains(UNAME,Darwin)

contains(BUILD_OS,EVUP_OS) {
EVUP_BUILD = $${EVUP_OS}
} else {
EVUP_BUILD = $${BUILD_OS}
} # contains(BUILD_OS,EVUP_OS)

contains(BUILD_CPP_VERSION,10) {
CONFIG += c++0x
} else {
contains(BUILD_CPP_VERSION,98|03|11|14|17) {
CONFIG += c++$${BUILD_CPP_VERSION}
} else {
} # contains(BUILD_CPP_VERSION,98|03|11|14|17)
} # contains(BUILD_CPP_VERSION,10)

contains(EVUP_OS,macosx) {
contains(DARWIN_VERSION_NUMBER,11+) {
QMAKE_CFLAGS += -Wno-implicit-function-declaration
} # contains(DARWIN_VERSION_NUMBER,11+)
} else {
contains(EVUP_OS,linux) {
QMAKE_CXXFLAGS += -fpermissive
} else {
contains(EVUP_OS,windows) {
} else {
} # contains(EVUP_OS,windows)
} # contains(EVUP_OS,linux)
} # contains(EVUP_OS,macosx)
########################################################################
# evup

# evup INCLUDEPATH
#
evup_INCLUDEPATH += \

# evup DEFINES
#
evup_DEFINES += \

# evup os LIBS
#
contains(EVUP_OS,macosx|linux) {
evup_os_LIBS += \
-lpthread \
-ldl
} else {
} # contains(EVUP_OS,macosx|linux)

contains(EVUP_OS,linux) {
evup_os_LIBS += \
-lrt
} else {
} # contains(EVUP_OS,linux)


# evup base LIBS
#
evup_base_LIBS += \


# evup LIBS
#
evup_LIBS += \
$${evup_base_LIBS} \
$${build_evup_LIBS} \
$${evup_os_LIBS} \

########################################################################
