// swift-tools-version:5.4

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
        .package(url: "https://github.com/JohnSundell/Plot.git", .upToNextMinor(from: "0.9.3")),
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.45.5")),
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
