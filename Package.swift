// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageDependencies: [PackageDescription.Package.Dependency]
let targetDependencies: [PackageDescription.Target.Dependency]

packageDependencies = [
    .package(url: "https://github.com/FitnessKit/FitnessUnits", from: "3.1.0"),
    .package(url: "https://github.com/FitnessKit/DataDecoder", from: "5.0.0"),
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift", from: "1.0.0")
]

targetDependencies = [
    "FitnessUnits",
    "DataDecoder",
    "CryptoSwift",
]

let package = Package(
    name: "BluetoothMessageProtocol",
    platforms: [.iOS(.v10), .macOS(.v10_12), .tvOS(.v10), .watchOS(.v3)],
    products: [
        .library(name: "BluetoothMessageProtocol", targets: ["BluetoothMessageProtocol"])
    ],
    dependencies: packageDependencies,
    targets: [
        .target(
            name: "BluetoothMessageProtocol",
            dependencies: targetDependencies
        ),
        .testTarget(
            name: "BluetoothMessageProtocolTests",
            dependencies: [
                "BluetoothMessageProtocol"
                ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
