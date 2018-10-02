#!/bin/sh

export ANDROID_HOME=/opt/android-sdk-linux
export ANDROID_NDK_HOME="/opt/android-ndk-linux"

printf "${GREEN}sdk = $ANDROID_HOME ${NC}\n"
printf "${GREEN}ndk = $ANDROID_NDK_HOME ${NC}\n"

echo "Moving to kotlin-wrapper"
cd kotlin-wrapper

echo "Building kotlin-wrapper library"
./gradlew clean :ffmpegandroid:uploadArchives -PLOCAL_UPLOAD=false --stacktrace