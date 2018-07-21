//
//  BluetoothAppearance.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/12/17.
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

/// Appearance
public enum Appearance: UInt16 {
    /// Unknown
    case unknown                                    = 0
    /// Generic Phone
    case phone                                      = 64
    /// Generic Computer
    case computer                                   = 128
    /// Generic Watch
    case watch                                      = 192
    /// Watch: Sports Watch
    case sportsWatch                                = 193
    /// Generic Clock
    case clock                                      = 256
    /// Generic Display
    case display                                    = 320
    /// Generic Remote Control
    case remoteControl                              = 384
    /// Generic Eye-glasses
    case eyeGlasses                                 = 448
    /// Generic Tag
    case tag                                        = 512
    /// Generic Keyring
    case keyRing                                    = 576
    /// Generic Media Player
    case mediaPlayer                                = 640
    /// Generic Barcode Scanner
    case barcodeScanner                             = 704
    /// Generic Thermometer
    case thermometer                                = 768
    /// Thermometer: Ear
    case earThermometer                             = 769
    /// Generic Heart rate Sensor
    case heartRateSensor                            = 832
    /// Heart Rate Sensor: Heart Rate Belt
    case beltHeartRateSensor                        = 833
    /// Generic Blood Pressure
    case bloodPressure                              = 896
    /// Blood Pressure: Arm
    case armBloodPressure                           = 897
    /// Blood Pressure: Wrist
    case wristBloodPressure                         = 898
    /// Human Interface Device (HID)
    case humanInterfaceDevice                       = 960
    /// Keyboard
    case keyboard                                   = 961
    /// Mouse
    case mouse                                      = 962
    /// Joystick
    case joystick                                   = 963
    /// Gamepad
    case gamepad                                    = 964
    /// Digitizer Tablet
    case digitizerTablet                            = 965
    /// Card Reader
    case cardReader                                 = 966
    /// Digital Pen
    case digitalPen                                 = 967
    /// Barcode Scanner
    case barcodeScannerHumanInterfaceDevice         = 968
    /// Generic Glucose Meter
    case glucoseMeter                               = 1024
    /// Generic: Running Walking Sensor
    case runningWalkingSensor                       = 1088
    /// Running Walking Sensor: In-Shoe
    case inShoeRunningWalkingSensor                 = 1089
    /// Running Walking Sensor: On-Shoe
    case onShoeRunningWalkingSensor                 = 1090
    /// Running Walking Sensor: On-Hip
    case onHipRunningWalkingSensor                  = 1091
    /// Generic: Cycling
    case cycling                                    = 1152
    /// Cycling: Cycling Computer
    case computerCycling                            = 1153
    /// Cycling: Speed Sensor
    case speedSensor                                = 1154
    /// Cycling: Cadence Sensor
    case cadenceSensor                              = 1155
    /// Cycling: Power Sensor
    case powerSensor                                = 1156
    /// Cycling: Speed and Cadence Sensor
    case speedAndCadenceSensor                      = 1157
    /// Generic Control Device
    case controlDevice                              = 1216
    /// Switch
    case switchControlDevice                        = 1217
    /// Multi-switch
    case multiSwitchControlDevice                   = 1218
    /// Button
    case buttonControlDevice                        = 1219
    /// Slider
    case sliderControlDevice                        = 1220
    /// Rotary
    case rotaryControlDevice                        = 1221
    /// Touch-panel
    case touchPanelControlDevice                    = 1222
    /// Generic Network Device
    case networkDevice                              = 1280
    /// Access Point
    case accessPointNetworkDevice                   = 1281
    /// Generic Sensor
    case genericSensor                              = 1344
    /// Motion Sensor
    case motionSensor                               = 1345
    /// Air Quality Sensor
    case airQualitySensor                           = 1346
    /// Temperature Sensor
    case temperatureSensor                          = 1347
    /// Humidity Sensor
    case humiditySensor                             = 1348
    /// Leak Sensor
    case leakSensor                                 = 1349
    /// Smoke Sensor
    case smokeSensor                                = 1350
    /// Occupancy Sensor
    case occupancySensor                            = 1351
    /// Contact Sensor
    case contactSensor                              = 1352
    /// Carbon Monoxide Sensor
    case carbonMonoxideSensor                       = 1353
    /// Carbon Dioxide Sensor
    case carbonDioxideSensor                        = 1354
    /// Ambient Light Sensor
    case ambientLightSensor                         = 1355
    /// Energy Sensor
    case energySensor                               = 1356
    /// Color Light Sensor
    case colorLightSensor                           = 1357
    /// Rain Sensor
    case rainSensor                                 = 1358
    /// Fire Sensor
    case fireSensor                                 = 1359
    /// Wind Sensor
    case windSensor                                 = 1360
    /// Proximity Sensor
    case proximitySensor                            = 1361
    /// Multi-Sensor
    case multiSensor                                = 1362
    /// Generic Light Fixtures
    case genericLightFixture                        = 1408
    /// Wall Light
    case wallLightFixture                           = 1409
    /// Ceiling Light
    case ceilingLightFixture                        = 1410
    /// Floor Light
    case floorLightFixture                          = 1411
    /// Cabinet Light
    case cabinetLightFixture                        = 1412
    /// Desk Light
    case deskLightFixture                           = 1413
    /// Troffer Light
    case trofferLightFixture                        = 1414
    /// Pendant Light
    case pendantLightFixture                        = 1415
    /// In-ground Light
    case inGroundLightFixture                       = 1416
    /// Flood Light
    case floodLightFixture                          = 1417
    /// Underwater Light
    case underwaterLightFixture                     = 1418
    /// Bollard with Light
    case bollardWithLightFixture                    = 1419
    /// Pathway Light
    case pathwayLightFixture                        = 1420
    /// Garden Light
    case gardenLightFixture                         = 1421
    /// Pole-top Light
    case poleTopLightFixture                        = 1422
    /// Spotlight
    case spotLightFixture                           = 1423
    /// Linear Light
    case linearLightFixture                         = 1424
    /// Street Light
    case streetLightFixture                         = 1425
    /// Shelves Light
    case shelvesLightFixture                        = 1426
    /// High-bay / Low-bay Light
    case highBaylowBayLightFixture                  = 1427
    /// Emergency Exit Light
    case emergancyExitLightFixture                  = 1428
    /// Generic Fan
    case genericFan                                 = 1472
    /// Ceiling Fan
    case ceilingFan                                 = 1473
    /// Axial Fan
    case axialFan                                   = 1474
    /// Exhaust Fan
    case exhaustFan                                 = 1475
    /// Pedestal Fan
    case pedastalFan                                = 1476
    /// Desk Fan
    case deskFan                                    = 1477
    /// Wall Fan
    case wallFan                                    = 1478
    /// Generic HVAC
    case genericHvac                                = 1536
    /// Thermostat
    case thermostat                                 = 1537
    /// Generic Air Conditioning
    case genericAirConditioning                     = 1600
    /// Generic Humidifier
    case genericHumidifier                          = 1664
    /// Generic Heating
    case genericHeating                             = 1728
    /// Radiator
    case radiator                                   = 1729
    /// Boiler
    case boiler                                     = 1730
    /// Heat Pump
    case heatPump                                   = 1731
    /// Infrared Heater
    case infraredHeater                             = 1732
    /// Radiant Panel Heater
    case radiantPanelHeater                         = 1733
    /// Fan Heater
    case fanHeater                                  = 1734
    /// Air Curtain
    case airCurtain                                 = 1735
    /// Generic Access Control
    case genericAccessControl                       = 1792
    /// Access Door
    case accessDoor                                 = 1793
    /// Garage Door
    case garageDoor                                 = 1794
    /// Emergency Exit Door
    case emergencyExitDoor                          = 1795
    /// Access Lock
    case accessLock                                 = 1796
    /// Elevator
    case elevator                                   = 1797
    /// Window
    case window                                     = 1798
    /// Entrance Gate
    case entranceGate                               = 1799
    /// Generic Motorized Device
    case genericMotorizedDevice                     = 1856
    /// Motorized Gate
    case motorizedGate                              = 1857
    /// Awning
    case awning                                     = 1858
    /// Blinds or Shades
    case blindsOrShades                             = 1859
    /// Curtains
    case curtains                                   = 1860
    /// Screen
    case screen                                     = 1861
    /// Generic Power Device
    case genericPowerDevice                         = 1920
    /// Power Outlet
    case powerOutlit                                = 1921
    /// Power Strip
    case powerStrip                                 = 1922
    /// Plug
    case powerPlug                                  = 1923
    /// Power Supply
    case powerSupply                                = 1924
    /// LED Driver
    case ledDriver                                  = 1925
    /// Fluorescent Lamp Gear
    case fluorescentLampGear                        = 1926
    /// HID Lamp Gear
    case hidLampGear                                = 1927
    /// Generic Light Source
    case genericLightSource                         = 1984
    /// Incandescent Light Bulb
    case incandescentLightBulb                      = 1985
    /// LED Bulb
    case ledBulb                                    = 1986
    /// HID Lamp
    case hidLamp                                    = 1987
    /// Fluorescent Lamp
    case fluorescentLamp                            = 1988
    /// LED Array
    case ledArray                                   = 1989
    /// Multi-Color LED Array
    case multiColorLedArray                         = 1990
    /// Generic: Pulse Oximeter
    case genericPulseOximeter                       = 3136
    /// Fingertip
    case fingertipPulseOximeter                     = 3137
    /// Wrist Worn
    case wristWornPulseOximeter                     = 3138
    /// Generic: Weight Scale
    case genericWeightScale                         = 3200
    /// Generic Personal Mobility Device
    case genericPersonalMobilityDevice              = 3264
    /// Powered Wheelchair
    case poweredWheelchair                          = 3265
    /// Mobility Scooter
    case mobilityScooter                            = 3266
    /// Generic Continuous Glucose Monitor
    case genericContinuousGlucoseMonitor            = 3328
    /// Generic: Outdoor Sports Activity
    case outdoorSportsActivity                      = 5184
    /// Location Display Device
    case locationDisplayDevice                      = 5185
    /// Location and Navigation Display Device
    case locationNavigationDisplay                  = 5186
    /// Location Pod
    case locationPod                                = 5187
    /// Location and Navigation Pod
    case locationNavigationPod                      = 5188
}

extension Appearance {

    public var description: String {
        return String(describing: self)
    }
}

@available(swift 4.0)
extension Appearance: Encodable {

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TypeValueCodingKeys.self)

        /// Prefer the name of the type over a raw value
        try container.encode(self.rawValue, forKey: .value)
        try container.encode(self.description, forKey: .type)
    }
}
