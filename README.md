Unity IOS
========
Build unity project for iOS, install, run on device

All from the command line.

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
/Application/Unity.app/Contents/MacOS/Unity -projectPath <path> -batchmode -quit -logFile - -executeMethod <build wrapper>
~~~


XCode
-------
This builds the .app and the .ipa:
~~~
cd <unity output>
/usr/bin/xcodebuild -alltargets -configuration Release clean build CONFIGURATION_BUILD_DIR=<xcode output> 
/usr/bin/xcrun --sdk iphoneos PackageApplication <xcode output>/<app name>.app
~~~


iDevice
-------
This installs and runs the ipa:
~~~
ideviceinstaller -i  <xcode output>/<app name>.ipa -U <UDID>
app_path = ideviceinstaller -l -U <UDID> -o xml | grep -o '>/private/var/.*/<app name>.app<' | sed 's/[<>]//g'
idevice-app-runner -d -U <UDID> -r <app_path>
~~~

License
-------
Code is under the [MIT license][license].

[unity]:https://github.com/makielab/UnityIOS/blob/master/Unity/Builder.cs
[license]:https://github.com/makielab/UnityIOS/blob/master/LICENSE