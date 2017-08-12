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

/// Appearance Category
///
public enum AppearanceCategory: String {

    case none                   = "None"
    case generic                = "Generic"
    case watch                  = "Watch"
    case thermometer            = "Thermometer"
    case heartRate              = "Heart Rate"
    case bloodPressure          = "Blood Pressure"
    case hid                    = "HID"
    case runningWalking         = "Running Walking Sensor"
    case cycling                = "Cycling"
    case control                = "Control"
    case sensor                 = "Sensor"
    case lightFixture           = "Light Fixture"
    case fan                    = "Fan"
    case hvac                   = "HVAC"
    case heater                 = "Heater"
    case access                 = "Access"
    case motorized              = "Motorized"
    case power                  = "Power"
    case light                  = "Light"
    case pulseOximeter          = "Pulse Oximeter"
    case weightScale            = "Weight Scale"
    case personalMobility       = "Personal Mobility"
    case continuousGlucose      = "Continuous Glucose"
    case outdoorSportsActivity  = "Outdoor Sports Activity"
}


/// Appearance
///
public enum Appearance: UInt16 {

    case unknown                                    = 0
    case phone                                      = 1
    case computer                                   = 64
    case watch                                      = 192
    case sportsWatch                                = 193
    case clock                                      = 256
    case display                                    = 320
    case remoteControl                              = 384
    case eyeGlasses                                 = 448
    case tag                                        = 512
    case keyRing                                    = 576
    case mediaPlayer                                = 640
    case barcodeScanner                             = 704
    case thermometer                                = 768
    case earThermometer                             = 769
    case heartRateSensor                            = 832
    case beltHeartRateSensor                        = 833
    case bloodPressure                              = 896
    case armBloodPressure                           = 897
    case wristBloodPressure                         = 898
    case humanInterfaceDevice                       = 960
    case keyboard                                   = 961
    case mouse                                      = 962
    case joystick                                   = 963
    case gamepad                                    = 964
    case digitizerTablet                            = 965
    case cardReader                                 = 966
    case digitalPen                                 = 967
    case barcodeScannerHumanInterfaceDevice         = 968
    case glucoseMeter                               = 1024
    case runningWalkingSensor                       = 1088
    case inShoeRunningWalkingSensor                 = 1089
    case onShoeRunningWalkingSensor                 = 1090
    case onHipRunningWalkingSensor                  = 1091
    case cycling                                    = 1152
    case computerCycling                            = 1153
    case speedSensor                                = 1154
    case cadenceSensor                              = 1155
    case powerSensor                                = 1156
    case speedAndCadenceSensor                      = 1157
    case controlDevice                              = 1216
    case switchControlDevice                        = 1217
    case multiSwitchControlDevice                   = 1218
    case buttonControlDevice                        = 1219
    case sliderControlDevice                        = 1220
    case rotaryControlDevice                        = 1221
    case touchPanelControlDevice                    = 1222
    case networkDevice                              = 1280
    case accessPointNetworkDevice                   = 1281
    case genericSensor                              = 1344
    case motionSensor                               = 1345
    case airQualitySensor                           = 1346
    case temperatureSensor                          = 1347
    case humiditySensor                             = 1348
    case leakSensor                                 = 1349
    case smokeSensor                                = 1350
    case occupancySensor                            = 1351
    case contactSensor                              = 1352
    case carbonMonoxideSensor                       = 1353
    case carbonDioxideSensor                        = 1354
    case ambientLightSensor                         = 1355
    case energySensor                               = 1356
    case colorLightSensor                           = 1357
    case rainSensor                                 = 1358
    case fireSensor                                 = 1359
    case windSensor                                 = 1360
    case proximitySensor                            = 1361
    case multiSensor                                = 1362
    case genericLightFixture                        = 1408
    case wallLightFixture                           = 1409
    case ceilingLightFixture                        = 1410
    case floorLightFixture                          = 1411
    case cabinetLightFixture                        = 1412
    case deskLightFixture                           = 1413
    case trofferLightFixture                        = 1414
    case pendantLightFixture                        = 1415
    case inGroundLightFixture                       = 1416
    case floodLightFixture                          = 1417
    case underwaterLightFixture                     = 1418
    case bollardWithLightFixture                    = 1419
    case pathwayLightFixture                        = 1420
    case gardenLightFixture                         = 1421
    case poleTopLightFixture                        = 1422
    case spotLightFixture                           = 1423
    case linearLightFixture                         = 1424
    case streetLightFixture                         = 1425
    case shelvesLightFixture                        = 1426
    case highBaylowBayLightFixture                  = 1427
    case emergancyExitLightFixture                  = 1428
    case genericFan                                 = 1472
    case ceilingFan                                 = 1473
    case axialFan                                   = 1474
    case exhaustFan                                 = 1475
    case pedastalFan                                = 1476
    case deskFan                                    = 1477
    case wallFan                                    = 1478
    case genericHvac                                = 1536
    case thermostat                                 = 1537
    case genericAirConditioning                     = 1600
    case genericHumidifier                          = 1664
    case genericHeating                             = 1728
    case radiator                                   = 1729
    case boiler                                     = 1730
    case heatPump                                   = 1731
    case infraredHeater                             = 1732
    case radiantPanelHeater                         = 1733
    case fanHeater                                  = 1734
    case airCurtain                                 = 1735
    case genericAccessControl                       = 1792
    case accessDoor                                 = 1793
    case garageDoor                                 = 1794
    case emergencyExitDoor                          = 1795
    case accessLock                                 = 1796
    case elevator                                   = 1797
    case window                                     = 1798
    case entranceGate                               = 1799
    case genericMotorizedDevice                     = 1856
    case motorizedGate                              = 1857
    case awning                                     = 1858
    case blindsOrShades                             = 1859
    case curtains                                   = 1860
    case screen                                     = 1861
    case genericPowerDevice                         = 1920
    case powerOutlit                                = 1921
    case powerStrip                                 = 1922
    case powerSupply                                = 1923
    case ledDriver                                  = 1924
    case fluorescentLampGear                        = 1925
    case hidLampGear                                = 1926
    case genericLightSource                         = 1984
    case incandescentLightBulb                      = 1985
    case ledBulb                                    = 1986
    case hidLamp                                    = 1987
    case fluorescentLamp                            = 1988
    case ledArray                                   = 1989
    case multiColorLedArray                         = 1990
    case genericPulseOximeter                       = 3136
    case fingertipPulseOximeter                     = 3137
    case wristWornPulseOximeter                     = 3138
    case genericWeightScale                         = 3200
    case genericPersonalMobilityDevice              = 3264
    case poweredWheelchair                          = 3265
    case mobilityScooter                            = 3266
    case genericContinuousGlucoseMonitor            = 5184
    case locationDisplayDevice                      = 5185
    case locationPod                                = 5187
    case locationNavigationPod                      = 5188

}

