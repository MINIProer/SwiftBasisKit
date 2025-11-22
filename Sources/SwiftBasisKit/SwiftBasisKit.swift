// The Swift Programming Language
// https://docs.swift.org/swift-book

import PackageDescription

let package = Package(
    name: "SwiftBasisKit",
    products: [
        .library(
            name: "SwiftBasisKit",
            targets: ["SwiftBasisKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftBasisKit",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftBasisKitTests",
            dependencies: ["SwiftBasisKit"]),
    ]
)
