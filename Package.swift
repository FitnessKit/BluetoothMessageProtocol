// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BluetoothMessageProtocol",
    //platforms: [.iOS("10.0"), .macOS("10.12"), .tvOS("10.0"), .watchOS("3.0")],
    products: [
        .library(name: "BluetoothMessageProtocol", targets: ["BluetoothMessageProtocol"])
    ],
    dependencies: [
        .package(url: "https://github.com/FitnessKit/FitnessUnits", from: "2.1.4"),
        .package(url: "https://github.com/FitnessKit/DataDecoder", from: "4.4.0"),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift", .exact("0.15.0"))

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
    ]
)
