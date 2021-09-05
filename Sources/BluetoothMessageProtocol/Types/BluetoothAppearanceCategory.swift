//
//  BluetoothAppearanceCategory.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/21/18.
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

/// Appearance Category
public enum AppearanceCategory: String {
    /// None
    case none                   = "None"
    /// Generic category
    case generic                = "Generic"
    /// Watch
    case watch                  = "Watch"
    /// Clock
    case clock                  = "Clock"
    /// Display
    case display                = "Display"
    /// Remote Control
    case remoteControl          = "Remote Control"
    /// Eye Glasses
    case eyeGlasses             = "Eye Glasses"
    /// Tag
    case tag                    = "Tag"
    /// Keyring
    case keyring                = "Keyring"
    /// Media Player
    case mediaPlayer            = "Media Player"
    /// Barcode Scanner
    case barcodeScanner         = "Barcode Scanner"
    /// Thermometer
    case thermometer            = "Thermometer"
    /// Heart Rate Sensor
    case heartRate              = "Heart Rate"
    /// Blood Pressure
    case bloodPressure          = "Blood Pressure"
    /// HID
    case hid                    = "HID"
    /// Glucose Meter
    case glucoseMeter           = "Glucose Meter"
    /// Running Walking Sensor
    case runningWalking         = "Running Walking Sensor"
    /// Cycling
    case cycling                = "Cycling"
    /// Control Device
    case control                = "Control"
    /// Network Device
    case network                = "Network"
    /// Sensor
    case sensor                 = "Sensor"
    /// Light Fixture
    case lightFixture           = "Light Fixture"
    /// Fan
    case fan                    = "Fan"
    /// HVAC
    case hvac                   = "HVAC"
    /// Heater
    case heater                 = "Heater"
    /// Access
    case access                 = "Access"
    /// Motorized
    case motorized              = "Motorized"
    /// Power
    case power                  = "Power"
    /// Light
    case light                  = "Light"
    /// Window Covering
    case windowCovering         = "Window Covering"
    /// Audio Sink
    case audioSink              = "Audio Sink"
    /// Audio Source
    case audioSource            = "Audio Source"
    /// Motorized Vehicle
    case motorizedVehicle       = "Motorized Vehicle"
    /// Domestic Appliance
    case domesticAppliance      = "Domestic Appliance"
    /// Wearable Audio Device
    case wearableAudioDevice    = "Wearable Audio Device"
    /// Aircraft
    case aircraft               = "Aircraft"
    /// AV Equipment
    case avEquipment            = "AV Equipment"
    /// Display Equipment
    case displayEquipment       = "Display Equipment"
    /// Hearing aid
    case hearingAid             = "Hearing aid"
    /// Gaming
    case gaming                 = "Gaming"
    /// Signage
    case signage                = "Signage"
    /// Pulse Oximeter
    case pulseOximeter          = "Pulse Oximeter"
    /// Weight Scale
    case weightScale            = "Weight Scale"
    /// Personal Mobility
    case personalMobility       = "Personal Mobility"
    /// Continuous Glucose Monitor
    case continuousGlucose      = "Continuous Glucose"
    /// Insulin Pump
    case insulinPump            = "Insulin Pump"
    /// Medication Delivery
    case medicationDelivery     = "Medication Delivery"
    /// Outdoor Sports Activity
    case outdoorSportsActivity  = "Outdoor Sports Activity"
}

extension AppearanceCategory {

    /// String Value for the Enum
    public var description: String {
        return String(describing: self)
    }
}
