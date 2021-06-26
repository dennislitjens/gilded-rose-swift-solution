// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "GildedRose",
    products: [
        .library(
            name: "GildedRose",
            targets: ["GildedRose"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ShawnBaek/Table.git",
            from: "1.0.0"
        )
    ],
    targets: [
        .target(
            name: "GildedRose",
            dependencies: []),
        .target(
            name: "GildedRoseApp",
            dependencies: ["GildedRose", "Table"]),
        .testTarget(
            name: "GildedRoseTests",
            dependencies: ["GildedRose"]),
    ]
)
