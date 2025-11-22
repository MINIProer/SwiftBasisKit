// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftBasisKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftBasisKit",
            targets: ["SwiftBasisKit"]),
    ],
    dependencies: [
            .package(url: "https://github.com/MINIProer/SwiftShareKit.git", from: "1.0.0"),
            .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1")
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftBasisKit",
            dependencies: [
                .product(name: "SwiftShareKit", package: "SwiftShareKit"),
                .product(name: "SnapKit", package: "SnapKit")
            ]),
        .testTarget(
            name: "SwiftBasisKitTests",
            dependencies: ["SwiftBasisKit"]
        ),
    ]
)
