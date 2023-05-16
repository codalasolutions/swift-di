// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "DI",
    products: [
        .library(
            name: "DI",
            targets: ["DI"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DI",
            dependencies: []),
        .testTarget(
            name: "DITests",
            dependencies: ["DI"]),
    ]
)
