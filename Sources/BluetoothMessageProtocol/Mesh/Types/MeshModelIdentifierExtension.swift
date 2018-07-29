//
//  MeshModelIdentifierExtension.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/28/18.
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

// MARK: - Well Known Mesh Model Identifiers
public extension MeshModelIdentifier {

    private class func sig(_ id: UInt16) -> ModelIdentifierType {
        return ModelIdentifierType.sig(id)
    }

    /// Reserved Model ID
    public class var reserved: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0), name: "Reserved") }

    // MARK: - Generic

    /// Generic OnOff Server
    public class var genericOnOffServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1000), name: "Generic OnOff Server") }
    /// Generic OnOff Client
    public class var genericOnOffClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1001), name: "Generic OnOff Client") }
    /// Generic Level Server
    public class var genericLevelServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1002), name: "Generic Level Server") }
    /// Generic Level Client
    public class var genericLevelClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1003), name: "Generic Level Client") }
    /// Generic Default Transition Time Server
    public class var genericDefaultTransitionTimeServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1004), name: "Generic Default Transition Time Server") }
    /// Generic Default Transition Time Client
    public class var genericDefaultTransitionTimeClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1005), name: "Generic Default Transition Time Client") }
    /// Generic Power OnOff Server
    public class var genericPowerOnOffServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1006), name: "Generic Power OnOff Server") }
    /// Generic Power OnOff Setup Server
    public class var genericPowerOnOffSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1007), name: "Generic Power OnOff Setup Server") }
    /// Generic Power OnOff Client
    public class var genericPowerOnOffClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1008), name: "Generic Power OnOff Client") }
    /// Generic Power OnOff Client
    public class var genericPowerLevelServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1009), name: "Generic Power Level Server") }
    /// Generic Power Level Setup Server
    public class var genericPowerLevelSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x100A), name: "Generic Power Level Setup Server") }
    /// Generic Power Level Client
    public class var genericPowerLevelClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x100B), name: "Generic Power Level Client") }
    /// Generic Battery Server
    public class var genericBatteryServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x100C), name: "Generic Battery Server") }
    /// Generic Battery Client
    public class var genericBatteryClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x100D), name: "Generic Battery Client") }
    /// Generic Location Server
    public class var genericLocationServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x100E), name: "Generic Location Server") }
    /// Generic Location Setup Server
    public class var genericLocationSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x100F), name: "Generic Location Setup Server") }
    /// Generic Location Client
    public class var genericLocationClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1010), name: "Generic Location Client") }
    /// Generic Admin Property Server
    public class var genericAdminPropertyServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1011), name: "Generic Admin Property Server") }
    /// Generic Manufacturer Property Server
    public class var genericManufacturerPropertyServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1012), name: "Generic Manufacturer Property Server") }
    /// Generic User Property Server
    public class var genericUserPropertyServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1013), name: "Generic User Property Server") }
    /// Generic Client Property Server
    public class var genericClientPropertyServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1014), name: "Generic Client Property Server") }
    /// Generic Property Client
    public class var genericPropertyClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1015), name: "Generic Property Client") }

    // MARK: - Sensors

    /// Sensor Server
    public class var sensorServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1100), name: "Sensor Server") }
    /// Sensor Setup Server
    public class var sensorSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1101), name: "Sensor Setup Server") }
    /// Sensor Client
    public class var sensorClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1102), name: "Sensor Client") }

    // MARK: - Time and Scenes

    /// Time Server
    public class var timeServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1200), name: "Time Server") }
    /// Time Setup Server
    public class var timeSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1201), name: "Time Setup Server") }
    /// Time Client
    public class var timeClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1202), name: "Time Client") }
    /// Scene Server
    public class var sceneServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1203), name: "Scene Server") }
    /// Scene Setup Server
    public class var sceneSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1204), name: "Scene Setup Server") }
    /// Scene Client
    public class var sceneClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1205), name: "Scene Client") }
    /// Scheduler Server
    public class var schedulerServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1206), name: "Scheduler Server") }
    /// Scheduler Setup Server
    public class var schedulerSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1207), name: "Scheduler Setup Server") }
    /// Scheduler Client
    public class var schedulerClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1208), name: "Scheduler Client") }

    // MARK: - Lighting

    /// Light Lightness Server
    public class var lightLightnessServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1300), name: "Light Lightness Server") }
    /// Light Lightness Setup Server
    public class var lightLightnessSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1301), name: "Light Lightness Setup Server") }
    /// Light Lightness Client
    public class var lightLightnessClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1302), name: "Light Lightness Client") }
    /// Light CTL Server
    public class var lightCtlServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1303), name: "Light CTL Server") }
    /// Light CTL Setup Server
    public class var lightCtlSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1304), name: "Light CTL Setup Server") }
    /// Light CTL Client
    public class var lightCtlClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1305), name: "Light CTL Client") }
    /// Light CTL Temperature Server
    public class var lightCtlTemperatureServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1306), name: "Light CTL Temperature Server") }
    /// Light HSL Server
    public class var lightHslServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1307), name: "Light HSL Server") }
    /// Light HSL Setup Server
    public class var lightHslSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1308), name: "Light HSL Setup Server") }
    /// Light HSL Client
    public class var lightHslClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1309), name: "Light HSL Client") }
    /// Light HSL Hue Server
    public class var lightHslHueServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x130A), name: "Light HSL Hue Server") }
    /// Light HSL Saturation Server
    public class var lightHslSaturationServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x130B), name: "Light HSL Saturation Server") }
    /// Light xyL Server
    public class var lightXylServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x130C), name: "Light xyL Server") }
    /// Light xyL Setup Server
    public class var lightXylSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x130D), name: "Light xyL Setup Server") }
    /// Light xyL Client
    public class var lightXylClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x130E), name: "Light xyL Client") }
    /// Light LC Server
    public class var lightLcServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x130F), name: "Light LC Server") }
    /// Light LC Setup Server
    public class var lightLcSetupServer: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1310), name: "Light LC Setup Server") }
    /// Light LC Client
    public class var lightLcClient: MeshModelIdentifier {
        return MeshModelIdentifier(model: sig(0x1311), name: "Light LC Client") }

}
