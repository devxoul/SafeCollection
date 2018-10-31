// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "SafeCollection",
  products: [
    .library(name: "SafeCollection", targets: ["SafeCollection"]),
  ],
  targets: [
    .target(name: "SafeCollection"),
    .testTarget(name: "SafeCollectionTests", dependencies: ["SafeCollection"]),
  ]
)
