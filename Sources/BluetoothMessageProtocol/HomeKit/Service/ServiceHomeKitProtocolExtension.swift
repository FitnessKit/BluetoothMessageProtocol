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
    public class var hapPairing: ServiceHapPairing {
        return ServiceHapPairing()
    }

    /// Protocol Information Service
    public class var hapProtocolInformationService: ServiceHapProtocolInformationService {
        return ServiceHapProtocolInformationService()
    }

    /// Accessory Information
    public class var hapAccessoryInformation: ServiceHapAccessoryInformation {
        return ServiceHapAccessoryInformation()
    }

    /// Fan
    public class var hapFan: ServiceHapFan {
        return ServiceHapFan()
    }

    /// Fan Version 2
    public class var hapAdvancedFan: ServiceHapAdvancedFan {
        return ServiceHapAdvancedFan()
    }
    
    /// Garage Door Opener
    public class var hapGarageDoorOpener: ServiceHapGarageDoorOpener {
        return ServiceHapGarageDoorOpener()
    }

    /// Lightbulb
    public class var hapLightbulb: ServiceHapLightbulb {
        return ServiceHapLightbulb()
    }

    /// Lock Management
    public class var hapLockManagement: ServiceHapLockManagement {
        return ServiceHapLockManagement()
    }

    /// Lock Mechanism
    public class var hapLockMechanism: ServiceHapLockMechanism {
        return ServiceHapLockMechanism()
    }

    /// Outlet
    public class var hapOutlet: ServiceHapOutlet {
        return ServiceHapOutlet()
    }

    /// Switch
    public class var hapSwitch: ServiceHapSwitch {
        return ServiceHapSwitch()
    }

    /// Thermostat
    public class var hapThermostat: ServiceHapThermostat {
        return ServiceHapThermostat()
    }

    /// Air Quality Sensor
    public class var hapAirQualitySensor: ServiceHapAirQualitySensor {
        return ServiceHapAirQualitySensor()
    }

    /// Security System
    public class var hapSecuritySystem: ServiceHapSecuritySystem {
        return ServiceHapSecuritySystem()
    }

    /// Carbon Monoxide Sensor
    public class var hapCarbonMonoxideSensor: ServiceHapCarbonMonoxideSensor {
        return ServiceHapCarbonMonoxideSensor()
    }

    /// Contact Sensor
    public class var hapContactSensor: ServiceHapContactSensor {
        return ServiceHapContactSensor()
    }

    /// Door
    public class var hapDoor: ServiceHapDoor {
        return ServiceHapDoor()
    }

    /// Humidity Sensor
    public class var hapHumiditySensor: ServiceHapHumiditySensor {
        return ServiceHapHumiditySensor()
    }

    /// Leak Sensor
    public class var hapLeakSensor: ServiceHapLeakSensor {
        return ServiceHapLeakSensor()
    }

    /// Light Sensor
    public class var hapLightSensor: ServiceHapLightSensor {
        return ServiceHapLightSensor()
    }

    /// Motion Sensor
    public class var hapMotionSensor: ServiceHapMotionSensor {
        return ServiceHapMotionSensor()
    }

    /// Occupancy Sensor
    public class var hapOccupancySensor: ServiceHapOccupancySensor {
        return ServiceHapOccupancySensor()
    }

    /// Smoke Sensor
    public class var hapSmokeSensor: ServiceHapSmokeSensor {
        return ServiceHapSmokeSensor()
    }

    /// Stateless Programmable Switch
    public class var hapStatelessProgrammableSwitch: ServiceHapStatelessProgrammableSwitch {
        return ServiceHapStatelessProgrammableSwitch()
    }

    /// Temperature Sensor
    public class var hapTemperatureSensor: ServiceHapTemperatureSensor {
        return ServiceHapTemperatureSensor()
    }

    /// Window
    public class var hapWindow: ServiceHapWindow {
        return ServiceHapWindow()
    }

    /// Window Covering
    public class var hapWindowCovering: ServiceHapWindowCovering {
        return ServiceHapWindowCovering()
    }

    /// Battery Service
    public class var hapBatteryService: ServiceHapBatteryService {
        return ServiceHapBatteryService()
    }

    /// Carbon Dioxide Sensor
    public class var hapCarbonDioxideSensor: ServiceHapCarbonDioxideSensor {
        return ServiceHapCarbonDioxideSensor()
    }

    /// Camera RTP Stream Management
    public class var hapCameraRtpStreamManagement: ServiceHapCameraRtpStreamManagement {
        return ServiceHapCameraRtpStreamManagement()
    }

    /// Microphone
    public class var hapMicrophone: ServiceHapMicrophone {
        return ServiceHapMicrophone()
    }

    /// Speaker
    public class var hapSpeaker: ServiceHapSpeaker {
        return ServiceHapSpeaker()
    }

    /// Doorbell
    public class var hapDoorbell: ServiceHapDoorbell {
        return ServiceHapDoorbell()
    }

    /// Slat
    public class var hapSlat: ServiceHapSlat {
        return ServiceHapSlat()
    }

    /// Filter Maintenance
    public class var hapFilterMaintenance: ServiceHapFilterMaintenance {
        return ServiceHapFilterMaintenance()
    }

    /// Air Purifier
    public class var hapAirPurifier: ServiceHapAirPurifier {
        return ServiceHapAirPurifier()
    }

    /// Humidifier Dehumidifier
    public class var hapHeaterCooler: ServiceHapHeaterCooler {
        return ServiceHapHeaterCooler()
    }

    /// Heater Cooler
    public class var hapHumidifierDehumidifier: ServiceHapHumidifierDehumidifier {
        return ServiceHapHumidifierDehumidifier()
    }

    /// Service Label
    public class var hapServiceLabel: ServiceHapServiceLabel {
        return ServiceHapServiceLabel()
    }

    /// Irrigation System
    public class var hapIrrigationSystem: ServiceHapIrrigationSystem {
        return ServiceHapIrrigationSystem()
    }

    /// Valve
    public class var hapValve: ServiceHapValve {
        return ServiceHapValve()
    }

    /// Faucet
    public class var hapFaucet: ServiceHapFaucet {
        return ServiceHapFaucet()
    }
}
