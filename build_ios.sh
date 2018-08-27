#!/bin/bash
set -e

# Build preconfig
if [ $CI ]; then
    echo "┌─────────────────────┐"
    echo "│     Build on CI     │"
    echo "└─────────────────────┘"
    echo "Build preconfiguration..."
    git clone -b beta https://github.com/flutter/flutter.git
    export PATH=`pwd`/flutter/bin:$PATH
    flutter doctor -v
fi

# Build and Deploy Play Store
cd ios
bundle exec fastlane build
