// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "SafeCollection",
  platforms: [
    .macOS(.v10_10), .iOS(.v8), .tvOS(.v9)
  ],
  products: [
    .library(name: "SafeCollection", targets: ["SafeCollection"]),
  ],
  targets: [
    .target(name: "SafeCollection"),
    .testTarget(name: "SafeCollectionTests", dependencies: ["SafeCollection"]),
  ],
  swiftLanguageVersions: [.v5]
)
