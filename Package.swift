// swift-tools-version: 5.10

import PackageDescription

// Approachable Concurrency settings for Swift 6.2
let approachableConcurrencySettings: [SwiftSetting] = [
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("GlobalActorIsolatedTypesUsability"),
    .enableUpcomingFeature("InferIsolatedConformances"),
    .enableUpcomingFeature("InferSendableFromCaptures"),
    // .enableUpcomingFeature("NonisolatedNonsendingByDefault")
]

let defaultMainActorIsolationSettings = approachableConcurrencySettings + [
    .unsafeFlags(["-Xfrontend", "-default-isolation", "-Xfrontend", "MainActor"])
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
            revision: "c23402e4cbfdb7a557d3aa0cfdf78c046bed7f4e"
        ),
        .package(
            url: "https://github.com/Aurorin-CAD/swift-windowsappsdk",
            revision: "3a1be9709a3b9065c43463b94b54c5351624a030"
        ),
        .package(
            url: "https://github.com/Aurorin-CAD/swift-windowsfoundation",
            revision: "d42769d70552fe59fade6fdf44bfb71c86101db7"
        ),
        .package(
            url: "https://github.com/Aurorin-CAD/swift-webview2core",
            revision: "265c192b5bed1cae6a4af20114400f4dc1cefe7f"
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
            swiftSettings: defaultMainActorIsolationSettings
        )
    ]
)
