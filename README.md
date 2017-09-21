SafeIndex
=========

![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/SafeIndex.svg)](https://travis-ci.org/devxoul/SafeIndex)
[![CocoaPods](http://img.shields.io/cocoapods/v/SafeIndex.svg)](https://cocoapods.org/pods/SafeIndex)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Optional Index for Swift.


At a Glance
-----------

```swift
let arr = ["A", "B", "C"]

arr[0]    // "A"
arr[100]  // fatal error: Array index out of range 😟

arr[^0]   // Optional("A")
arr[^100] // nil 😄
```


Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'SafeIndex', '~> 1.0'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/SafeIndex" ~> 1.0
    ```

- **Using [Swift Package Manager](https://swift.org/package-manager)**:

    ```swift
    import PackageDescription

    let package = Package(
      name: "MyAwesomeApp",
      dependencies: [
        .package(url: "https://github.com/devxoul/SafeIndex", "1.0.0"),
      ]
    )
    ```


License
-------

SafeIndex is under MIT license. See the [LICENSE](LICENSE) file for more info.
