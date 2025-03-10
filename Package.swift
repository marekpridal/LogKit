// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//swiftlint:disable all
let package = Package(
    name: "LogKit",
    platforms: [.macOS(.v11), .iOS(.v14), .macCatalyst(.v14), .tvOS(.v14), .watchOS(.v7), .visionOS(.v1)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "LogKit-static",
            type: .static,
            targets: ["LogKit"]),
        .library(
            name: "LogKit-dynamic",
            type: .dynamic,
            targets: ["LogKit"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/skiptools/swift-android-native.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "LogKit",
            dependencies: [
                .product(name: "AndroidLogging", package: "swift-android-native", condition: .when(platforms: [.android]))
            ]),
        .testTarget(
            name: "LogKitTests",
            dependencies: ["LogKit"])
    ]
)
