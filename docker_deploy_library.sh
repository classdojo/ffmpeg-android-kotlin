#!/bin/sh

printf "Deploying library to artifactory"
docker run --rm -e ARTIFACTORY_USER=$ARTIFACTORY_USER -e ARTIFACTORY_BASE_URL=$ARTIFACTORY_BASE_URL -e ARTIFACTORY_PASSWORD=$ARTIFACTORY_PASSWORD -v "$PWD":/usr/src/kotlin-ffmpeg-android -w /usr/src/kotlin-ffmpeg-android ffmpeg_android_kotlin "./deploy_android_library.sh"