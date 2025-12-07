// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftBasisKit",
    platforms: [
        .iOS(.v13)      // 这里设置 iOS 最低支持版本
    ],
    products: [
        .library(
            name: "SwiftBasisKit",
            targets: ["SwiftBasisKit", "JCNetwork"]
        ),
        // 👇 增加一个可执行产物（用于运行 demo）
        .library(
             name: "JCNetwork",
             targets: ["JCNetwork"]
         )
    ],
    dependencies: [
//            .package(url: "https://github.com/MINIProer/SwiftShareKit.git", from: "1.0.0"),
//            .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.7.1"),
//            .package(url: "https://github.com/CoderMJLee/MJRefresh.git", from: "3.7.9"),
//            .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.4.1")
//            .package(url: "https://github.com/dev-liyang/LYEmptyView.git", from: "1.3.1")
            
                .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.9.1"),
                .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3") ,
                .package(url: "https://github.com/tristanhimmelman/ObjectMapper.git", from: "4.4.3"),
//            .package(path: "../Moya"),     根据你的实际路径调整
//            .package(path: "../RxSwift"),    // 根据你的实际路径调整
//            .package(path: "../Alamofire"),    // 根据你的实际路径调整
//            .package(path: "../ObjectMapper"),    // 根据你的实际路径调整
//            .package(path: "../ReactiveSwift")    // 根据你的实际路径调整

            
            
            
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftBasisKit",
            dependencies: [
//                .product(name: "SwiftShareKit", package: "SwiftShareKit"),
//                .product(name: "SnapKit", package: "SnapKit"),
//                .product(name: "MJRefresh", package: "MJRefresh"),
//                .product(name: "LYEmptyView", package: "LYEmptyView")
            ]),
        .target(
            name: "JCNetwork",
            dependencies: [
                .product(name: "Moya", package: "Moya"),
                .product(name: "RxMoya", package: "Moya"),  
                .product(name: "ObjectMapper", package: "ObjectMapper"),
                .product(name: "RxSwift", package: "RxSwift")
            ]
        ),
        // 👇 新增可执行 Target
                .executableTarget(
                    name: "SwiftBasisKitDemo",
                    dependencies: [
                        "SwiftBasisKit",
                        "JCNetwork"
                    ]
                ),
                .testTarget(
                    name: "SwiftBasisKitTests",
                    dependencies: ["SwiftBasisKit"]
                ),
    ]
)
