#!/bin/bash

# $1 = architecture
# $2 = 1 - default compiler environment variables, 0 - none

. set_module_environment.sh $1 $2

pushd openh264

case ${MODULE_ARCH} in
  armeabi-v7a | armeabi-v7a-neon)
    ARCH=arm
	ASM=''
  ;;
  arm64-v8a)
      ARCH=arm64
  	ASM=''
    ;;
  x86)
    ARCH=x86
	ASM='ENABLEPIC=Yes'
  ;;
  x86_64)
      ARCH=x86_64
  	ASM='ENABLEPIC=Yes'
    ;;
esac

echo "Building openh264"
echo "Target OS: $TARGET_OS"
echo "Android NDK Root: $ANDROID_NDK_ROOT"
echo "Target: $ANDROID_TARGET_API_VERSION"
echo "Min Sdk: $ANDROID_API_VERSION"
echo "Architecture: $ARCH"
echo "Prefix: $TOOLCHAIN_PREFIX"

echo "Making clean"

make \
  OS=${TARGET_OS} \
  NDKROOT=$ANDROID_NDK_ROOT \
  TARGET=android${ANDROID_TARGET_API_VERSION} \
  SDK_MIN=${ANDROID_API_VERSION} \
  ARCH="${ARCH}" \
  NDKLEVEL=${ANDROID_API_VERSION} \
  clean

echo "Building"

make \
  OS=${TARGET_OS} \
  NDKROOT=$ANDROID_NDK_ROOT \
  TARGET=android-${ANDROID_TARGET_API_VERSION} \
  SDK_MIN=${ANDROID_API_VERSION} \
  ARCH="${ARCH}" \
  ${ASM} \
  PREFIX="${TOOLCHAIN_PREFIX}" \
  NDKLEVEL=${ANDROID_API_VERSION} \
  -j${NUMBER_OF_CORES} install || exit 1

popd
