#!/bin/bash
set -e

# Build preconfig
if [ $CI ]; then
    echo "┌─────────────────────┐"
    echo "│     Build on CI     │"
    echo "└─────────────────────┘"
    flutter doctor -v
    echo "Build preconfiguration..."
    echo "$GOOGLE_PLAY_UPLOAD_KEY" | base64 --decode > android/fake_upload.jks
    echo "$GOOGLE_PLAY_UPLOAD_KEY_PROPERTIES" | base64 --decode > android/key.properties
    echo sdk.dir="$ANDROID_HOME" > android/local.properties
    echo flutter.sdk="$FLUTTER_HOME" >> android/local.properties
    echo flutter.buildMode=release >> android/local.properties
fi

# Build and Deploy Play Store
cd android
# bundle exec fastlane build_newer_and_deploy_play_store
# bundle exec fastlane retrieve_newer_track_version_code
# bundle exec fastlane build_newer
# bundle exec fastlane check
bundle exec fastlane build
