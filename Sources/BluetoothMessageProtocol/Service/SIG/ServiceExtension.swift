//
//  ServiceExtension.swift
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

// MARK: - Supported Bluetooth SIG Services
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
public extension Service {

    /// Generic Access
    class var genericAccess: ServiceGenericAccess {
        return ServiceGenericAccess()
    }

    /// Alert Notification
    class var alertNotification: ServiceAlertNotification {
        return ServiceAlertNotification()
    }

    /// Automation IO
    class var automationInputOutput: ServiceAutomationInputOutput {
        return ServiceAutomationInputOutput()
    }

    /// Battery
    class var battery: ServiceBattery {
        return ServiceBattery()
    }

    /// Blood Pressure
    class var bloodPressure: ServiceBloodPressure {
        return ServiceBloodPressure()
    }

    /// Body Composition
    class var bodyComposition: ServiceBodyComposition {
        return ServiceBodyComposition()
    }

    /// Bond Management
    class var bondManagement: ServiceBondManagement {
        return ServiceBondManagement()
    }

    /// Continuous Glucose Monitoring
    class var continuousGlucoseMonitoring: ServiceContinuousGlucoseMonitoring {
        return ServiceContinuousGlucoseMonitoring()
    }

    /// Current Time
    class var currentTime: ServiceCurrentTime {
        return ServiceCurrentTime()
    }

    /// Cycling Power
    class var cyclingPower: ServiceCyclingPower {
        return ServiceCyclingPower()
    }

    /// Cycling Speed and Cadence
    class var cyclingSpeedAndCadence: ServiceCyclingSpeedAndCadence {
        return ServiceCyclingSpeedAndCadence()
    }

    /// Device Information
    class var deviceInformation: ServiceDeviceInformation {
        return ServiceDeviceInformation()
    }

    /// Environmental Sensing
    class var environmentalSensing: ServiceEnvironmentalSensing {
        return ServiceEnvironmentalSensing()
    }

    /// Fitness Machine
    class var fitnessMachine: ServiceFitnessMachine {
        return ServiceFitnessMachine()
    }

    /// Generic Attribute
    class var genericAttribute: ServiceGenericAttribute {
        return ServiceGenericAttribute()
    }

    /// Glucose
    class var glucose: ServiceGlucose {
        return ServiceGlucose()
    }

    /// Health Thermometer
    class var healthThermometer: ServiceHealthThermometer {
        return ServiceHealthThermometer()
    }

    /// Heart Rate
    class var heartRate: ServiceHeartRate {
        return ServiceHeartRate()
    }

    /// HTTP Proxy
    class var httpProxy: ServiceHttpProxy {
        return ServiceHttpProxy()
    }

    /// Human Interface Device
    class var humanInterfaceDevice: ServiceHumanInterfaceDevice {
        return ServiceHumanInterfaceDevice()
    }

    /// Immediate Alert
    class var immediateAlert: ServiceImmediateAlert {
        return ServiceImmediateAlert()
    }

    /// Indoor Positioning
    class var indoorPositioning: ServiceIndoorPositioning {
        return ServiceIndoorPositioning()
    }

    /// Insulin Delivery
    class var insulinDelivery: ServiceInsulinDelivery {
        return ServiceInsulinDelivery()
    }

    /// Internet Protocol Support
    class var internetProtocolSupport: ServiceInternetProtocolSupport {
        return ServiceInternetProtocolSupport()
    }

    /// Link Loss
    class var linkLoss: ServiceLinkLoss {
        return ServiceLinkLoss()
    }

    /// Location and Navigation
    class var locationAndNavigation: ServiceLocationAndNavigation {
        return ServiceLocationAndNavigation()
    }

    /// Mesh Provisioning
    class var meshProvisioning: ServiceMeshProvisioning {
        return ServiceMeshProvisioning()
    }

    /// Mesh Proxy
    class var meshProxy: ServiceMeshProxy {
        return ServiceMeshProxy()
    }

    /// Next Daylight Savings Time (DST) Change
    class var nextDSTChange: ServiceNextDSTChange {
        return ServiceNextDSTChange()
    }

    /// Object Transfer
    class var objectTransfer: ServiceObjectTransfer {
        return ServiceObjectTransfer()
    }

    /// Phone Alert Status
    class var phoneAlertStatus: ServicePhoneAlertStatus {
        return ServicePhoneAlertStatus()
    }

    /// Pulse Oximeter
    class var pulseOximeter: ServicePulseOximeter {
        return ServicePulseOximeter()
    }

    /// ReconnectionConfiguration
    class var reconnectionConfiguration: ServiceReconnectionConfiguration {
        return ServiceReconnectionConfiguration()
    }

    /// Reference Time Update
    class var referenceTimeUpdate: ServiceReferenceTimeUpdate {
        return ServiceReferenceTimeUpdate()
    }

    /// Running Speed and Cadence
    class var runningSpeedAndCadence: ServiceRunningSpeedAndCadence {
        return ServiceRunningSpeedAndCadence()
    }

    /// Scan Parameters
    class var scanParameters: ServiceScanParameters {
        return ServiceScanParameters()
    }

    /// Transport Discovery
    class var transportDiscovery: ServiceTransportDiscovery {
        return ServiceTransportDiscovery()
    }

    /// Tx Power
    class var txPower: ServiceTxPower {
        return ServiceTxPower()
    }

    /// User Data
    class var userData: ServiceUserData {
        return ServiceUserData()
    }

    /// Weight Scale
    class var weightScale: ServiceWeightScale {
        return ServiceWeightScale()
    }
}
