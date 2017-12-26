# SafeCollection

![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/SafeCollection.svg)](https://travis-ci.org/devxoul/SafeCollection)
[![CocoaPods](http://img.shields.io/cocoapods/v/SafeCollection.svg)](https://cocoapods.org/pods/SafeCollection)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

SafeCollection provides a safer way to deal with subscripts. Inspired by Swift's [LazyCollection](https://developer.apple.com/documentation/swift/lazycollection).

## At a Glance

```swift
let arr = ["A", "B", "C"]

arr[0]    // "A"
arr[100]  // fatal error: Array index out of range 😟

arr.safe[0]   // Optional("A")
arr.safe[100] // nil 😄
```

## Installation

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'SafeCollection'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/SafeCollection"
    ```

- **Using [Swift Package Manager](https://swift.org/package-manager)**:

    ```swift
    import PackageDescription

    let package = Package(
      name: "MyAwesomeApp",
      dependencies: [
        .package(url: "https://github.com/devxoul/SafeCollection", .upToNextMajor(from: "3.0.0")),
      ]
    )
    ```

## License

SafeCollection is under MIT license. See the [LICENSE](LICENSE) file for more info.
