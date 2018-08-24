#!/bin/bash
set -e

flutter doctor -v

# Build preconfig
if [ $CI ]; then
    echo "Build on CI"
    echo "$GOOGLE_PLAY_UPLOAD_KEY" | base64 --decode > android/fake_upload.jks
    echo "$GOOGLE_PLAY_UPLOAD_KEY_PROPERTIES" | base64 --decode > android/key.properties
    echo sdk.dir="$ANDROID_HOME" > android/local.properties
    echo flutter.sdk=`which flutter` >> android/local.properties
    echo flutter.buildMode=release >> android/local.properties
fi

ls -ls android

# Build run
# flutter build apk --release

cd android

# Update fastlane
fastlane -v
sudo fastlane update_fastlane

# Build and Deploy Play Store
# fastlane build_newer_and_deploy_play_store
fastlane retrieve_newer_track_version_code
