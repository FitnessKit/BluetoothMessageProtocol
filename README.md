# BluetoothMessageProtocol

[![Swift5.2](https://img.shields.io/badge/swift5.2-compatible-4BC51D.svg?style=flat)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/BluetoothMessageProtocol.svg?style=flat)](http://cocoapods.org/pods/BluetoothMessageProtocol)
[![License](https://img.shields.io/cocoapods/l/BluetoothMessageProtocol.svg?style=flat)](http://cocoapods.org/pods/BluetoothMessageProtocol)
[![Platform](https://img.shields.io/cocoapods/p/BluetoothMessageProtocol.svg?style=flat)](http://cocoapods.org/pods/BluetoothMessageProtocol)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/fitnesskit/bluetoothmessageprotocol)](http://clayallsopp.github.io/readme-score?url=https://github.com/fitnesskit/bluetoothmessageprotocol)
[![codebeat badge](https://codebeat.co/badges/e24e0c9d-0ec1-42fb-8384-30f7587559c0)](https://codebeat.co/projects/github-com-fitnesskit-bluetoothmessageprotocol-master)
[Docs](https://fitnesskit.github.io/BluetoothMessageProtocol/)

This is not a BLE Manager for your phone.  There are plenty of those out there.  BluetoothMessageProtocol provides functions for encoding and decoding Bluetooth Characteristic data.


## Installation

BluetoothMessageProtocol is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'BluetoothMessageProtocol'
```

Swift Package Manager:
```swift
dependencies: [
    .package(url: "https://github.com/FitnessKit/BluetoothMessageProtocol", from: "2.0.1")
]
```

## How to Use

### Services

The Service class helps to describe a BLE Service.   There is no assumption to which Characteristics the Service contains.

Example Using CoreBluetooth:

```swift

centralManager.scanForPeripherals(withServices: [CBUUID(string: ServiceHeartRate.uuidString),],
                                       options: [CBCentralManagerScanOptionAllowDuplicatesKey : true])

```

#### Supported Services

* BLE SIG Services
* Home Kit Accessory Protocol (HAP)
* BLE Mesh


### Characteristic

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

    let hrData: Result<CharacteristicHeartRateMeasurement, BluetoothDecodeError> = CharacteristicHeartRateMeasurement.decode(with: sensorData)

    switch hrData {
    case .success(let char):
        print("HR: \(char.heartRate)")

    case .failure(let error):
        print(error)
    }

    /// Or you can stil use the doCatch
    do {
        let hrData = try CharacteristicHeartRateMeasurement.decode(with: sensorData).get()

        print("HR: \(hrData.heartRate)")

    } catch  {
        print(error)
    }
}

func doDecodeBody(sensorData: Data) {

    let sensor: Result<CharacteristicBodySensorLocation, BluetoothDecodeError> = CharacteristicBodySensorLocation.decode(with: sensorData)

    switch sensor {
    case .success(let char):
        print("Location: \(char.sensorLocation.stringValue)")

    case .failure(let error):
        print(error)
    }

    /// Or you can stil use the doCatch
    do {
        let sensor = try CharacteristicBodySensorLocation.decode(with: sensorData).get()

        print("Location: \(sensor.sensorLocation.stringValue)")

    } catch  {
        print(error)
    }
}
```

### Manufacturer Specific Data

Manufacturer Specific data contains a Company Assigned Number and specific data defined by the Manufacturer.  

Example using Apple iBeacon:

```swift
func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

    if let advertData = advertisementData[CBAdvertisementDataManufacturerDataKey] as? Data {

        switch ManufacturerDataAppleiBeacon.decode(with: advertData) {
        case .success(let beacon):
            print(beacon.proximityUUID.uuidString)

        case .failure(let error):
            print(error)

        }

        /// Or you can stil use the doCatch
        if let beacon = try? ManufacturerDataAppleiBeacon.decode(with: advertData).get() {
            print(beacon.proximityUUID.uuidString)
        }
    }
}
```

#### Manufacturer Specific Data

* Apple iBeacon
* AltBeacon
* HomeKit
* HomeKit Encrypted Notification Advertisement
* Polar Heart Rate


## Author

This package is developed and maintained by Kevin A. Hoogheem

## License

BluetoothMessageProtocol is available under the [MIT license](http://opensource.org/licenses/MIT)
