// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "SafeIndex",
  products: [
    .library(name: "SafeIndex", targets: ["SafeIndex"]),
  ],
  targets: [
    .target(name: "SafeIndex"),
    .testTarget(name: "SafeIndexTests", dependencies: ["SafeIndex"]),
  ]
)
