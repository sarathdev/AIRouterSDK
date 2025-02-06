// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AIRouterSDK",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AIRouterSDK",
            targets: ["AIRouterSDK"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AIRouterSDK",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "AIRouterSDKTests",
            dependencies: ["AIRouterSDK"],
            path: "Tests"
        )
    ]
)
