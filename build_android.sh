#!/bin/bash
set -e

flutter doctor -v

# Build preconfig
echo "$GOOGLE_PLAY_UPLOAD_KEY" | base64 --decode > android/fake_upload.jks
echo "$GOOGLE_PLAY_UPLOAD_KEY_PROPERTIES" | base64 --decode > android/key.properties
ls -ls android

# Build run
# flutter build apk --release

cd android

# Update fastlane
fastlane -v
sudo fastlane update_fastlane

# Build and Deploy Play Store
fastlane deploy_newer_to_deploy_play_store
