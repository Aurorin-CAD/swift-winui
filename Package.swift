// swift-tools-version: 5.10

import PackageDescription

// Approachable Concurrency settings for Swift 6.2
let approachableConcurrencySettings: [SwiftSetting] = [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("GlobalActorIsolatedTypesUsability"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("InferSendableFromCaptures"),
    .enableUpcomingFeature("NonisolatedNonsendingByDefault")
]

let package = Package(
    name: "swift-winui",
    products: [
        .library(name: "WinUI", type: .dynamic, targets: ["WinUI"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/thebrowsercompany/swift-cwinrt",
            revision: "eb46cdb66f770a1e006f9fcfebbf9e99a0fba811"
        ),
        .package(
            url: "https://github.com/Aurorin-CAD/swift-uwp",
            revision: "511fe98b3c3d0b6afc342c46e81a6859c57c2c51"
        ),
        .package(
            url: "https://github.com/Aurorin-CAD/swift-windowsappsdk",
            revision: "2f52a212fbd1d4e10c9f05688afabde198fdc24b"
        ),
        .package(
            url: "https://github.com/stackotter/swift-windowsfoundation",
            revision: "4ad57d20553514bcb23724bdae9121569b19f172"
        ),
        .package(
            url: "https://github.com/Aurorin-CAD/swift-webview2core",
            revision: "1e7132edd1d23ca8f935a4d8fc2bffe29087dafc"
        ),
    ],
    targets: [
        .target(
            name: "WinUI",
            dependencies: [
                .product(name: "CWinRT", package: "swift-cwinrt"),
                .product(name: "UWP", package: "swift-uwp"),
                .product(name: "WinAppSDK", package: "swift-windowsappsdk"),
                .product(name: "WindowsFoundation", package: "swift-windowsfoundation"),
                .product(name: "WebView2Core", package: "swift-webview2core"),
            ],
            swiftSettings: approachableConcurrencySettings
        )
    ]
)
