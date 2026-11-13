// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealLevelPlayAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealLevelPlayAdapter",
            targets: ["AppodealLevelPlayAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/ironsource-mobile/LevelPlay-Swift-Package", exact: "9.8.0"),
    ],
    targets: [
        .target(
            name: "AppodealLevelPlayAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "UnityMediationSDK", package: "LevelPlay-Swift-Package"),
                .target(name: "AppodealLevelPlayAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealLevelPlayAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealLevelPlayAdapter/9.8.0.0.0/9be60bb14363/AppodealLevelPlayAdapter.xcframework.zip",
            checksum: "9be60bb1436317018c7080c49755341e11679ac83c3669eeeb98b9ec22b18403"
        ),

    ]
)
