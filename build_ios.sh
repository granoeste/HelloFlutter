#!/bin/bash
set -e

# Build preconfig
if [ $CI ]; then
    echo "┌─────────────────────┐"
    echo "│     Build on CI     │"
    echo "└─────────────────────┘"
    echo "Build preconfiguration ..."
    echo "Define ssh config ..."
    [ ! -e ~/.ssh ] && mkdir -p ~/.ssh
    echo "$SSH_CONFIG" | base64 --decode > ~/.ssh/config
    echo "$GIT_PRIVATE_KEY" | base64 --decode > ~/.ssh/github
    echo "Install Flutter ..."
    git clone -b beta https://github.com/flutter/flutter.git
    export PATH=`pwd`/flutter/bin:$PATH
    # echo "Install iOS toolchain ..."
    # brew install --HEAD libimobiledevice
    # brew install ideviceinstaller
    # brew install ios-deploy

    flutter doctor -v

    cd ios
    bundle exec fastlane retrieving_sign_development
    bundle exec fastlane retrieving_sign_appstore
    security find-identity -v -p codesigning
    cd ..
fi

# Build
echo "flutter build ios --release ..."
flutter build ios --release

# Build and Deploy Play Store
cd ios
# bundle exec fastlane retrieving_sign_appstore
# bundle exec fastlane build
bundle exec fastlane build_and_testflight
