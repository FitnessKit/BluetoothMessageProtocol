// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageDependencies: [PackageDescription.Package.Dependency]
let targetDependencies: [PackageDescription.Target.Dependency]
let supportedPlatform: [PackageDescription.SupportedPlatform]

if #available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, watchOSApplicationExtension 6.0, *) {
    packageDependencies = [
        .package(url: "https://github.com/FitnessKit/FitnessUnits", from: "3.1.0"),
        .package(url: "https://github.com/FitnessKit/DataDecoder", from: "5.0.0")
    ]
    targetDependencies = [
        "FitnessUnits",
        "DataDecoder"
    ]
    supportedPlatform = [.iOS("13.0"), .macOS("10.15"), .tvOS("13.0"), .watchOS("6.0")]
} else {
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
    supportedPlatform = [.iOS("10.0"), .macOS("10.12"), .tvOS("10.0"), .watchOS("3.0")]
}

let package = Package(
    name: "BluetoothMessageProtocol",
    platforms: supportedPlatform,
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
    ]
)
