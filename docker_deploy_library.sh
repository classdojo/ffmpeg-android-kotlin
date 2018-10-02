#!/bin/sh

printf "Deploying library to artifactory"
docker run --rm -e ARTIFACTORY_USER=$artifactoryUser -e ARTIFACTORY_BASE_URL=$artifactoryBaseUrl -e ARTIFACTORY_PASSWORD=$artifactoryPassword -v "$PWD":/usr/src/kotlin-ffmpeg-android -w /usr/src/kotlin-ffmpeg-android ffmpeg_android_kotlin "./deploy_android_library.sh"