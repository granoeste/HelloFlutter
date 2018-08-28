#!/bin/bash
set -e

# Build preconfig
if [ $CI ]; then
    echo "┌─────────────────────┐"
    echo "│     Build on CI     │"
    echo "└─────────────────────┘"
    echo "Build preconfiguration ..."
    echo "Define ssh config ..."
    ls -l ~/.ssh
    [ ! -e ~/.ssh ] && mkdir -p ~/.ssh
    echo "$SSH_CONFIG" | base64 --decode > ~/.ssh/config
    echo "$GIT_PRIVATE_KEY" | base64 --decode > ~/.ssh/github
    echo "Install Flutter ..."
    git clone -b beta https://github.com/flutter/flutter.git
    export PATH=`pwd`/flutter/bin:$PATH
    echo "Install iOS toolchain ..."
    brew install --HEAD libimobiledevice
    brew install ideviceinstaller
    brew install ios-deploy

    flutter doctor -v
    env
fi

# Build and Deploy Play Store
cd ios
bundle exec fastlane retrieving_signing
security find-identity -v -p codesigning
bundle exec fastlane build
