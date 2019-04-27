//
//  ServiceHomeKitProtocolExtension.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/8/18.
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

// MARK: - HomeKit Accessory Protocol Services
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension Service {

    /// Pairing Service
    class var hapPairing: ServiceHapPairing {
        return ServiceHapPairing()
    }

    /// Protocol Information Service
    class var hapProtocolInformationService: ServiceHapProtocolInformationService {
        return ServiceHapProtocolInformationService()
    }

    /// Accessory Information
    class var hapAccessoryInformation: ServiceHapAccessoryInformation {
        return ServiceHapAccessoryInformation()
    }

    /// Fan
    class var hapFan: ServiceHapFan {
        return ServiceHapFan()
    }

    /// Fan Version 2
    class var hapAdvancedFan: ServiceHapAdvancedFan {
        return ServiceHapAdvancedFan()
    }
    
    /// Garage Door Opener
    class var hapGarageDoorOpener: ServiceHapGarageDoorOpener {
        return ServiceHapGarageDoorOpener()
    }

    /// Lightbulb
    class var hapLightbulb: ServiceHapLightbulb {
        return ServiceHapLightbulb()
    }

    /// Lock Management
    class var hapLockManagement: ServiceHapLockManagement {
        return ServiceHapLockManagement()
    }

    /// Lock Mechanism
    class var hapLockMechanism: ServiceHapLockMechanism {
        return ServiceHapLockMechanism()
    }

    /// Outlet
    class var hapOutlet: ServiceHapOutlet {
        return ServiceHapOutlet()
    }

    /// Switch
    class var hapSwitch: ServiceHapSwitch {
        return ServiceHapSwitch()
    }

    /// Thermostat
    class var hapThermostat: ServiceHapThermostat {
        return ServiceHapThermostat()
    }

    /// Air Quality Sensor
    class var hapAirQualitySensor: ServiceHapAirQualitySensor {
        return ServiceHapAirQualitySensor()
    }

    /// Security System
    class var hapSecuritySystem: ServiceHapSecuritySystem {
        return ServiceHapSecuritySystem()
    }

    /// Carbon Monoxide Sensor
    class var hapCarbonMonoxideSensor: ServiceHapCarbonMonoxideSensor {
        return ServiceHapCarbonMonoxideSensor()
    }

    /// Contact Sensor
    class var hapContactSensor: ServiceHapContactSensor {
        return ServiceHapContactSensor()
    }

    /// Door
    class var hapDoor: ServiceHapDoor {
        return ServiceHapDoor()
    }

    /// Humidity Sensor
    class var hapHumiditySensor: ServiceHapHumiditySensor {
        return ServiceHapHumiditySensor()
    }

    /// Leak Sensor
    class var hapLeakSensor: ServiceHapLeakSensor {
        return ServiceHapLeakSensor()
    }

    /// Light Sensor
    class var hapLightSensor: ServiceHapLightSensor {
        return ServiceHapLightSensor()
    }

    /// Motion Sensor
    class var hapMotionSensor: ServiceHapMotionSensor {
        return ServiceHapMotionSensor()
    }

    /// Occupancy Sensor
    class var hapOccupancySensor: ServiceHapOccupancySensor {
        return ServiceHapOccupancySensor()
    }

    /// Smoke Sensor
    class var hapSmokeSensor: ServiceHapSmokeSensor {
        return ServiceHapSmokeSensor()
    }

    /// Stateless Programmable Switch
    class var hapStatelessProgrammableSwitch: ServiceHapStatelessProgrammableSwitch {
        return ServiceHapStatelessProgrammableSwitch()
    }

    /// Temperature Sensor
    class var hapTemperatureSensor: ServiceHapTemperatureSensor {
        return ServiceHapTemperatureSensor()
    }

    /// Window
    class var hapWindow: ServiceHapWindow {
        return ServiceHapWindow()
    }

    /// Window Covering
    class var hapWindowCovering: ServiceHapWindowCovering {
        return ServiceHapWindowCovering()
    }

    /// Battery Service
    class var hapBatteryService: ServiceHapBatteryService {
        return ServiceHapBatteryService()
    }

    /// Carbon Dioxide Sensor
    class var hapCarbonDioxideSensor: ServiceHapCarbonDioxideSensor {
        return ServiceHapCarbonDioxideSensor()
    }

    /// Camera RTP Stream Management
    class var hapCameraRtpStreamManagement: ServiceHapCameraRtpStreamManagement {
        return ServiceHapCameraRtpStreamManagement()
    }

    /// Microphone
    class var hapMicrophone: ServiceHapMicrophone {
        return ServiceHapMicrophone()
    }

    /// Speaker
    class var hapSpeaker: ServiceHapSpeaker {
        return ServiceHapSpeaker()
    }

    /// Doorbell
    class var hapDoorbell: ServiceHapDoorbell {
        return ServiceHapDoorbell()
    }

    /// Slat
    class var hapSlat: ServiceHapSlat {
        return ServiceHapSlat()
    }

    /// Filter Maintenance
    class var hapFilterMaintenance: ServiceHapFilterMaintenance {
        return ServiceHapFilterMaintenance()
    }

    /// Air Purifier
    class var hapAirPurifier: ServiceHapAirPurifier {
        return ServiceHapAirPurifier()
    }

    /// Humidifier Dehumidifier
    class var hapHeaterCooler: ServiceHapHeaterCooler {
        return ServiceHapHeaterCooler()
    }

    /// Heater Cooler
    class var hapHumidifierDehumidifier: ServiceHapHumidifierDehumidifier {
        return ServiceHapHumidifierDehumidifier()
    }

    /// Service Label
    class var hapServiceLabel: ServiceHapServiceLabel {
        return ServiceHapServiceLabel()
    }

    /// Irrigation System
    class var hapIrrigationSystem: ServiceHapIrrigationSystem {
        return ServiceHapIrrigationSystem()
    }

    /// Valve
    class var hapValve: ServiceHapValve {
        return ServiceHapValve()
    }

    /// Faucet
    class var hapFaucet: ServiceHapFaucet {
        return ServiceHapFaucet()
    }
}
