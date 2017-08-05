// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "BluetoothMessageProtocol",
    dependencies: [
        .Package(url: "https://github.com/FitnessKit/FitnessUnits", majorVersion: 1),
        .Package(url: "https://github.com/FitnessKit/DataDecoder", majorVersion: 0)
    ]
)
