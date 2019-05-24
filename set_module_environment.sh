#!/bin/bash

# $1 = architecture
# $2 = 1 - default compiler environment variables, 0 - none

. set_environment.sh
MODULE_ARCH=${1}

echo "Module architecture"
echo $MODULE_ARCH

case $MODULE_ARCH in
  armeabi-v7a)
    NDK_ABI='arm'
    NDK_TOOLCHAIN_ABI='arm-linux-androideabi'
    NDK_CROSS_PREFIX="${NDK_TOOLCHAIN_ABI}"
  ;;
  arm64-v8a)
      NDK_ABI='arm64'
      NDK_TOOLCHAIN_ABI='aarch64-linux-android'
      NDK_CROSS_PREFIX="${NDK_TOOLCHAIN_ABI}"
    ;;
  armeabi-v7a-neon)
    NDK_ABI='arm'
    NDK_TOOLCHAIN_ABI='arm-linux-androideabi'
    NDK_CROSS_PREFIX="${NDK_TOOLCHAIN_ABI}"
    CFLAGS="${CFLAGS} -mfpu=neon"
  ;;
  x86)
    NDK_ABI='x86'
    NDK_TOOLCHAIN_ABI='x86'
    NDK_CROSS_PREFIX="i686-linux-android"
    CFLAGS="$CFLAGS -march=i686"
  ;;
  x86_64)
      NDK_ABI='x86_64'
      NDK_TOOLCHAIN_ABI='x86_64'
      NDK_CROSS_PREFIX="x86-64-linux-android"
      CFLAGS="$CFLAGS -march=x86-64"
    ;;
esac

if [ ! -d "$TOOLCHAIN_PREFIX" ]; then
  echo "Building standalone toolchain"
  echo $NDK_ABI
  ${ANDROID_NDK_ROOT}/build/tools/make-standalone-toolchain.sh --arch=${NDK_ABI} --platform=android-${ANDROID_API_VERSION} --install-dir=${TOOLCHAIN_PREFIX}
  echo "Finished building standalone toolchain"
fi
CROSS_PREFIX=${TOOLCHAIN_PREFIX}/bin/${NDK_CROSS_PREFIX}-
echo "Cross Prefix"
echo $CROSS_PREFIX
NDK_SYSROOT=${TOOLCHAIN_PREFIX}/sysroot

export PKG_CONFIG_LIBDIR="${TOOLCHAIN_PREFIX}/lib/pkgconfig"

if [ $2 == 1 ]; then
  export CC="${CROSS_PREFIX}gcc --sysroot=${NDK_SYSROOT}"
  export LD="${CROSS_PREFIX}ld"
  export RANLIB="${CROSS_PREFIX}ranlib"
  export STRIP="${CROSS_PREFIX}strip"
  export READELF="${CROSS_PREFIX}readelf"
  export OBJDUMP="${CROSS_PREFIX}objdump"
  export ADDR2LINE="${CROSS_PREFIX}addr2line"
  export AR="${CROSS_PREFIX}ar"
  export AS="${CROSS_PREFIX}as"
  export CXX="${CROSS_PREFIX}g++"
  export OBJCOPY="${CROSS_PREFIX}objcopy"
  export ELFEDIT="${CROSS_PREFIX}elfedit"
  export CPP="${CROSS_PREFIX}c++filt"
  export DWP="${CROSS_PREFIX}dwp"
  export GPROF="${CROSS_PREFIX}gprof"
  export NM="${CROSS_PREFIX}nm"
  export SIZE="${CROSS_PREFIX}size"
  export STRINGS="${CROSS_PREFIX}strings"
fi
