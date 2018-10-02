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
    public class var genericAccess: ServiceGenericAccess {
        return ServiceGenericAccess()
    }

    /// Alert Notification
    public class var alertNotification: ServiceAlertNotification {
        return ServiceAlertNotification()
    }

    /// Automation IO
    public class var automationInputOutput: ServiceAutomationInputOutput {
        return ServiceAutomationInputOutput()
    }

    /// Battery
    public class var battery: ServiceBattery {
        return ServiceBattery()
    }

    /// Blood Pressure
    public class var bloodPressure: ServiceBloodPressure {
        return ServiceBloodPressure()
    }

    /// Body Composition
    public class var bodyComposition: ServiceBodyComposition {
        return ServiceBodyComposition()
    }

    /// Bond Management
    public class var bondManagement: ServiceBondManagement {
        return ServiceBondManagement()
    }

    /// Continuous Glucose Monitoring
    public class var continuousGlucoseMonitoring: ServiceContinuousGlucoseMonitoring {
        return ServiceContinuousGlucoseMonitoring()
    }

    /// Current Time
    public class var currentTime: ServiceCurrentTime {
        return ServiceCurrentTime()
    }

    /// Cycling Power
    public class var cyclingPower: ServiceCyclingPower {
        return ServiceCyclingPower()
    }

    /// Cycling Speed and Cadence
    public class var cyclingSpeedAndCadence: ServiceCyclingSpeedAndCadence {
        return ServiceCyclingSpeedAndCadence()
    }

    /// Device Information
    public class var deviceInformation: ServiceDeviceInformation {
        return ServiceDeviceInformation()
    }

    /// Environmental Sensing
    public class var environmentalSensing: ServiceEnvironmentalSensing {
        return ServiceEnvironmentalSensing()
    }

    /// Fitness Machine
    public class var fitnessMachine: ServiceFitnessMachine {
        return ServiceFitnessMachine()
    }

    /// Generic Attribute
    public class var genericAttribute: ServiceGenericAttribute {
        return ServiceGenericAttribute()
    }

    /// Glucose
    public class var glucose: ServiceGlucose {
        return ServiceGlucose()
    }

    /// Health Thermometer
    public class var healthThermometer: ServiceHealthThermometer {
        return ServiceHealthThermometer()
    }

    /// Heart Rate
    public class var heartRate: ServiceHeartRate {
        return ServiceHeartRate()
    }

    /// HTTP Proxy
    public class var httpProxy: ServiceHttpProxy {
        return ServiceHttpProxy()
    }

    /// Human Interface Device
    public class var humanInterfaceDevice: ServiceHumanInterfaceDevice {
        return ServiceHumanInterfaceDevice()
    }

    /// Immediate Alert
    public class var immediateAlert: ServiceImmediateAlert {
        return ServiceImmediateAlert()
    }

    /// Indoor Positioning
    public class var indoorPositioning: ServiceIndoorPositioning {
        return ServiceIndoorPositioning()
    }

    /// Insulin Delivery
    public class var insulinDelivery: ServiceInsulinDelivery {
        return ServiceInsulinDelivery()
    }

    /// Internet Protocol Support
    public class var internetProtocolSupport: ServiceInternetProtocolSupport {
        return ServiceInternetProtocolSupport()
    }

    /// Link Loss
    public class var linkLoss: ServiceLinkLoss {
        return ServiceLinkLoss()
    }

    /// Location and Navigation
    public class var locationAndNavigation: ServiceLocationAndNavigation {
        return ServiceLocationAndNavigation()
    }

    /// Mesh Provisioning
    public class var meshProvisioning: ServiceMeshProvisioning {
        return ServiceMeshProvisioning()
    }

    /// Mesh Proxy
    public class var meshProxy: ServiceMeshProxy {
        return ServiceMeshProxy()
    }

    /// Next Daylight Savings Time (DST) Change
    public class var nextDSTChange: ServiceNextDSTChange {
        return ServiceNextDSTChange()
    }

    /// Object Transfer
    public class var objectTransfer: ServiceObjectTransfer {
        return ServiceObjectTransfer()
    }

    /// Phone Alert Status
    public class var phoneAlertStatus: ServicePhoneAlertStatus {
        return ServicePhoneAlertStatus()
    }

    /// Pulse Oximeter
    public class var pulseOximeter: ServicePulseOximeter {
        return ServicePulseOximeter()
    }

    /// ReconnectionConfiguration
    public class var reconnectionConfiguration: ServiceReconnectionConfiguration {
        return ServiceReconnectionConfiguration()
    }

    /// Reference Time Update
    public class var referenceTimeUpdate: ServiceReferenceTimeUpdate {
        return ServiceReferenceTimeUpdate()
    }

    /// Running Speed and Cadence
    public class var runningSpeedAndCadence: ServiceRunningSpeedAndCadence {
        return ServiceRunningSpeedAndCadence()
    }

    /// Scan Parameters
    public class var scanParameters: ServiceScanParameters {
        return ServiceScanParameters()
    }

    /// Transport Discovery
    public class var transportDiscovery: ServiceTransportDiscovery {
        return ServiceTransportDiscovery()
    }

    /// Tx Power
    public class var txPower: ServiceTxPower {
        return ServiceTxPower()
    }

    /// User Data
    public class var userData: ServiceUserData {
        return ServiceUserData()
    }

    /// Weight Scale
    public class var weightScale: ServiceWeightScale {
        return ServiceWeightScale()
    }
}
