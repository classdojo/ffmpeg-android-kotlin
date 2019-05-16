#!/bin/bash

. set_environment.sh
. set_build_arch.sh

printf "${GREEN}ndk = $ANDROID_NDK_ROOT ${NC}\n"
printf "BASEDIR=$BASEDIR\n"

rm -rf build

for i in "${SUPPORTED_ARCHITECTURES[@]}"
do
  rm -rf ${TOOLCHAIN_PREFIX}
  # $1 = architecture
  # $2 = 1 - default compiler environment variables, 0 - none
  echo "Building for architecture"
  echo $i
  ./build_module_openh264.sh $i 0 || exit 1
  #./build_module_ffmpeg.sh $i 0 || exit 1
  mkdir -p ./build/$i/bin
  cp -a ./openh264/libopenh264.so ./build/$i/bin/libopenh264.so
done

rm -rf ${TOOLCHAIN_PREFIX}
