// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PlotVapor",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(name: "PlotVapor", targets: ["PlotVapor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Plot", .upToNextMinor(from: "0.11.0")),
        .package(url: "https://github.com/vapor/vapor", from: "4.0.0"),
        .package(url: "https://github.com/swift-kipple/Tools", from: "0.2.5"),
    ],
    targets: [
        .target(
            name: "PlotVapor",
            dependencies: [
                .product(name: "Plot", package: "Plot"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
    ]
)
