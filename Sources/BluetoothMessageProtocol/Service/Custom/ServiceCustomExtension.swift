//
//  ServiceCustomExtension.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/9/17.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

// MARK: - Non Bluetooth SIG Services
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension Service {

    /// Apple MIDI
    class var appleMidi: ServiceAppleMidi {
        return ServiceAppleMidi()
    }

    /// CycleOps Bike Trainer
    class var cycleOps: ServiceCycleOps {
        return ServiceCycleOps()
    }

    /// Dropcam
    class var dropcam: ServiceDropcam {
        return ServiceDropcam()
    }

    /// Elite Trainer
    class var eliteTrainer: ServiceEliteTrainer {
        return ServiceEliteTrainer()
    }

    /// GymConnect Service
    class var gymConnect: ServiceGymConnect {
        return ServiceGymConnect()
    }

    /// Google Glass
    class var googleGlass: ServiceGoogleGlass {
        return ServiceGoogleGlass()
    }

    /// Komoot
    class var komoot: ServiceKomoot {
        return ServiceKomoot()
    }

    /// Myo Armband Classifier Event
    class var myArmbandClassifierEvent: ServiceMyoClassifierEvent {
        return ServiceMyoClassifierEvent()
    }

    /// Myo Armband Control
    class var myoArmbandControl: ServiceMyoControl {
        return ServiceMyoControl()
    }

    /// Myo Armband IMU
    class var myoArmbandImu: ServiceMyoImu {
        return ServiceMyoImu()
    }

    /// Myo Armband Raw EMG Data
    class var myoArmbandRawEMGData: ServiceMyoRawEMGData {
        return ServiceMyoRawEMGData()
    }

    /// Nordic Legacy Device Firmware Update
    class var nordicLegacyDeviceFirmwareUpdate: ServiceNordicLegacyDeviceFirmwareUpdate {
        return ServiceNordicLegacyDeviceFirmwareUpdate()
    }

    /// Nordic Secure Device Firmware Update
    class var nordicSecureDeviceFirmwareUpdate: ServiceNordicSecureDeviceFirmwareUpdate {
        return ServiceNordicSecureDeviceFirmwareUpdate()
    }

    /// North Pole Engineering AWE Diagnostics
    class var northPoleAweDiagnostics: ServiceNorthPoleAweDiagnostics {
        return ServiceNorthPoleAweDiagnostics()
    }

    /// North Pole Engineering AWE Heart Rate
    class var northPoleAweHeartRate: ServiceNorthPoleAweHeartRate {
        return ServiceNorthPoleAweHeartRate()
    }

    /// Tacx ANT-FEC
    class var tacxAntFec: ServiceTacxAntFec {
        return ServiceTacxAntFec()
    }

    /// Texas Instruments Firmware Update
    class var texasInstrumentsFirmwareUpdate: ServiceTexasInstrumentsFirmwareUpdate {
        return ServiceTexasInstrumentsFirmwareUpdate()
    }

    /// Texas Instruments Sensor Tag Accelerometer
    class var texasInstrumentsSensorTagAccelerometer: ServiceTexasInstrumentsSensorTagAccelerometer {
        return ServiceTexasInstrumentsSensorTagAccelerometer()
    }

    /// Texas Instruments Sensor Tag Barometer
    class var texasInstrumentsSensorTagBarometer: ServiceTexasInstrumentsSensorTagBarometer {
        return ServiceTexasInstrumentsSensorTagBarometer()
    }

    /// Texas Instruments Sensor Tag Connection Control
    class var texasInstrumentsSensorTagControl: ServiceTexasInstrumentsSensorTagControl {
        return ServiceTexasInstrumentsSensorTagControl()
    }

    /// Texas Instruments Sensor Tag Gyroscope
    class var texasInstrumentsSensorTagGyroscope: ServiceTexasInstrumentsSensorTagGyroscope {
        return ServiceTexasInstrumentsSensorTagGyroscope()
    }

    /// Texas Instruments Sensor Tag Humidity
    class var texasInstrumentsSensorTagHumidity: ServiceTexasInstrumentsSensorTagHumidity {
        return ServiceTexasInstrumentsSensorTagHumidity()
    }

    /// Texas Instruments Sensor Tag Magnetometer
    class var texasInstrumentsSensorTagMagnetometer: ServiceTexasInstrumentsSensorTagMagnetometer {
        return ServiceTexasInstrumentsSensorTagMagnetometer()
    }

    /// Texas Instruments Sensor Tag Temperature
    class var texasInstrumentsSensorTagTemperature: ServiceTexasInstrumentsSensorTagTemperature {
        return ServiceTexasInstrumentsSensorTagTemperature()
    }

    /// Wahoo Fitness Firmware Update
    class var wahooFitnessFirmwareUpdate: ServiceWahooFitnessFirmwareUpdate {
        return ServiceWahooFitnessFirmwareUpdate()
    }
}
