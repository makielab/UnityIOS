Unity IOS
========
Build unity project for iOS, install, run on device

All from the command line. [Working example here][example]

Homebrew
-------
Install Homebrew Dependencies

~~~
brew install https://raw.github.com/makielab/UnityIOS/master/Formula/libimobiledevice.rb
brew install https://raw.github.com/makielab/UnityIOS/master/Formula/idevice-app-runner.rb
brew install ideviceinstaller
~~~


Unity
-------
You need an editor script in your project that wraps `BuildPipeline.BuildPlayer`. [Here is an example][unity]

This will generate the xcode project:
~~~
/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath $UNITY_PROJECT -batchmode -quit -logFile - -executeMethod $BUILD_WRAPPER
~~~


XCode
-------
This builds the .app and the .ipa:
~~~
pushd $UNITY_OUTPUT
/usr/bin/xcodebuild -alltargets -configuration Release build CONFIGURATION_BUILD_DIR=$XCODE_OUTPUT 
/usr/bin/xcrun --sdk iphoneos PackageApplication "$XCODE_OUTPUT/$APP_NAME.app"
~~~


iDevice
-------
This installs and runs the ipa:
~~~
ideviceinstaller -i  "$XCODE_OUTPUT/$APP_NAME.ipa" -U $IDEVICE_UDID
APP_PATH=$(ideviceinstaller -l -U $IDEVICE_UDID -o xml | grep -o ">/private/var/.*/$APP_NAME.app<" | sed 's/[<>]//g')
idevice-app-runner -d -U $IDEVICE_UDID -r $APP_PATH
~~~

License
-------
Code is under the [MIT license][license].

[unity]:https://github.com/makielab/UnityIOS/blob/master/Unity/Builder.cs
[license]:https://github.com/makielab/UnityIOS/blob/master/LICENSE
[example]:https://github.com/makielab/UnityIOS/blob/master/example.sh