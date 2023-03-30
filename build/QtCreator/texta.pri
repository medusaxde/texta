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
#   File: texta.pri
#
# Author: $author$
#   Date: 3/5/2023
#
# build specific QtCreator project file for texta framework texta
########################################################################
# Depends: nadir;rostra;talas;medusa;coral

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
contains(BUILD_OS,TEXTA_OS) {
} else {
BUILD_OS = os
} # contains(BUILD_OS,TEXTA_OS)
} # contains(BUILD_OS,Uname)

#BUILD_CPP_VERSION = 11

########################################################################
# nadir
#
# pkg-config --cflags --libs nadir
#

# build nadir INCLUDEPATH
#
build_nadir_INCLUDEPATH += \

# build nadir DEFINES
#
build_nadir_DEFINES += \

# build nadir FRAMEWORKS
#
build_nadir_FRAMEWORKS += \

# build nadir LIBS
#
build_nadir_LIBS += \

########################################################################
# rostra
#
# pkg-config --cflags --libs rostra
#

# build rostra INCLUDEPATH
#
build_rostra_INCLUDEPATH += \

# build rostra DEFINES
#
build_rostra_DEFINES += \

# build rostra FRAMEWORKS
#
build_rostra_FRAMEWORKS += \

# build rostra LIBS
#
build_rostra_LIBS += \

########################################################################
# talas
#
# pkg-config --cflags --libs talas
#

# build talas INCLUDEPATH
#
build_talas_INCLUDEPATH += \

# build talas DEFINES
#
build_talas_DEFINES += \

# build talas FRAMEWORKS
#
build_talas_FRAMEWORKS += \

# build talas LIBS
#
build_talas_LIBS += \

########################################################################
# medusa
#
# pkg-config --cflags --libs medusa
#

# build medusa INCLUDEPATH
#
build_medusa_INCLUDEPATH += \

# build medusa DEFINES
#
build_medusa_DEFINES += \

# build medusa FRAMEWORKS
#
build_medusa_FRAMEWORKS += \

# build medusa LIBS
#
build_medusa_LIBS += \

########################################################################
# coral
#
# pkg-config --cflags --libs coral
#

# build coral INCLUDEPATH
#
build_coral_INCLUDEPATH += \

# build coral DEFINES
#
build_coral_DEFINES += \

# build coral FRAMEWORKS
#
build_coral_FRAMEWORKS += \

# build coral LIBS
#
build_coral_LIBS += \

########################################################################
# texta

# build texta INCLUDEPATH
#
build_texta_INCLUDEPATH += \
$${build_coral_INCLUDEPATH} \
$${build_medusa_INCLUDEPATH} \
$${build_talas_INCLUDEPATH} \
$${build_rostra_INCLUDEPATH} \
$${build_nadir_INCLUDEPATH} \


# build texta DEFINES
#
build_texta_DEFINES += \
$${build_nadir_DEFINES} \
$${build_rostra_DEFINES} \
$${build_talas_DEFINES} \
$${build_medusa_DEFINES} \
$${build_coral_DEFINES} \


# build texta FRAMEWORKS
#
build_texta_FRAMEWORKS += \
$${build_coral_FRAMEWORKS} \
$${build_medusa_FRAMEWORKS} \
$${build_talas_FRAMEWORKS} \
$${build_rostra_FRAMEWORKS} \
$${build_nadir_FRAMEWORKS} \


# build texta LIBS
#
build_texta_LIBS += \
$${build_coral_LIBS} \
$${build_medusa_LIBS} \
$${build_talas_LIBS} \
$${build_rostra_LIBS} \
$${build_nadir_LIBS} \

########################################################################
