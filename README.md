**Version 3.0.4**

![alt tag](https://raw.github.com/danielgindi/Charts/master/Assets/feature_graphic.png)
  ![Supported Platforms](https://img.shields.io/cocoapods/p/ChartsRealm.svg) [![Releases](https://img.shields.io/github/release/danielgindi/ChartsRealm.svg)](https://github.com/danielgindi/ChartsRealm/releases) [![Latest pod release](https://img.shields.io/cocoapods/v/ChartsRealm.svg)](http://cocoapods.org/pods/chartsrealm) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/danielgindi/ChartsRealm.svg?branch=master)](https://travis-ci.org/danielgindi/ChartsRealm) [![codecov](https://codecov.io/gh/danielgindi/ChartsRealm/branch/master/graph/badge.svg)](https://codecov.io/gh/danielgindi/ChartsRealm)
[![Join the chat at https://gitter.im/danielgindi/Charts](https://badges.gitter.im/danielgindi/Charts.svg)](https://gitter.im/danielgindi/Charts?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

### We've separated ChartsRealm from the main repositoy, for easier handling of dependencies.  
### Please avoid duplicate issues. Post on this repo for Charts+Realm specific problems, and other stuff in the issues section of the core Charts repo.  

* Xcode 8.0 / Swift 3.1
* iOS >= 8.0 (Use as an **Embedded** Framework)
* tvOS >= 9.0
* macOS >= 10.11

## Having trouble running the demo?

* `ChartsRealmDemo/ChartsRealmDemo.xcodeproj` is the demo project for iOS/tvOS
* Make sure you are running a supported version of Xcode.
  * Usually it is specified here a few lines above.
  * In most cases it will be the latest Xcode version.
* Make sure that your project supports Swift 3.1
* Run `carthage checkout` in the project folder, to fetch dependencies (i.e Realm).
  * Realm is not required for using Charts. If you are not interested in using realm, go for the core library, [here](https://github.com/danielgindi/Charts).
  * If you don't have Carthage - you can get it [here](https://github.com/Carthage/Carthage/releases).


## Usage

In order to correctly compile:

1. Drag the `ChartsRealm.xcodeproj` to your project  
2. Go to your target's settings, hit the "+" under the "Embedded Binaries" section, and select the ChartsRealm.framework  
3. `@import Charts`, `@import ChartsRealm`
4. When using Swift in an ObjC project:
   - You need to import your Bridging Header. Usually it is "*YourProject-Swift.h*", so in ChartsRealmDemo it's "*ChartsRealmDemo-Swift.h*". Do not try to actually include "*ChartsRealmDemo-Swift.h*" in your project :-)
   - (Xcode 8.1 and earlier) Under "Build Options", mark "Embedded Content Contains Swift Code"
   - (Xcode 8.2+) Under "Build Options", mark "Always Embed Swift Standard Libraries"
5. [Realm.io](https://realm.io/):
   - Note that the Realm framework is not linked with ChartsRealm. You need to have the framework in your project, and in a compatible version to whatever is compiled with ChartsRealm. We will do our best to always compile against the latest version.

## 3rd party tutorials

* [Using Realm and Charts with Swift 3 in iOS 10 (Sami Korpela)](https://medium.com/@skoli/using-realm-and-charts-with-swift-3-in-ios-10-40c42e3838c0#.2gyymwfh8)
* Want your tutorial to show here? Create a PR!

## Troubleshooting

#### Can't compile?

* Please note the difference between installing a compiled framework from CocoaPods or Carthage, and copying the source code.
* If you are using [Realm](https://realm.io/), please also `#import <ChartsRealm/ChartsRealm.h>`
* If you are compiling the source code and want to use Realm, please make sure to include the code from `ChartsRealm` project.
* Please read the **Usage** section again.
* Search in the issues ([ChartsRealm issues](https://github.com/danielgindi/ChartsRealm/issues), [Charts issues](https://github.com/danielgindi/Charts/issues). Please do not double-post!)
* Try to politely ask in the issues section

#### Other problems / feature requests

* Search in the issues
* Try to politely ask in the issues section

## CocoaPods Install

Add both `pod 'Charts'` and `pod 'ChartsRealm'` to your Podfile.

## Carthage Install

Charts now include Carthage prebuilt binaries.

```carthage
github "danielgindi/ChartsRealm" ~> 3.0.4
```

In order to build the binaries for a new release, use `carthage build --no-skip-current && carthage archive ChartsRealm`.

## Help

If you like what you see here, and want to support the work being done in this repository, you could:
* Contribute code, issues and pull requests
* Let people know this library exists (:fire: spread the word :fire:)
* [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=68UL6Y8KUPS96) (You can buy me a beer, or you can buy me dinner :-)

**Note:** The author of [MPAndroidChart](https://github.com/PhilJay/MPAndroidChart) is the reason that this library exists, and is accepting [donations](https://github.com/PhilJay/MPAndroidChart#donations) on his page. He deserves them!

Questions & Issues
-----

If you are having questions or problems, you should:

 - Make sure you are using the latest version of the library. Check the [**release-section**](https://github.com/danielgindi/ChartsRealm/releases).
 - Study the Android version's [**Documentation-Wiki**](https://github.com/PhilJay/MPAndroidChart/wiki)
 - Study the (Still incomplete [![Doc-Percent](https://img.shields.io/cocoapods/metrics/doc-percent/Charts.svg)](http://cocoadocs.org/docsets/Charts/)) [**Pod-Documentation**](http://cocoadocs.org/docsets/Charts/)
 - Search or open questions on [**stackoverflow**](http://stackoverflow.com/questions/tagged/ios-charts) with the `ios-charts` tag
 - Search [**known issues**](https://github.com/danielgindi/ChartsRealm/issues) for your problem (open and closed)
 - Create new issues (please :fire: **search known issues before** :fire:, do not create duplicate issues)

Special Thanks
=======

Goes to [@liuxuan30](https://github.com/liuxuan30), [@petester42](https://github.com/petester42) and  [@AlBirdie](https://github.com/AlBirdie) for new features, bugfixes, and lots and lots of involvement in our open-sourced community! You guys are a huge help to all of those coming here with questions and issues, and I couldn't respond to all of those without you.

License
=======
Copyright 2016 Daniel Cohen Gindi & Philipp Jahoda

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
