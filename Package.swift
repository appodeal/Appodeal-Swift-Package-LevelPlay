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
        .package(url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package", exact: "9.4.0"),
    ],
    targets: [
        .target(
            name: "AppodealLevelPlayAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
                .target(name: "AppodealLevelPlayAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealLevelPlayAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealLevelPlayAdapter/9.4.0.0.0/AppodealLevelPlayAdapter.xcframework.zip",
            checksum: "2b2f5e23e355940a19c9e3888da79e561171b184e9398bf8fbc9df2279dbcb72"
        ),

    ]
)
