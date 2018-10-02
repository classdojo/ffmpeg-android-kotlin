#!/bin/sh

export ANDROID_HOME=/opt/android-sdk-linux
export ANDROID_NDK_HOME="/opt/android-ndk-linux"

printf "${GREEN}sdk = $ANDROID_HOME ${NC}\n"
printf "${GREEN}ndk = $ANDROID_NDK_HOME ${NC}\n"

printf "Moving to kotlin-wrapper"
cd kotlin-wrapper

printf "Deploying to artifactory on $ARTIFACTORY_BASE_URL ${NC}\n"
printf "With user: $ARTIFACTORY_USER ${NC}\n"

printf "Deploying kotlin-wrapper library"
./gradlew clean :ffmpegandroid:uploadArchives -PLOCAL_UPLOAD=false --stacktrace