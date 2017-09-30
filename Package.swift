// swift-tools-version:3.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BluetoothMessageProtocol",
    dependencies: [
        .Package(url: "https://github.com/FitnessKit/FitnessUnits", majorVersion: 1, minor: 2),
        .Package(url: "https://github.com/FitnessKit/DataDecoder", majorVersion: 4)
    ]
)
