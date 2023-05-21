// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "iTunesSearchAPI",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "iTunesSearchAPI",
            targets: ["iTunesSearchAPI"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "iTunesSearchAPI",
            dependencies: []
        ),
        .testTarget(
            name: "iTunesSearchAPITests",
            dependencies: ["iTunesSearchAPI"]
        ),
    ]
)
