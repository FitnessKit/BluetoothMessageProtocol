// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BluetoothMessageProtocol",
    products: [
        .library(name: "BluetoothMessageProtocol", targets: ["BluetoothMessageProtocol"])
    ],
    dependencies: [
        .package(url: "https://github.com/FitnessKit/FitnessUnits", from: "2.1.1"),
        .package(url: "https://github.com/FitnessKit/DataDecoder", from: "4.3.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift", from: "0.9.0")

    ],
    targets: [
        .target(
            name: "BluetoothMessageProtocol",
            dependencies: [
                "FitnessUnits",
                "DataDecoder",
                "CryptoSwift",
            ]
        ),
        .testTarget(
            name: "BluetoothMessageProtocolTests",
            dependencies: [
                "BluetoothMessageProtocol"
                ]
        ),

    ],
    swiftLanguageVersions: [3, 4]
)
