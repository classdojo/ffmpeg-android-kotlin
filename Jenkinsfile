pipeline {
    agent { label 'AndroidDockerizedBuildSlave' }
    environment {
        ARTIFACTORY_USER        = credentials('artifactoryUser')
        ARTIFACTORY_PASSWORD    = credentials('artifactoryPassword')
        ARTIFACTORY_BASE_URL    = credentials('artifactoryBaseUrl')
    }
    stages {
        stage('Fetch submodules') {
            steps {
                sh 'git submodule update --init --recursive'
            }
        }
        stage('Build ffmpeg binaries') { 
            steps {
                // Builds the ffmpeg binaries using docker
                sh './docker_build.sh'
            }
        }
        stage('Move ffmpeg binaries to project') { 
            steps {
                sh 'cd kotlin-wrapper/ffmpegandroid/ffmpeg && ./update.sh'
            }
        }
        stage('Build ffmpegandroid library') { 
            steps {
                // Builds the ffmpeg android library using gradle
                sh 'docker run --rm -v "$PWD":/usr/src/kotlin-ffmpeg-android -w /usr/src/kotlin-ffmpeg-android ffmpeg_android_kotlin "./build_android_library.sh"'
            }
        }
        stage('Deploy ffmpegandroid library to artifactory') {
            steps {
                // Runs the gradle step to deploy the aar to artifactory
                sh 'docker run --rm -v "$PWD":/usr/src/kotlin-ffmpeg-android -w /usr/src/kotlin-ffmpeg-android ffmpeg_android_kotlin "./deploy_android_library.sh"'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'kotlin-wrapper/ffmpegandroid/build/outputs/aar/*.aar', fingerprint: true
        }
    }
}