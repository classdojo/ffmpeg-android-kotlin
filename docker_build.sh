#!/bin/sh

echo "Building image"
docker build -t ffmpeg_android_kotlin .

echo "Starting ffmpeg build"
docker run --rm -v "$PWD":/usr/src/kotlin-ffmpeg-android -w /usr/src/kotlin-ffmpeg-android ffmpeg_android_kotlin './build_android.sh'