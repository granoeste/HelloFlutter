fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## Android
### android retrieve_newer_track_version_code
```
fastlane android retrieve_newer_track_version_code
```
Retrieve newer track version code
### android build_newer
```
fastlane android build_newer
```
Build with newer version code
### android deploy_play_store
```
fastlane android deploy_play_store
```
Deploy the built release APK to internal
### android build_newer_and_deploy_play_store
```
fastlane android build_newer_and_deploy_play_store
```
Build newer version APK and deploy

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
