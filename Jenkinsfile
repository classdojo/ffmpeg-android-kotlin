pipeline {
    agent any 
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
                sh './build_android_library.sh'
            }
        }
        stage('Deploy ffmpegandroid library to artifactory') {
            steps {
                // Runs the gradle step to deploy the aar to artifactory
                
            }
        }
    }
}