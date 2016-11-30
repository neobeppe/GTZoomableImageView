# GTZoomableImageView

[![CI Status](http://img.shields.io/travis/neobeppe/GTZoomableImageView.svg?style=flat)](https://travis-ci.org/neobeppe/GTZoomableImageView)
[![Version](https://img.shields.io/cocoapods/v/GTZoomableImageView.svg?style=flat)](http://cocoapods.org/pods/GTZoomableImageView)
[![License](https://img.shields.io/cocoapods/l/GTZoomableImageView.svg?style=flat)](http://cocoapods.org/pods/GTZoomableImageView)
[![Platform](https://img.shields.io/cocoapods/p/GTZoomableImageView.svg?style=flat)](http://cocoapods.org/pods/GTZoomableImageView)

## Requirements

iOS 8 is required.

## Installation

#### CocoaPods

DCViewer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GTZoomableImageView"
```

#### Carthage

You can use [Carthage](https://github.com/Carthage/Carthage) to install `GTZoomableImageView` by adding it to your `Cartfile`:

```
github "neobeppe/GTZoomableImageView"
```

#### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `GTZoomableImageView` by adding the proper description to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/neobeppe/GTZoomableImageView.git"),
    ]
)
```

Note that the [Swift Package Manager](https://swift.org/package-manager) is still in early design and development, for more information checkout its [GitHub Page](https://github.com/apple/swift-package-manager)

#### Manually

To use this library in your project manually you may:

1.  for Projects, just drag GTZoomableImageView.swift to the project tree
2.  for Workspaces, include the whole GTZoomableImageView.xcodeproj

## Usage

You can use GTZoomableImageView via Storyboard, where you can set the image, minimun and maximum zoom level directly in Attributes inspector.
Otherwise you can create a new GTZoomableImageView programmatically with custom frame, and remember to assign an UIImage.

Default maximum zoom level is 3, and minimum is 1.

## License

GTZoomableImageView is available under the MIT license. See the LICENSE file for more info.
