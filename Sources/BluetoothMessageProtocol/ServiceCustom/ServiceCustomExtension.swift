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
    public class var appleMidi: ServiceAppleMidi {
        get {
            return ServiceAppleMidi()
        }
    }

    /// CycleOps Bike Trainer
    public class var cycleOps: ServiceCycleOps {
        get {
            return ServiceCycleOps()
        }
    }

    /// Elite Trainer
    public class var eliteTrainer: ServiceEliteTrainer {
        get {
            return ServiceEliteTrainer()
        }
    }

    /// Google Glass
    public class var googleGlass: ServiceGoogleGlass {
        get {
            return ServiceGoogleGlass()
        }
    }

    /// Myo Armband Classifier Event
    public class var myArmbandClassifierEvent: ServiceMyoClassifierEvent {
        get {
            return ServiceMyoClassifierEvent()
        }
    }

    /// Myo Armband Control
    public class var myoArmbandControl: ServiceMyoControl {
        get {
            return ServiceMyoControl()
        }
    }

    /// Myo Armband IMU
    public class var myoArmbandImu: ServiceMyoImu {
        get {
            return ServiceMyoImu()
        }
    }

    /// Myo Armband Raw EMG Data
    public class var myoArmbandRawEMGData: ServiceMyoRawEMGData {
        get {
            return ServiceMyoRawEMGData()
        }
    }

    /// Nordic Legacy Device Firmware Update
    public class var nordicLegacyDeviceFirmwareUpdate: ServiceNordicLegacyDeviceFirmwareUpdate {
        get {
            return ServiceNordicLegacyDeviceFirmwareUpdate()
        }
    }

    /// Nordic Secure Device Firmware Update
    public class var nordicSecureDeviceFirmwareUpdate: ServiceNordicSecureDeviceFirmwareUpdate {
        get {
            return ServiceNordicSecureDeviceFirmwareUpdate()
        }
    }

    /// Texas Instruments Firmware Update
    public class var texasInstrumentsFirmwareUpdate: ServiceTexasInstrumentsFirmwareUpdate {
        get {
            return ServiceTexasInstrumentsFirmwareUpdate()
        }
    }

    /// Texas Instruments Sensor Tag Accelerometer
    public class var texasInstrumentsSensorTagAccelerometer: ServiceTexasInstrumentsSensorTagAccelerometer {
        get {
            return ServiceTexasInstrumentsSensorTagAccelerometer()
        }
    }

    /// Texas Instruments Sensor Tag Barometer
    public class var texasInstrumentsSensorTagBarometer: ServiceTexasInstrumentsSensorTagBarometer {
        get {
            return ServiceTexasInstrumentsSensorTagBarometer()
        }
    }

    /// Texas Instruments Sensor Tag Connection Control
    public class var texasInstrumentsSensorTagControl: ServiceTexasInstrumentsSensorTagControl {
        get {
            return ServiceTexasInstrumentsSensorTagControl()
        }
    }

    /// Texas Instruments Sensor Tag Gyroscope
    public class var texasInstrumentsSensorTagGyroscope: ServiceTexasInstrumentsSensorTagGyroscope {
        get {
            return ServiceTexasInstrumentsSensorTagGyroscope()
        }
    }

    /// Texas Instruments Sensor Tag Humidity
    public class var texasInstrumentsSensorTagHumidity: ServiceTexasInstrumentsSensorTagHumidity {
        get {
            return ServiceTexasInstrumentsSensorTagHumidity()
        }
    }

    /// Texas Instruments Sensor Tag Magnetometer
    public class var texasInstrumentsSensorTagMagnetometer: ServiceTexasInstrumentsSensorTagMagnetometer {
        get {
            return ServiceTexasInstrumentsSensorTagMagnetometer()
        }
    }

    /// Texas Instruments Sensor Tag Temperature
    public class var texasInstrumentsSensorTagTemperature: ServiceTexasInstrumentsSensorTagTemperature {
        get {
            return ServiceTexasInstrumentsSensorTagTemperature()
        }
    }

    /// Wahoo Fitness Equipment Service
    public class var wahooFitnessEquipment: ServiceWahooFitnessEquipment {
        get {
            return ServiceWahooFitnessEquipment()
        }
    }

    /// Wahoo Fitness GEM Module Firmware Update
    public class var wahooFitnessGEMModuleFirmwareUpdate: ServiceWahooFitnessGEMModuleFirmwareUpdate {
        get {
            return ServiceWahooFitnessGEMModuleFirmwareUpdate()
        }
    }
}
