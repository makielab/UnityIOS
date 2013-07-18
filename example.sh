#!/bin/bash

UNITY_PROJECT="/Users/lpetre/UnityIOS"
BUILD_WRAPPER="Builder.DoBuild"
UNITY_OUTPUT="/Users/lpetre/UnityIOS/unity_output"
XCODE_OUTPUT="/Users/lpetre/UnityIOS/xcode_output"
APP_NAME="UnityIOS"
IDEVICE_UDID="1234567890123456789012345678901234567890"

# Make sure the necessary homebrew bits are installed
brew install https://raw.github.com/makielab/UnityIOS/master/Formula/libimobiledevice.rb
brew install https://raw.github.com/makielab/UnityIOS/master/Formula/idevice-app-runner.rb
brew install ideviceinstaller

# Make an xcode project from unity
/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath $UNITY_PROJECT -batchmode -quit -logFile - -executeMethod $BUILD_WRAPPER

# Make the xcode project into an APP
pushd $UNITY_OUTPUT
/usr/bin/xcodebuild -alltargets -configuration Release clean build CONFIGURATION_BUILD_DIR=$XCODE_OUTPUT

# make the APP into a IPA
/usr/bin/xcrun --sdk iphoneos PackageApplication "$XCODE_OUTPUT/$APP_NAME.app"

# Install the IPA, get the installed path
ideviceinstaller -i  "$XCODE_OUTPUT/$APP_NAME.ipa" -U $IDEVICE_UDID
APP_PATH=$(ideviceinstaller -l -U $IDEVICE_UDID -o xml | grep -o ">/private/var/.*/$APP_NAME.app<" | sed 's/[<>]//g')

# Run the IPA
idevice-app-runner -d -U $IDEVICE_UDID -r $APP_PATH