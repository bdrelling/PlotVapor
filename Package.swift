// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PlotVapor",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "PlotVapor", targets: ["PlotVapor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Plot", .upToNextMinor(from: "0.10.0")),
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.54.0")),
    ],
    targets: [
        .target(
            name: "PlotVapor",
            dependencies: [
                .product(name: "Plot", package: "Plot"),
                .product(name: "Vapor", package: "vapor"),
            ],
            path: "Source"
        ),
    ]
)
