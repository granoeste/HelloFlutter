#!/bin/bash
set -e

flutter doctor -v

# Build preconfig
if [ $CI ]; then
    echo "┌─────────────────────┐"
    echo "│     Build on CI     │"
    echo "└─────────────────────┘"
    echo "Build preconfiguration..."
fi

# Build and Deploy Play Store
cd ios
bundle exec fastlane build
