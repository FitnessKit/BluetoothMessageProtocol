# BluetoothMessageProtocol

[![Swift4](https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/BluetoothMessageProtocol.svg?style=flat)](http://cocoapods.org/pods/BluetoothMessageProtocol)
[![License](https://img.shields.io/cocoapods/l/BluetoothMessageProtocol.svg?style=flat)](http://cocoapods.org/pods/BluetoothMessageProtocol)
[![Platform](https://img.shields.io/cocoapods/p/BluetoothMessageProtocol.svg?style=flat)](http://cocoapods.org/pods/BluetoothMessageProtocol)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/fitnesskit/bluetoothmessageprotocol)](http://clayallsopp.github.io/readme-score?url=https://github.com/fitnesskit/bluetoothmessageprotocol)
[![codebeat badge](https://codebeat.co/badges/e24e0c9d-0ec1-42fb-8384-30f7587559c0)](https://codebeat.co/projects/github-com-fitnesskit-bluetoothmessageprotocol-master)

This is not a BLE Manager for your phone.  There are plenty of those out there.  BluetoothMessageProtocol provides functions for encoding and decoding Bluetooth Characteristic data.


## Installation

BluetoothMessageProtocol is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'BluetoothMessageProtocol'
```

Swift Package Manager:
```swift
    dependencies: [
        .package(url: "https://github.com/FitnessKit/BluetoothMessageProtocol", from: "0.13.0")
    ]
```
## How to Use

Each Bluetooth Characteristic has an encode and decode method.  When you receive the data from a sensor you call the static decode method to turn the data into a Characteristic Object as seen below in the example:

```swift
func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {

    if let sensorData = characteristic.value {
        if characteristic.uuid.uuidString == CharacteristicHeartRateMeasurement.uuidString {
            doDecodeHRMess(sensorData: sensorData)
        }

        if characteristic.uuid.uuidString == CharacteristicBodySensorLocation.uuidString {
            doDecodeBody(sensorData: sensorData)
        }
    }
}

func doDecodeHRMess(sensorData: Data) {

    do {
        let hrData = try CharacteristicHeartRateMeasurement.decode(data: sensorData)

        print("HR: \(hrData.heartRate)")

    } catch  {
        print(error)
    }
}

func doDecodeBody(sensorData: Data) {

    do {
        let hrData = try CharacteristicBodySensorLocation.decode(data: sensorData)

        print("Location: \(hrData.sensorLocation.stringValue)")

    } catch  {
        print(error)
    }
}
```

## Author

This package is developed and maintained by Kevin A. Hoogheem

## License

BluetoothMessageProtocol is available under the [MIT license](http://opensource.org/licenses/MIT)
