// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Podcasts",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Podcasts",
            targets: ["Podcasts"]),
    ],
    dependencies: [
        .package(path: "../Core"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.6.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Podcasts" ,
            dependencies: [
                "Core",
                .product(name: "Kingfisher", package: "Kingfisher")
            ]),
        .testTarget(
            name: "PodcastsTests",
            dependencies: ["Podcasts"]
        ),
        
    ]
)
