// swift-tools-version: 6.0

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
            dependencies: [],
            swiftSettings: [.swiftLanguageMode(.v6)]),
        .testTarget(
            name: "DITests",
            dependencies: ["DI"]),
    ]
)
