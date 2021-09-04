//
//  CompanyIdentifier.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 11/11/17.
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

// MARK: - Well Known Companies
public extension CompanyIdentifier {

    /// This value has special meaning depending on the context in which it used.
    /// - Link Manager Protocol (LMP): This value may be used in the internal and interoperability tests before a Company ID has been assigned. This value shall not be used in shipping end products.
    /// - Device ID Profile: This value is reserved as the default vendor ID when no Device ID service record is present in a remote device
    class var reserved: CompanyIdentifier { return CompanyIdentifier(id: 65535, name: "reserved") }
    /// Ericsson Technology Licensing
    class var ericssonTechnology: CompanyIdentifier { return CompanyIdentifier(id: 0, name: "Ericsson Technology Licensing") }
    /// Nokia Mobile Phones
    class var nokiaMobilePhone: CompanyIdentifier { return CompanyIdentifier(id: 1, name: "Nokia Mobile Phones") }
    /// Intel Corp.
    class var intel: CompanyIdentifier { return CompanyIdentifier(id: 2, name: "Intel Corp") }
    /// IBM Corp.
    class var ibm: CompanyIdentifier { return CompanyIdentifier(id: 3, name: "IBM Corp") }
    /// Toshiba Corp.
    class var toshibaCorp: CompanyIdentifier { return CompanyIdentifier(id: 4, name: "Toshiba Corp") }
    /// 3Com
    class var threeCom: CompanyIdentifier { return CompanyIdentifier(id: 5, name: "3Com") }
    /// Microsoft
    class var microsoft: CompanyIdentifier { return CompanyIdentifier(id: 6, name: "Microsoft") }
    /// Lucent
    class var lucent: CompanyIdentifier { return CompanyIdentifier(id: 7, name: "Lucent") }
    /// Motorola
    class var motorola: CompanyIdentifier { return CompanyIdentifier(id: 8, name: "Motorola") }
    /// Infineon Technologies AG
    class var infineonTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 9, name: "Infineon Technologies AG") }
    /// Cambridge Silicon Radio
    class var cambridgeSiliconRadio: CompanyIdentifier { return CompanyIdentifier(id: 10, name: "Cambridge Silicon Radio") }
    /// Silicon Wave
    class var siliconWave: CompanyIdentifier { return CompanyIdentifier(id: 11, name: "Silicon Wave") }
    /// Digianswer A/S
    class var digianswer: CompanyIdentifier { return CompanyIdentifier(id: 12, name: "Digianswer A/S") }
    /// Texas Instruments Inc.
    class var texasInstruments: CompanyIdentifier { return CompanyIdentifier(id: 13, name: "Texas Instruments Inc.") }
    /// Parthus Technologies Inc.
    class var parthusTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 14, name: "Parthus Technologies Inc.") }
    /// Broadcom Corporation
    class var broadcom: CompanyIdentifier { return CompanyIdentifier(id: 15, name: "Broadcom Corporation") }
    /// Mitel Semiconductor
    class var mitelSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 16, name: "Mitel Semiconductor") }
    /// Widcomm, Inc.
    class var windcomm: CompanyIdentifier { return CompanyIdentifier(id: 17, name: "Widcomm, Inc.") }
    /// Zeevo, Inc.
    class var zeevo: CompanyIdentifier { return CompanyIdentifier(id: 18, name: "Zeevo, Inc.") }
    /// Atmel Corporation
    class var atmel: CompanyIdentifier { return CompanyIdentifier(id: 19, name: "Atmel Corporation") }
    /// Mitsubishi Electric Corporation
    class var mitsubishi: CompanyIdentifier { return CompanyIdentifier(id: 20, name: "Mitsubishi Electric Corporation") }
    /// RTX Telecom A/S
    class var rtxTelecom: CompanyIdentifier { return CompanyIdentifier(id: 21, name: "RTX Telecom A/S") }
    /// KC Technology Inc.
    class var kcTechnology: CompanyIdentifier { return CompanyIdentifier(id: 22, name: "KC Technology Inc.") }
    /// Newlogic
    class var newlogic: CompanyIdentifier { return CompanyIdentifier(id: 23, name: "Newlogic") }
    /// Transilica, Inc.
    class var transilica: CompanyIdentifier { return CompanyIdentifier(id: 24, name: "Transilica, Inc.") }
    /// Rohde & Schwarz GmbH & Co. KG
    class var rohdeAndSchwarz: CompanyIdentifier { return CompanyIdentifier(id: 25, name: "Rohde & Schwarz GmbH & Co. KG") }
    /// TTPCom Limited
    class var ttpCom: CompanyIdentifier { return CompanyIdentifier(id: 26, name: "TTPCom Limited") }
    /// Signia Technologies, Inc.
    class var signiaTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 27, name: "Signia Technologies, Inc.") }
    /// Conexant Systems Inc.
    class var conexantSystems: CompanyIdentifier { return CompanyIdentifier(id: 28, name: "Conexant Systems Inc.") }
    /// Qualcomm
    class var qualcomm: CompanyIdentifier { return CompanyIdentifier(id: 29, name: "Qualcomm") }
    /// Inventel
    class var inventel: CompanyIdentifier { return CompanyIdentifier(id: 30, name: "Inventel") }
    /// AVM Berlin
    class var avmBerlin: CompanyIdentifier { return CompanyIdentifier(id: 31, name: "AVM Berlin") }
    /// BandSpeed, Inc.
    class var bandSpeed: CompanyIdentifier { return CompanyIdentifier(id: 32, name: "BandSpeed, Inc.") }
    /// Mansella Ltd
    class var mansella: CompanyIdentifier { return CompanyIdentifier(id: 33, name: "Mansella Ltd") }
    /// NEC Corporation
    class var nec: CompanyIdentifier { return CompanyIdentifier(id: 34, name: "NEC Corporation") }
    /// WavePlus Technology Co., Ltd.
    class var wavePlusTechnology: CompanyIdentifier { return CompanyIdentifier(id: 35, name: "WavePlus Technology Co., Ltd.") }
    /// Alcatel
    class var alcatel: CompanyIdentifier { return CompanyIdentifier(id: 36, name: "Alcatel") }
    /// NXP Semiconductors (formerly Philips Semiconductors)
    class var nxpSemiconductors: CompanyIdentifier { return CompanyIdentifier(id: 37, name: "NXP Semiconductors") }
    /// C Technologies
    class var cTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 38, name: "C Technologies") }
    /// Open Interface
    class var openInterface: CompanyIdentifier { return CompanyIdentifier(id: 39, name: "Open Interface") }
    /// R F Micro Devices
    class var rfMicroDevices: CompanyIdentifier { return CompanyIdentifier(id: 40, name: "R F Micro Devices") }
    /// Hitachi Ltd
    class var hitachi: CompanyIdentifier { return CompanyIdentifier(id: 41, name: "Hitachi Ltd") }
    /// Symbol Technologies, Inc.
    class var symbolTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 42, name: "Symbol Technologies, Inc.") }
    /// Tenovis
    class var tenovis: CompanyIdentifier { return CompanyIdentifier(id: 43, name: "Tenovis") }
    /// Macronix International Co. Ltd.
    class var macronix: CompanyIdentifier { return CompanyIdentifier(id: 44, name: "Macronix International Co. Ltd.") }
    /// GCT Semiconductor
    class var gctSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 45, name: "GCT Semiconductor") }
    /// Norwood Systems
    class var norwoodSystems: CompanyIdentifier { return CompanyIdentifier(id: 46, name: "Norwood Systems") }
    /// MewTel Technology Inc.
    class var mewTelTechnology: CompanyIdentifier { return CompanyIdentifier(id: 47, name: "MewTel Technology Inc.") }
    /// ST Microelectronics
    class var stMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 48, name: "ST Microelectronics") }
    /// Synopsys, Inc.
    class var synopsys: CompanyIdentifier { return CompanyIdentifier(id: 49, name: "Synopsys, Inc.") }
    /// Red-M (Communications) Ltd
    class var redMCommunications: CompanyIdentifier { return CompanyIdentifier(id: 50, name: "Red-M (Communications) Ltd") }
    /// Computer Access Technology Corporation (CATC)
    class var computerAccessTechnology: CompanyIdentifier { return CompanyIdentifier(id: 52, name: "Computer Access Technology Corporation (CATC)") }
    /// Eclipse (HQ Espana) S.L.
    class var eclipse: CompanyIdentifier { return CompanyIdentifier(id: 53, name: "Eclipse (HQ Espana) S.L.") }
    /// Renesas Electronics Corporation
    class var renesasElectronics: CompanyIdentifier { return CompanyIdentifier(id: 54, name: "Renesas Electronics Corporation") }
    /// Mobilian Corporation
    class var mobilianCorporation: CompanyIdentifier { return CompanyIdentifier(id: 55, name: "Mobilian Corporation") }
    /// Terax
    class var terax: CompanyIdentifier { return CompanyIdentifier(id: 56, name: "Terax") }
    /// Integrated System Solution Corp.
    class var integratedSystemSolutionCorp: CompanyIdentifier { return CompanyIdentifier(id: 57, name: "Integrated System Solution Corp.") }
    /// Matsushita Electric Industrial Co., Ltd..
    class var matsushita: CompanyIdentifier { return CompanyIdentifier(id: 58, name: "Matsushita Electric Industrial Co., Ltd.") }
    /// Gennum Corporation
    class var gennumCorporation: CompanyIdentifier { return CompanyIdentifier(id: 59, name: "Gennum Corporation") }
    /// BlackBerry Limited (formerly Research In Motion)
    class var blackberry: CompanyIdentifier { return CompanyIdentifier(id: 60, name: "BlackBerry Limited") }
    /// IPextreme, Inc.
    class var iPextreme: CompanyIdentifier { return CompanyIdentifier(id: 61, name: "IPextreme, Inc.") }
    /// Systems and Chips, Inc
    class var systemsAndChips: CompanyIdentifier { return CompanyIdentifier(id: 62, name: "Systems and Chips, Inc") }
    /// Bluetooth SIG, Inc
    class var bluetoothSIG: CompanyIdentifier { return CompanyIdentifier(id: 63, name: "Bluetooth SIG, Inc") }
    /// Seiko Epson Corporation
    class var seikoEpsonCorporation: CompanyIdentifier { return CompanyIdentifier(id: 64, name: "Seiko Epson Corporation") }
    /// Integrated Silicon Solution Taiwan, Inc.
    class var integratedSiliconSolution: CompanyIdentifier { return CompanyIdentifier(id: 65, name: "Integrated Silicon Solution Taiwan, Inc.") }
    /// CONWISE Technology Corporation Ltd
    class var conwiseTechnology: CompanyIdentifier { return CompanyIdentifier(id: 66, name: "CONWISE Technology Corporation Ltd") }
    /// PARROT AUTOMOTIVE SAS
    class var parrotAutomotive: CompanyIdentifier { return CompanyIdentifier(id: 67, name: "PARROT AUTOMOTIVE SAS") }
    /// Socket Mobile
    class var socketMobile: CompanyIdentifier { return CompanyIdentifier(id: 68, name: "Socket Mobile") }
    /// Atheros Communications, Inc.
    class var atherosCommunications: CompanyIdentifier { return CompanyIdentifier(id: 69, name: "Atheros Communications, Inc.") }
    /// MediaTek, Inc.
    class var mediaTek: CompanyIdentifier { return CompanyIdentifier(id: 70, name: "MediaTek, Inc.") }
    /// Bluegiga
    class var bluegiga: CompanyIdentifier { return CompanyIdentifier(id: 71, name: "Bluegiga") }
    /// Marvell Technology Group Ltd.
    class var marvellTechnology: CompanyIdentifier { return CompanyIdentifier(id: 72, name: "Marvell Technology Group Ltd.") }
    /// 3DSP Corporation
    class var threeDSPCorporation: CompanyIdentifier { return CompanyIdentifier(id: 73, name: "3DSP Corporation") }
    /// Accel Semiconductor Ltd.
    class var accelSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 74, name: "Accel Semiconductor Ltd.") }
    /// Continental Automotive Systems
    class var continentalAutomotiveSystems: CompanyIdentifier { return CompanyIdentifier(id: 75, name: "Continental Automotive Systems") }
    /// Apple Inc.
    class var apple: CompanyIdentifier { return CompanyIdentifier(id: 76, name: "Apple Inc.") }
    /// Staccato Communications, Inc.
    class var staccatoCommunications: CompanyIdentifier { return CompanyIdentifier(id: 77, name: "Staccato Communications, Inc.") }
    /// Avago Technologies
    class var avagoTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 78, name: "Avago Technologies") }
    /// APT Ltd.
    class var aptLtd: CompanyIdentifier { return CompanyIdentifier(id: 79, name: "APT Ltd.") }
    /// SiRF Technology, Inc.
    class var sirfTechnology: CompanyIdentifier { return CompanyIdentifier(id: 80, name: "SiRF Technology, Inc.") }
    /// SiRF Technology, Inc.
    class var tzeroTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 81, name: "Tzero Technologies, Inc.") }
    /// J&M Corporation
    class var jMCorporation: CompanyIdentifier { return CompanyIdentifier(id: 82, name: "J&M Corporation") }
    /// Free2move AB
    class var free2Move: CompanyIdentifier { return CompanyIdentifier(id: 83, name: "Free2move AB") }
    /// 3DiJoy Corporation
    class var threeDiJoy: CompanyIdentifier { return CompanyIdentifier(id: 84, name: "3DiJoy Corporation") }
    /// Plantronics, Inc.
    class var plantronics: CompanyIdentifier { return CompanyIdentifier(id: 85, name: "Plantronics, Inc.") }
    /// Sony Ericsson Mobile Communications
    class var sonyEricassonMobile: CompanyIdentifier { return CompanyIdentifier(id: 86, name: "Sony Ericsson Mobile Communications") }
    /// Harman International Industries, Inc.
    class var harmanInternational: CompanyIdentifier { return CompanyIdentifier(id: 87, name: "Harman International Industries, Inc.") }
    /// Vizio, Inc.
    class var vizio: CompanyIdentifier { return CompanyIdentifier(id: 88, name: "Vizio, Inc.") }
    /// Nordic Semiconductor ASA
    class var nordicSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 89, name: "Nordic Semiconductor ASA") }
    /// EM Microelectronic-Marin SA
    class var emMicroeletronic: CompanyIdentifier { return CompanyIdentifier(id: 90, name: "EM Microelectronic-Marin SA") }
    /// Ralink Technology Corporation
    class var ralinkTechnology: CompanyIdentifier { return CompanyIdentifier(id: 91, name: "Ralink Technology Corporation") }
    /// Belkin International, Inc.
    class var belkin: CompanyIdentifier { return CompanyIdentifier(id: 92, name: "Belkin International, Inc.") }
    /// Realtek Semiconductor Corporation
    class var realtekSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 93, name: "Realtek Semiconductor Corporation") }
    /// Stonestreet One, LLC
    class var stonestreetOne: CompanyIdentifier { return CompanyIdentifier(id: 94, name: "Stonestreet One, LLC") }
    /// Wicentric, Inc.
    class var wicentric: CompanyIdentifier { return CompanyIdentifier(id: 95, name: "Wicentric, Inc.") }
    /// RivieraWaves S.A.S
    class var rivieraWaves: CompanyIdentifier { return CompanyIdentifier(id: 96, name: "RivieraWaves S.A.S") }
    /// RDA Microelectronics
    class var rdaMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 97, name: "RDA Microelectronics") }
    /// Gibson Guitars
    class var gibsonGuitars: CompanyIdentifier { return CompanyIdentifier(id: 98, name: "Gibson Guitars") }
    /// MiCommand Inc.
    class var miCommand: CompanyIdentifier { return CompanyIdentifier(id: 99, name: "MiCommand Inc.") }
    /// Band XI International, LLC
    class var bandXI: CompanyIdentifier { return CompanyIdentifier(id: 100, name: "Band XI International, LLC") }
    /// Hewlett-Packard Company
    class var hewlettPackard: CompanyIdentifier { return CompanyIdentifier(id: 101, name: "Hewlett-Packard Company") }
    /// 9Solutions Oy
    class var nineSolutions: CompanyIdentifier { return CompanyIdentifier(id: 102, name: "9Solutions Oy") }
    /// GN Netcom A/S
    class var gnNetcom: CompanyIdentifier { return CompanyIdentifier(id: 103, name: "GN Netcom A/S") }
    /// General Motors
    class var generalMotors: CompanyIdentifier { return CompanyIdentifier(id: 104, name: "General Motors") }
    /// A&D Engineering, Inc.
    class var adEngineering: CompanyIdentifier { return CompanyIdentifier(id: 105, name: "A&D Engineering, Inc.") }
    /// MindTree Ltd.
    class var mindTree: CompanyIdentifier { return CompanyIdentifier(id: 106, name: "MindTree Ltd.") }
    /// Polar Electro OY
    class var polar: CompanyIdentifier { return CompanyIdentifier(id: 107, name: "Polar Electro OY") }
    /// Beautiful Enterprise Co., Ltd.
    class var beautifulEnterprise: CompanyIdentifier { return CompanyIdentifier(id: 108, name: "Beautiful Enterprise Co., Ltd.") }
    /// BriarTek, Inc
    class var briarTek: CompanyIdentifier { return CompanyIdentifier(id: 109, name: "BriarTek, Inc") }
    /// Summit Data Communications, Inc
    class var summitDataCommunications: CompanyIdentifier { return CompanyIdentifier(id: 110, name: "Summit Data Communications, Inc") }
    /// Sound ID
    class var soundID: CompanyIdentifier { return CompanyIdentifier(id: 111, name: "Sound ID") }
    /// Monster, LLC
    class var monster: CompanyIdentifier { return CompanyIdentifier(id: 112, name: "Monster, LLC") }
    /// connectBlue AB
    class var connectBlue: CompanyIdentifier { return CompanyIdentifier(id: 113, name: "connectBlue AB") }
    /// ShangHai Super Smart Electronics Co. Ltd.
    class var shangHaiSuperSmart: CompanyIdentifier { return CompanyIdentifier(id: 114, name: "ShangHai Super Smart Electronics Co. Ltd.") }
    /// Group Sense Ltd.
    class var groupSense: CompanyIdentifier { return CompanyIdentifier(id: 115, name: "Group Sense Ltd.") }
    /// Zomm, LLC
    class var zomm: CompanyIdentifier { return CompanyIdentifier(id: 116, name: "Zomm, LLC") }
    /// Samsung Electronics Co. Ltd.
    class var samsungElectronics: CompanyIdentifier { return CompanyIdentifier(id: 117, name: "Samsung Electronics Co. Ltd.") }
    /// Creative Technology Ltd.
    class var creativeTechnology: CompanyIdentifier { return CompanyIdentifier(id: 118, name: "Creative Technology Ltd.") }
    /// Laird Technologies
    class var lairdTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 119, name: "Laird Technologies") }
    /// Nike, Inc.
    class var nike: CompanyIdentifier { return CompanyIdentifier(id: 120, name: "Nike, Inc.") }
    /// lesswire AG
    class var lesswire: CompanyIdentifier { return CompanyIdentifier(id: 121, name: "lesswire AG") }
    /// MStar Semiconductor, Inc.
    class var mStarSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 122, name: "MStar Semiconductor, Inc.") }
    /// Hanlynn Technologies
    class var hanlynnTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 123, name: "Hanlynn Technologies") }
    /// A & R Cambridge
    class var aAndRCambridge: CompanyIdentifier { return CompanyIdentifier(id: 124, name: "A & R Cambridge") }
    /// Seers Technology Co., Ltd.
    class var seersTechnology: CompanyIdentifier { return CompanyIdentifier(id: 125, name: "Seers Technology Co., Ltd.") }
    /// Sports Tracking Technologies Ltd.
    class var sportsTrackingTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 126, name: "Sports Tracking Technologies Ltd.") }
    /// Autonet Mobile
    class var autonetMobile: CompanyIdentifier { return CompanyIdentifier(id: 127, name: "Autonet Mobile") }
    /// DeLorme Publishing Company, Inc.
    class var deLormePublishing: CompanyIdentifier { return CompanyIdentifier(id: 128, name: "DeLorme Publishing Company, Inc.") }
    /// WuXi Vimicro
    class var wuXiVimicro: CompanyIdentifier { return CompanyIdentifier(id: 129, name: "WuXi Vimicro") }
    /// Sennheiser Communications A/S
    class var sennheiser: CompanyIdentifier { return CompanyIdentifier(id: 130, name: "Sennheiser Communications A/S") }
    /// TimeKeeping Systems, Inc.
    class var timeKeepingSystems: CompanyIdentifier { return CompanyIdentifier(id: 131, name: "TimeKeeping Systems, Inc.") }
    /// Ludus Helsinki Ltd.
    class var ludusHelsinki: CompanyIdentifier { return CompanyIdentifier(id: 132, name: "Ludus Helsinki Ltd.") }
    /// BlueRadios, Inc.
    class var blueRadios: CompanyIdentifier { return CompanyIdentifier(id: 133, name: "BlueRadios, Inc.") }
    /// Equinux AG
    class var equinux: CompanyIdentifier { return CompanyIdentifier(id: 134, name: "Equinux AG") }
    /// Garmin International, Inc.
    class var garmin: CompanyIdentifier { return CompanyIdentifier(id: 135, name: "Garmin International, Inc.") }
    /// Ecotest
    class var ecotest: CompanyIdentifier { return CompanyIdentifier(id: 136, name: "Ecotest") }
    /// GN ReSound A/S
    class var gnResound: CompanyIdentifier { return CompanyIdentifier(id: 137, name: "GN ReSound A/S") }
    /// Jawbone
    class var jawbone: CompanyIdentifier { return CompanyIdentifier(id: 138, name: "Jawbone") }
    /// Topcon Positioning Systems, LLC
    class var topconPositioningSystems: CompanyIdentifier { return CompanyIdentifier(id: 139, name: "Topcon Positioning Systems, LLC") }
    /// Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)
    class var gimbal: CompanyIdentifier { return CompanyIdentifier(id: 140, name: "Gimbal Inc.") }
    /// Zscan Software
    class var zScanSoftware: CompanyIdentifier { return CompanyIdentifier(id: 141, name: "Zscan Software") }
    /// Quintic Corp
    class var quinticCorp: CompanyIdentifier { return CompanyIdentifier(id: 142, name: "Quintic Corp") }
    /// Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)
    class var telitWireless: CompanyIdentifier { return CompanyIdentifier(id: 143, name: "Telit Wireless Solutions") }
    /// Funai Electric Co., Ltd.
    class var funaiElectric: CompanyIdentifier { return CompanyIdentifier(id: 144, name: "Funai Electric Co., Ltd.") }
    /// Advanced PANMOBIL systems GmbH & Co. KG
    class var advancedPanmobil: CompanyIdentifier { return CompanyIdentifier(id: 145, name: "Advanced PANMOBIL systems GmbH & Co. KG") }
    /// ThinkOptics, Inc.
    class var thinkOptics: CompanyIdentifier { return CompanyIdentifier(id: 146, name: "ThinkOptics, Inc.") }
    /// Universal Electronics, Inc.
    class var universalElectronics: CompanyIdentifier { return CompanyIdentifier(id: 147, name: "Universal Electronics, Inc.") }
    /// Airoha Technology Corp.
    class var airohaTechnology: CompanyIdentifier { return CompanyIdentifier(id: 148, name: "Airoha Technology Corp.") }
    /// NEC Lighting, Ltd.
    class var necLighting: CompanyIdentifier { return CompanyIdentifier(id: 149, name: "NEC Lighting, Ltd.") }
    /// ODM Technology, Inc.
    class var odmTechnology: CompanyIdentifier { return CompanyIdentifier(id: 150, name: "ODM Technology, Inc.") }
    /// ConnecteDevice Ltd.
    class var connecteDevice: CompanyIdentifier { return CompanyIdentifier(id: 151, name: "ConnecteDevice Ltd.") }
    /// zero1.tv GmbH
    class var zero1TV: CompanyIdentifier { return CompanyIdentifier(id: 152, name: "zero1.tv GmbH") }
    /// i.Tech Dynamic Global Distribution Ltd.
    class var iTechDynamic: CompanyIdentifier { return CompanyIdentifier(id: 153, name: "i.Tech Dynamic Global Distribution Ltd.") }
    /// Alpwise
    class var alpwise: CompanyIdentifier { return CompanyIdentifier(id: 154, name: "Alpwise") }
    /// Jiangsu Toppower Automotive Electronics Co., Ltd.
    class var jiangsuToppower: CompanyIdentifier { return CompanyIdentifier(id: 155, name: "Jiangsu Toppower Automotive Electronics Co., Ltd.") }
    /// Colorfy, Inc.
    class var colorfy: CompanyIdentifier { return CompanyIdentifier(id: 156, name: "Colorfy, Inc.") }
    /// Geoforce Inc.
    class var geoforce: CompanyIdentifier { return CompanyIdentifier(id: 157, name: "Geoforce Inc.") }
    /// Bose Corporation
    class var bose: CompanyIdentifier { return CompanyIdentifier(id: 158, name: "Bose Corporation") }
    /// Suunto Oy
    class var suunto: CompanyIdentifier { return CompanyIdentifier(id: 159, name: "Suunto Oy") }
    /// Kensington Computer Products Group
    class var kennsington: CompanyIdentifier { return CompanyIdentifier(id: 160, name: "Kensington Computer Products Group") }
    /// SR-Medizinelektronik
    class var srMedizinelektronik: CompanyIdentifier { return CompanyIdentifier(id: 161, name: "SR-Medizinelektronik") }
    /// Vertu Corporation Limited
    class var vertu: CompanyIdentifier { return CompanyIdentifier(id: 162, name: "Vertu Corporation Limited") }
    /// Meta Watch Ltd.
    class var metaWatch: CompanyIdentifier { return CompanyIdentifier(id: 163, name: "Meta Watch Ltd") }
    /// LINAK A/S
    class var linak: CompanyIdentifier { return CompanyIdentifier(id: 164, name: "LINAK A/S") }
    /// OTL Dynamics LLC
    class var otlDynamics: CompanyIdentifier { return CompanyIdentifier(id: 165, name: "OTL Dynamics LLC") }
    /// Panda Ocean Inc.
    class var pandaOcean: CompanyIdentifier { return CompanyIdentifier(id: 166, name: "Panda Ocean Inc") }
    /// Visteon Corporation
    class var visteonCorporation: CompanyIdentifier { return CompanyIdentifier(id: 167, name: "Visteon Corporation") }
    /// ARP Devices Limited
    class var arpDevices: CompanyIdentifier { return CompanyIdentifier(id: 168, name: "ARP Devices Limited") }
    /// Magneti Marelli S.p.A
    class var magnetiMarelli: CompanyIdentifier { return CompanyIdentifier(id: 169, name: "Magneti Marelli S.p.A") }
    /// CAEN RFID srl
    class var caenRfid: CompanyIdentifier { return CompanyIdentifier(id: 170, name: "CAEN RFID srl") }
    /// Ingenieur-Systemgruppe Zahn GmbH
    class var ingenieurSystemgruppe: CompanyIdentifier { return CompanyIdentifier(id: 171, name: "Ingenieur-Systemgruppe Zahn GmbH") }
    /// Green Throttle Games
    class var greenThrottleGames: CompanyIdentifier { return CompanyIdentifier(id: 172, name: "Green Throttle Games") }
    /// Peter Systemtechnik GmbH
    class var peterSystemtechnik: CompanyIdentifier { return CompanyIdentifier(id: 173, name: "Peter Systemtechnik GmbH") }
    /// Omegawave Oy
    class var omegawave: CompanyIdentifier { return CompanyIdentifier(id: 174, name: "Omegawave Oy") }
    /// Cinetix
    class var cinetix: CompanyIdentifier { return CompanyIdentifier(id: 175, name: "Cinetix") }
    /// Passif Semiconductor Corp
    class var passifSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 176, name: "Passif Semiconductor Corp") }
    /// Saris Cycling Group, Inc
    class var sarisCyclingGroup: CompanyIdentifier { return CompanyIdentifier(id: 177, name: "Saris Cycling Group, Inc") }
    /// Bekey A/S
    class var bekey: CompanyIdentifier { return CompanyIdentifier(id: 178, name: "Bekey A/S") }
    /// Clarinox Technologies Pty. Ltd.
    class var clarinoxTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 179, name: "Clarinox Technologies Pty. Ltd.") }
    /// BDE Technology Co., Ltd.
    class var bdeTechnology: CompanyIdentifier { return CompanyIdentifier(id: 180, name: "BDE Technology Co., Ltd.") }
    /// Swirl Networks
    class var swirlNetworks: CompanyIdentifier { return CompanyIdentifier(id: 181, name: "Swirl Networks") }
    /// Meso international
    class var mesoInternational: CompanyIdentifier { return CompanyIdentifier(id: 182, name: "Meso international") }
    /// TreLab Ltd
    class var treLab: CompanyIdentifier { return CompanyIdentifier(id: 183, name: "TreLab Ltd") }
    /// Qualcomm Innovation Center, Inc. (QuIC)
    class var qualcommInnovation: CompanyIdentifier { return CompanyIdentifier(id: 184, name: "Qualcomm Innovation Center, Inc. (QuIC)") }
    /// Johnson Controls, Inc.
    class var johnsonControls: CompanyIdentifier { return CompanyIdentifier(id: 185, name: "Johnson Controls, Inc.") }
    /// Starkey Laboratories Inc.
    class var starkeyLaboratories: CompanyIdentifier { return CompanyIdentifier(id: 186, name: "Starkey Laboratories Inc.") }
    /// S-Power Electronics Limited
    class var sPowerElectronics: CompanyIdentifier { return CompanyIdentifier(id: 187, name: "S-Power Electronics Limited") }
    /// Ace Sensor Inc
    class var aceSensor: CompanyIdentifier { return CompanyIdentifier(id: 188, name: "Ace Sensor Inc") }
    /// Aplix Corporation
    class var aplixCorporation: CompanyIdentifier { return CompanyIdentifier(id: 189, name: "Aplix Corporation") }
    /// AAMP of America
    class var aampOfAmerica: CompanyIdentifier { return CompanyIdentifier(id: 190, name: "AAMP of America") }
    /// Stalmart Technology Limited
    class var stalmartTechnology: CompanyIdentifier { return CompanyIdentifier(id: 191, name: "Stalmart Technology Limited") }
    /// AMICCOM Electronics Corporation
    class var amiccomElectronics: CompanyIdentifier { return CompanyIdentifier(id: 192, name: "AMICCOM Electronics Corporation") }
    /// Shenzhen Excelsecu Data Technology Co.,Ltd
    class var shenzhenExcelsecuData: CompanyIdentifier { return CompanyIdentifier(id: 193, name: "Shenzhen Excelsecu Data Technology Co.,Ltd") }
    /// Geneq Inc.
    class var geneqInc: CompanyIdentifier { return CompanyIdentifier(id: 194, name: "Geneq Inc.") }
    /// adidas AG
    class var adidas: CompanyIdentifier { return CompanyIdentifier(id: 195, name: "adidas AG") }
    /// LG Electronics
    class var lgElectronics: CompanyIdentifier { return CompanyIdentifier(id: 196, name: "LG Electronics") }
    /// Onset Computer Corporation
    class var onsetComputerCorporation: CompanyIdentifier { return CompanyIdentifier(id: 197, name: "Onset Computer Corporation") }
    /// Selfly BV
    class var selfly: CompanyIdentifier { return CompanyIdentifier(id: 198, name: "Selfly BV") }
    /// Quuppa Oy.
    class var quuppa: CompanyIdentifier { return CompanyIdentifier(id: 199, name: "Quuppa Oy.") }
    /// GeLo Inc
    class var geLo: CompanyIdentifier { return CompanyIdentifier(id: 200, name: "GeLo Inc") }
    /// Evluma
    class var evluma: CompanyIdentifier { return CompanyIdentifier(id: 201, name: "Evluma") }
    /// MC10
    class var mc10: CompanyIdentifier { return CompanyIdentifier(id: 202, name: "MC10") }
    /// Binauric SE
    class var binauric: CompanyIdentifier { return CompanyIdentifier(id: 203, name: "Binauric SE") }
    /// Beats Electronics
    class var beatsElectronics: CompanyIdentifier { return CompanyIdentifier(id: 204, name: "Beats Electronics") }
    /// Microchip Technology Inc.
    class var microchip: CompanyIdentifier { return CompanyIdentifier(id: 205, name: "Microchip Technology Inc.") }
    /// Elgato Systems GmbH
    class var elgato: CompanyIdentifier { return CompanyIdentifier(id: 206, name: "Elgato Systems GmbH") }
    /// ARCHOS SA
    class var archos: CompanyIdentifier { return CompanyIdentifier(id: 207, name: "ARCHOS SA") }
    /// Dexcom, Inc.
    class var dexcom: CompanyIdentifier { return CompanyIdentifier(id: 208, name: "Dexcom, Inc.") }
    /// Polar Electro Europe B.V.
    class var polarElectroEurope: CompanyIdentifier { return CompanyIdentifier(id: 209, name: "Polar Electro Europe B.V.") }
    /// Dialog Semiconductor B.V.
    class var dialogSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 210, name: "Dialog Semiconductor B.V.") }
    /// Taixingbang Technology (HK) Co,. LTD.
    class var taixingbangTechnology: CompanyIdentifier { return CompanyIdentifier(id: 211, name: "Taixingbang Technology (HK) Co,. LTD.") }
    /// Kawantech
    class var kawantech: CompanyIdentifier { return CompanyIdentifier(id: 212, name: "Kawantech") }
    /// Austco Communication Systems
    class var austcoCommunication: CompanyIdentifier { return CompanyIdentifier(id: 213, name: "Austco Communication Systems") }
    /// Timex Group USA, Inc.
    class var timex: CompanyIdentifier { return CompanyIdentifier(id: 214, name: "Timex Group USA, Inc.") }
    /// Qualcomm Technologies, Inc.
    class var qualcommTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 215, name: "Qualcomm Technologies, Inc.") }
    /// Qualcomm Connected Experiences, Inc.
    class var qualcommConnectedExperiences: CompanyIdentifier { return CompanyIdentifier(id: 216, name: "Qualcomm Connected Experiences, Inc.") }
    /// Voyetra Turtle Beach
    class var voyetra: CompanyIdentifier { return CompanyIdentifier(id: 217, name: "Voyetra Turtle Beach") }
    /// txtr GmbH
    class var txtr: CompanyIdentifier { return CompanyIdentifier(id: 218, name: "txtr GmbH") }
    /// Biosentronics
    class var biosentronics: CompanyIdentifier { return CompanyIdentifier(id: 219, name: "Biosentronics") }
    /// Procter & Gamble
    class var procterGamble: CompanyIdentifier { return CompanyIdentifier(id: 220, name: "Procter & Gamble") }
    /// Hosiden Corporation
    class var hosiden: CompanyIdentifier { return CompanyIdentifier(id: 221, name: "Hosiden Corporation") }
    /// Muzik LLC
    class var muzik: CompanyIdentifier { return CompanyIdentifier(id: 222, name: "Muzik LLC") }
    /// Misfit Wearables Corp
    class var misfit: CompanyIdentifier { return CompanyIdentifier(id: 223, name: "Misfit Wearables Corp") }
    /// Google
    class var google: CompanyIdentifier { return CompanyIdentifier(id: 224, name: "Google") }
    /// Danlers Ltd
    class var danlers: CompanyIdentifier { return CompanyIdentifier(id: 225, name: "Danlers Ltd") }
    /// Semilink Inc
    class var semilink: CompanyIdentifier { return CompanyIdentifier(id: 226, name: "Semilink Inc") }
    /// inMusic Brands, Inc
    class var inMusicBrands: CompanyIdentifier { return CompanyIdentifier(id: 227, name: "inMusic Brands, Inc") }
    /// L.S. Research Inc.
    class var lsResearch: CompanyIdentifier { return CompanyIdentifier(id: 228, name: "L.S. Research Inc.") }
    /// Eden Software Consultants Ltd.
    class var edenSoftwareConsultants: CompanyIdentifier { return CompanyIdentifier(id: 229, name: "Eden Software Consultants Ltd.") }
    /// Freshtemp
    class var freshtemp: CompanyIdentifier { return CompanyIdentifier(id: 230, name: "Freshtemp") }
    /// KS Technologies
    class var ksTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 231, name: "KS Technologies") }
    /// ACTS Technologies
    class var actsTechologies: CompanyIdentifier { return CompanyIdentifier(id: 232, name: "ACTS Technologies") }
    /// Vtrack Systems
    class var vtrackSystems: CompanyIdentifier { return CompanyIdentifier(id: 233, name: "Vtrack Systems") }
    /// Nielsen-Kellerman Company
    class var nielsenKellerman: CompanyIdentifier { return CompanyIdentifier(id: 234, name: "Nielsen-Kellerman Company") }
    /// Server Technology Inc.
    class var serverTechnology: CompanyIdentifier { return CompanyIdentifier(id: 235, name: "Server Technology Inc.") }
    /// BioResearch Associates
    class var bioResearchAssociates: CompanyIdentifier { return CompanyIdentifier(id: 236, name: "BioResearch Associates") }
    /// Jolly Logic, LLC
    class var jollyLogic: CompanyIdentifier { return CompanyIdentifier(id: 237, name: "Jolly Logic, LLC") }
    /// Above Average Outcomes, Inc.
    class var aboveAverageOutcomes: CompanyIdentifier { return CompanyIdentifier(id: 238, name: "Above Average Outcomes, Inc.") }
    /// Bitsplitters GmbH
    class var bitsplitters: CompanyIdentifier { return CompanyIdentifier(id: 239, name: "Bitsplitters GmbH") }
    /// PayPal, Inc.
    class var payPal: CompanyIdentifier { return CompanyIdentifier(id: 240, name: "PayPal, Inc.") }
    /// Witron Technology Limited
    class var witronTechnology: CompanyIdentifier { return CompanyIdentifier(id: 241, name: "Witron Technology Limited") }
    /// Morse Project Inc
    class var morseProject: CompanyIdentifier { return CompanyIdentifier(id: 242, name: "Morse Project Inc") }
    /// Kent Displays Inc.
    class var kentDisplays: CompanyIdentifier { return CompanyIdentifier(id: 243, name: "Kent Displays Inc.") }
    /// Nautilus Inc.
    class var nautilus: CompanyIdentifier { return CompanyIdentifier(id: 244, name: "Nautilus Inc.") }
    /// Smartifier Oy
    class var smartifier: CompanyIdentifier { return CompanyIdentifier(id: 245, name: "Smartifier Oy") }
    /// Elcometer Limited
    class var elcometer: CompanyIdentifier { return CompanyIdentifier(id: 246, name: "Elcometer Limited") }
    /// VSN Technologies, Inc.
    class var vsnTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 247, name: "VSN Technologies, Inc.") }
    /// AceUni Corp., Ltd.
    class var aceUniCorp: CompanyIdentifier { return CompanyIdentifier(id: 248, name: "AceUni Corp., Ltd.") }
    /// StickNFind
    class var stickNFind: CompanyIdentifier { return CompanyIdentifier(id: 249, name: "StickNFind") }
    /// Crystal Code AB
    class var crystalCode: CompanyIdentifier { return CompanyIdentifier(id: 250, name: "Crystal Code AB") }
    /// KOUKAAM a.s.
    class var koukaam: CompanyIdentifier { return CompanyIdentifier(id: 251, name: "KOUKAAM a.s.") }
    /// Delphi Corporation
    class var delphi: CompanyIdentifier { return CompanyIdentifier(id: 252, name: "Delphi Corporation") }
    /// ValenceTech Limited
    class var valenceTech: CompanyIdentifier { return CompanyIdentifier(id: 253, name: "ValenceTech Limited") }
    /// Stanley Black and Decker
    class var stanleyBlackAndDecker: CompanyIdentifier { return CompanyIdentifier(id: 254, name: "Stanley Black and Decker") }
    /// Typo Products, LLC
    class var typoProducts: CompanyIdentifier { return CompanyIdentifier(id: 255, name: "Typo Products, LLC") }
    /// TomTom International BV
    class var tomTom: CompanyIdentifier { return CompanyIdentifier(id: 256, name: "TomTom International BV") }
    /// Fugoo, Inc.
    class var fugoo: CompanyIdentifier { return CompanyIdentifier(id: 257, name: "Fugoo, Inc.") }
    /// Keiser Corporation
    class var keiser: CompanyIdentifier { return CompanyIdentifier(id: 258, name: "Keiser Corporation") }
    /// Bang & Olufsen A/S
    class var bangOlufsen: CompanyIdentifier { return CompanyIdentifier(id: 259, name: "Bang & Olufsen A/S") }
    /// PLUS Location Systems Pty Ltd
    class var plusLocationSystems: CompanyIdentifier { return CompanyIdentifier(id: 260, name: "PLUS Location Systems Pty Ltd") }
    /// Ubiquitous Computing Technology Corporation
    class var ubiquitousComputing: CompanyIdentifier { return CompanyIdentifier(id: 261, name: "Ubiquitous Computing Technology Corporation") }
    /// Innovative Yachtter Solutions
    class var innovativeYachtter: CompanyIdentifier { return CompanyIdentifier(id: 262, name: "Innovative Yachtter Solutions") }
    /// William Demant Holding A/S
    class var williamDemantHolding: CompanyIdentifier { return CompanyIdentifier(id: 263, name: "William Demant Holding A/S") }
    /// Chicony Electronics Co., Ltd.
    class var chiconyElectronics: CompanyIdentifier { return CompanyIdentifier(id: 264, name: "Chicony Electronics Co., Ltd.") }
    /// Atus BV
    class var atus: CompanyIdentifier { return CompanyIdentifier(id: 265, name: "Atus BV") }
    /// Codegate Ltd
    class var codegate: CompanyIdentifier { return CompanyIdentifier(id: 266, name: "Codegate Ltd") }
    /// ERi, Inc
    class var eri: CompanyIdentifier { return CompanyIdentifier(id: 267, name: "ERi, Inc") }
    /// Transducers Direct, LLC
    class var transducersDirect: CompanyIdentifier { return CompanyIdentifier(id: 268, name: "Transducers Direct, LLC") }
    /// Fujitsu Ten LImited
    class var fujitsuTen: CompanyIdentifier { return CompanyIdentifier(id: 269, name: "Fujitsu Ten LImited") }
    /// Audi AG
    class var audi: CompanyIdentifier { return CompanyIdentifier(id: 270, name: "Audi AG") }
    /// HiSilicon Technologies Col, Ltd
    class var hiSiliconTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 271, name: "HiSilicon Technologies Col, Ltd") }
    /// Nippon Seiki Co., Ltd.
    class var nipponSeiki: CompanyIdentifier { return CompanyIdentifier(id: 272, name: "Nippon Seiki Co., Ltd.") }
    /// Steelseries ApS
    class var steelseries: CompanyIdentifier { return CompanyIdentifier(id: 273, name: "Steelseries ApS") }
    /// Visybl Inc.
    class var visybl: CompanyIdentifier { return CompanyIdentifier(id: 274, name: "Visybl Inc.") }
    /// Openbrain Technologies, Co., Ltd.
    class var openbrainTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 275, name: "Openbrain Technologies, Co., Ltd.") }
    /// Xensr
    class var xensr: CompanyIdentifier { return CompanyIdentifier(id: 276, name: "Xensr") }
    /// e.solutions
    class var eSolutions: CompanyIdentifier { return CompanyIdentifier(id: 277, name: "e.solutions") }
    /// 10AK Technologies
    class var tenAKTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 278, name: "10AK Technologies") }
    /// Wimoto Technologies Inc
    class var wimotoTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 279, name: "Wimoto Technologies Inc") }
    /// Radius Networks, Inc.
    class var radiusNetworks: CompanyIdentifier { return CompanyIdentifier(id: 280, name: "Radius Networks, Inc.") }
    /// Wize Technology Co., Ltd.
    class var wizeTechnology: CompanyIdentifier { return CompanyIdentifier(id: 281, name: "Wize Technology Co., Ltd.") }
    /// Qualcomm Labs, Inc.
    class var qualcommLabs: CompanyIdentifier { return CompanyIdentifier(id: 282, name: "Qualcomm Labs, Inc.") }
    /// Aruba Networks
    class var arubaNetworks: CompanyIdentifier { return CompanyIdentifier(id: 283, name: "Aruba Networks") }
    /// Baidu
    class var baidu: CompanyIdentifier { return CompanyIdentifier(id: 284, name: "Baidu") }
    /// Arendi AG
    class var arendi: CompanyIdentifier { return CompanyIdentifier(id: 285, name: "Arendi AG") }
    /// Skoda Auto a.s.
    class var skoda: CompanyIdentifier { return CompanyIdentifier(id: 286, name: "Skoda Auto a.s.") }
    /// Volkswagen AG
    class var volkswagen: CompanyIdentifier { return CompanyIdentifier(id: 287, name: "Volkswagen AG") }
    /// Porsche AG
    class var porsche: CompanyIdentifier { return CompanyIdentifier(id: 288, name: "Porsche AG") }
    /// Sino Wealth Electronic Ltd.
    class var sinoWealthElectronic: CompanyIdentifier { return CompanyIdentifier(id: 289, name: "Sino Wealth Electronic Ltd.") }
    /// AirTurn, Inc
    class var airTurn: CompanyIdentifier { return CompanyIdentifier(id: 290, name: "AirTurn, Inc") }
    /// Kinsa, Inc
    class var kinsa: CompanyIdentifier { return CompanyIdentifier(id: 291, name: "Kinsa, Inc") }
    /// HID Global
    class var hidGlobal: CompanyIdentifier { return CompanyIdentifier(id: 292, name: "HID Global") }
    /// SEAT es
    class var seat: CompanyIdentifier { return CompanyIdentifier(id: 293, name: "SEAT es") }
    /// Promethean Ltd.
    class var promethean: CompanyIdentifier { return CompanyIdentifier(id: 294, name: "Promethean Ltd.") }
    /// Salutica Allied Solutions
    class var saluticaAllied: CompanyIdentifier { return CompanyIdentifier(id: 295, name: "Salutica Allied Solutions") }
    /// GPSI Group Pty Ltd
    class var gpsiGroup: CompanyIdentifier { return CompanyIdentifier(id: 296, name: "GPSI Group Pty Ltd") }
    /// Nimble Devices Oy
    class var nimbleDevices: CompanyIdentifier { return CompanyIdentifier(id: 297, name: "Nimble Devices Oy") }
    /// Changzhou Yongse Infotech Co., Ltd.
    class var changzhouYongseInfotech: CompanyIdentifier { return CompanyIdentifier(id: 298, name: "Changzhou Yongse Infotech Co., Ltd.") }
    /// SportIQ
    class var sportIq: CompanyIdentifier { return CompanyIdentifier(id: 299, name: "SportIQ") }
    /// TEMEC Instruments B.V.
    class var temecInstruments: CompanyIdentifier { return CompanyIdentifier(id: 300, name: "TEMEC Instruments B.V.") }
    /// Sony Corporation
    class var sony: CompanyIdentifier { return CompanyIdentifier(id: 301, name: "Sony Corporation") }
    /// ASSA ABLOY
    class var assaAbloy: CompanyIdentifier { return CompanyIdentifier(id: 302, name: "ASSA ABLOY") }
    /// Clarion Co. Inc.
    class var clarion: CompanyIdentifier { return CompanyIdentifier(id: 303, name: "Clarion Co. Inc.") }
    /// Warehouse Innovations
    class var warehouseInnovations: CompanyIdentifier { return CompanyIdentifier(id: 304, name: "Warehouse Innovations") }
    /// Cypress Semiconductor
    class var cypressSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 305, name: "Cypress Semiconductor") }
    /// MADS Inc
    class var madsInc: CompanyIdentifier { return CompanyIdentifier(id: 306, name: "MADS Inc") }
    /// Blue Maestro Limited
    class var blueMaestro: CompanyIdentifier { return CompanyIdentifier(id: 307, name: "Blue Maestro Limited") }
    /// Resolution Products, Ltd.
    class var resolutionProducts: CompanyIdentifier { return CompanyIdentifier(id: 308, name: "Resolution Products, Ltd.") }
    /// Aireware LLC
    class var aireware: CompanyIdentifier { return CompanyIdentifier(id: 309, name: "Aireware LLC") }
    /// Silvair, Inc.
    class var silvair: CompanyIdentifier { return CompanyIdentifier(id: 310, name: "Silvair, Inc.") }
    /// Prestigio Plaza Ltd.
    class var prestigioPlaza: CompanyIdentifier { return CompanyIdentifier(id: 311, name: "Prestigio Plaza Ltd.") }
    /// NTEO Inc.
    class var nteoInc: CompanyIdentifier { return CompanyIdentifier(id: 312, name: "NTEO Inc.") }
    /// Focus Systems Corporation
    class var focusSystems: CompanyIdentifier { return CompanyIdentifier(id: 313, name: "Focus Systems Corporation") }
    /// Tencent Holdings Ltd.
    class var tencent: CompanyIdentifier { return CompanyIdentifier(id: 314, name: "Tencent Holdings Ltd.") }
    /// Allegion
    class var allegion: CompanyIdentifier { return CompanyIdentifier(id: 315, name: "Allegion") }
    /// Murata Manufacturing Co., Ltd.
    class var murataManufacturing: CompanyIdentifier { return CompanyIdentifier(id: 316, name: "Murata Manufacturing Co., Ltd.") }
    /// WirelessWERX
    class var wirelessWerx: CompanyIdentifier { return CompanyIdentifier(id: 317, name: "WirelessWERX") }
    /// Nod, Inc.
    class var nodInc: CompanyIdentifier { return CompanyIdentifier(id: 318, name: "Nod, Inc.") }
    /// B&B Manufacturing Company
    class var bbManufacturing: CompanyIdentifier { return CompanyIdentifier(id: 319, name: "B&B Manufacturing Company") }
    /// Alpine Electronics (China) Co., Ltd
    class var alpineElectronicsChina: CompanyIdentifier { return CompanyIdentifier(id: 320, name: "Alpine Electronics (China) Co., Ltd") }
    /// FedEx Services
    class var fedEx: CompanyIdentifier { return CompanyIdentifier(id: 321, name: "FedEx Services") }
    /// Grape Systems Inc.
    class var grapeSystems: CompanyIdentifier { return CompanyIdentifier(id: 322, name: "Grape Systems Inc.") }
    /// Bkon Connect
    class var bkonConnect: CompanyIdentifier { return CompanyIdentifier(id: 323, name: "Bkon Connect") }
    /// Lintech GmbH
    class var lintech: CompanyIdentifier { return CompanyIdentifier(id: 324, name: "Lintech GmbH") }
    /// Novatel Wireless
    class var novatelWireless: CompanyIdentifier { return CompanyIdentifier(id: 325, name: "Novatel Wireless") }
    /// Ciright
    class var cirlight: CompanyIdentifier { return CompanyIdentifier(id: 326, name: "Ciright") }
    /// Mighty Cast, Inc.
    class var mightyCast: CompanyIdentifier { return CompanyIdentifier(id: 327, name: "Mighty Cast, Inc.") }
    /// Ambimat Electronics
    class var ambimatElectronics: CompanyIdentifier { return CompanyIdentifier(id: 328, name: "Ambimat Electronics") }
    /// Perytons Ltd.
    class var perytons: CompanyIdentifier { return CompanyIdentifier(id: 329, name: "Perytons Ltd.") }
    /// Tivoli Audio, LLC
    class var tivoliAudio: CompanyIdentifier { return CompanyIdentifier(id: 330, name: "Tivoli Audio, LLC") }
    /// Master Lock
    class var masterLock: CompanyIdentifier { return CompanyIdentifier(id: 331, name: "Master Lock") }
    /// Mesh-Net Ltd
    class var meshNet: CompanyIdentifier { return CompanyIdentifier(id: 332, name: "Mesh-Net Ltd") }
    /// HUIZHOU DESAY SV AUTOMOTIVE CO., LTD.
    class var huizhouDesay: CompanyIdentifier { return CompanyIdentifier(id: 333, name: "HUIZHOU DESAY SV AUTOMOTIVE CO., LTD.") }
    /// Tangerine, Inc.
    class var tangerine: CompanyIdentifier { return CompanyIdentifier(id: 334, name: "Tangerine, Inc.") }
    /// B&W Group Ltd.
    class var bwGroup: CompanyIdentifier { return CompanyIdentifier(id: 335, name: "B&W Group Ltd.") }
    /// Pioneer Corporation
    class var pioneer: CompanyIdentifier { return CompanyIdentifier(id: 336, name: "Pioneer Corporation") }
    /// OnBeep
    class var onBeep: CompanyIdentifier { return CompanyIdentifier(id: 337, name: "OnBeep") }
    /// Vernier Software & Technology
    class var vernierSoftware: CompanyIdentifier { return CompanyIdentifier(id: 338, name: "Vernier Software & Technology") }
    /// ROL Ergo
    class var rolErgo: CompanyIdentifier { return CompanyIdentifier(id: 339, name: "ROL Ergo") }
    /// Pebble Technology
    class var pebble: CompanyIdentifier { return CompanyIdentifier(id: 340, name: "Pebble Technology") }
    /// NETATMO
    class var netamo: CompanyIdentifier { return CompanyIdentifier(id: 341, name: "NETATMO") }
    /// Accumulate AB
    class var accumulate: CompanyIdentifier { return CompanyIdentifier(id: 342, name: "Accumulate AB") }
    /// Anhui Huami Information Technology Co., Ltd.
    class var anhuiHuami: CompanyIdentifier { return CompanyIdentifier(id: 343, name: "Anhui Huami Information Technology Co., Ltd.") }
    /// Inmite s.r.o.
    class var inmite: CompanyIdentifier { return CompanyIdentifier(id: 344, name: "Inmite s.r.o.") }
    /// ChefSteps, Inc.
    class var chefSteps: CompanyIdentifier { return CompanyIdentifier(id: 345, name: "ChefSteps, Inc.") }
    /// micas AG
    class var micas: CompanyIdentifier { return CompanyIdentifier(id: 346, name: "micas AG") }
    /// Biomedical Research Ltd.
    class var biomedicalResearch: CompanyIdentifier { return CompanyIdentifier(id: 347, name: "Biomedical Research Ltd.") }
    /// Pitius Tec S.L.
    class var pitiusTec: CompanyIdentifier { return CompanyIdentifier(id: 348, name: "Pitius Tec S.L.") }
    /// Estimote, Inc.
    class var estimote: CompanyIdentifier { return CompanyIdentifier(id: 349, name: "Estimote, Inc.") }
    /// Unikey Technologies, Inc.
    class var unikeyTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 350, name: "Unikey Technologies, Inc.") }
    /// Timer Cap Co.
    class var timerCap: CompanyIdentifier { return CompanyIdentifier(id: 351, name: "Timer Cap Co.") }
    /// AwoX
    class var awoX: CompanyIdentifier { return CompanyIdentifier(id: 352, name: "AwoX") }
    /// yikes
    class var yikes: CompanyIdentifier { return CompanyIdentifier(id: 353, name: "yikes") }
    /// MADSGlobalNZ Ltd.
    class var madsGlobal: CompanyIdentifier { return CompanyIdentifier(id: 354, name: "MADSGlobalNZ Ltd") }
    /// PCH International
    class var pchInternational: CompanyIdentifier { return CompanyIdentifier(id: 355, name: "PCH International") }
    /// Qingdao Yeelink Information Technology Co., Ltd.
    class var qingdaoYeelinkInformation: CompanyIdentifier { return CompanyIdentifier(id: 356, name: "Qingdao Yeelink Information Technology Co., Ltd.") }
    /// Milwaukee Tool (Formally Milwaukee Electric Tools)
    class var milwaukeeTool: CompanyIdentifier { return CompanyIdentifier(id: 357, name: "Milwaukee Tool") }
    /// MISHIK Pte Ltd
    class var mishikPte: CompanyIdentifier { return CompanyIdentifier(id: 358, name: "MISHIK Pte Ltd") }
    /// Bayer HealthCare
    class var bayerHealthCare: CompanyIdentifier { return CompanyIdentifier(id: 359, name: "Bayer HealthCare") }
    /// Spicebox LLC
    class var spicebox: CompanyIdentifier { return CompanyIdentifier(id: 360, name: "Spicebox LLC") }
    /// emberlight
    class var emberlight: CompanyIdentifier { return CompanyIdentifier(id: 361, name: "emberlight") }
    /// Cooper-Atkins Corporation
    class var cooperAtkins: CompanyIdentifier { return CompanyIdentifier(id: 362, name: "Cooper-Atkins Corporation") }
    /// Qblinks
    class var qblinks: CompanyIdentifier { return CompanyIdentifier(id: 363, name: "Qblinks") }
    /// MYSPHERA
    class var mysphera: CompanyIdentifier { return CompanyIdentifier(id: 364, name: "MYSPHERA") }
    /// LifeScan Inc
    class var lifeScan: CompanyIdentifier { return CompanyIdentifier(id: 365, name: "LifeScan Inc") }
    /// Volantic AB
    class var volantic: CompanyIdentifier { return CompanyIdentifier(id: 366, name: "Volantic AB") }
    /// Podo Labs, Inc
    class var podoLabs: CompanyIdentifier { return CompanyIdentifier(id: 367, name: "Podo Labs, Inc") }
    /// Roche Diabetes Care AG
    class var rocheDiabetesCare: CompanyIdentifier { return CompanyIdentifier(id: 368, name: "Roche Diabetes Care AG") }
    /// Amazon Fulfillment Service
    class var amazonFulfilmentService: CompanyIdentifier { return CompanyIdentifier(id: 369, name: "Amazon Fulfillment Service") }
    /// Connovate Technology Private Limited
    class var connovateTechnology: CompanyIdentifier { return CompanyIdentifier(id: 370, name: "Connovate Technology Private Limited") }
    /// Kocomojo, LLC
    class var kocomojo: CompanyIdentifier { return CompanyIdentifier(id: 371, name: "Kocomojo, LLC") }
    /// Everykey Inc.
    class var everykey: CompanyIdentifier { return CompanyIdentifier(id: 372, name: "Everykey Inc.") }
    /// Dynamic Controls
    class var dynamicControls: CompanyIdentifier { return CompanyIdentifier(id: 373, name: "Dynamic Controls") }
    /// SentriLock
    class var sentriLock: CompanyIdentifier { return CompanyIdentifier(id: 374, name: "SentriLock") }
    /// I-SYST inc.
    class var iSyst: CompanyIdentifier { return CompanyIdentifier(id: 375, name: "I-SYST inc.") }
    /// CASIO COMPUTER CO., LTD.
    class var casioComputer: CompanyIdentifier { return CompanyIdentifier(id: 376, name: "CASIO COMPUTER CO., LTD.") }
    /// LAPIS Semiconductor Co., Ltd.
    class var lapisSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 377, name: "LAPIS Semiconductor Co., Ltd.") }
    /// Telemonitor, Inc.
    class var telemonitor: CompanyIdentifier { return CompanyIdentifier(id: 378, name: "Telemonitor, Inc.") }
    /// taskit GmbH
    class var taskit: CompanyIdentifier { return CompanyIdentifier(id: 379, name: "taskit GmbH") }
    /// Daimler AG
    class var daimler: CompanyIdentifier { return CompanyIdentifier(id: 380, name: "Daimler AG") }
    /// BatAndCat
    class var batAndCat: CompanyIdentifier { return CompanyIdentifier(id: 381, name: "BatAndCat") }
    /// BluDotz Ltd
    class var bluDotz: CompanyIdentifier { return CompanyIdentifier(id: 382, name: "BluDotz Ltd") }
    /// XTel Wireless ApS
    class var xTelWireless: CompanyIdentifier { return CompanyIdentifier(id: 383, name: "XTel Wireless ApS") }
    /// Gigaset Communications GmbH
    class var gigasetCommunications: CompanyIdentifier { return CompanyIdentifier(id: 384, name: "Gigaset Communications GmbH") }
    /// Gecko Health Innovations, Inc.
    class var geckoHealthInnovations: CompanyIdentifier { return CompanyIdentifier(id: 385, name: "Gecko Health Innovations, Inc.") }
    /// HOP Ubiquitous
    class var hopUbiquitous: CompanyIdentifier { return CompanyIdentifier(id: 386, name: "HOP Ubiquitous") }
    /// Walt Disney
    class var waltDisney: CompanyIdentifier { return CompanyIdentifier(id: 387, name: "Walt Disney") }
    /// Nectar
    class var nectar: CompanyIdentifier { return CompanyIdentifier(id: 388, name: "Nectar") }
    /// bel'apps LLC
    class var belApps: CompanyIdentifier { return CompanyIdentifier(id: 389, name: "bel'apps LLC") }
    /// CORE Lighting Ltd
    class var coreLighting: CompanyIdentifier { return CompanyIdentifier(id: 390, name: "CORE Lighting Ltd") }
    /// Seraphim Sense Ltd
    class var seraphimSense: CompanyIdentifier { return CompanyIdentifier(id: 391, name: "Seraphim Sense Ltd") }
    /// Unico RBC
    class var unicoRBC: CompanyIdentifier { return CompanyIdentifier(id: 392, name: "Unico RBC") }
    /// Physical Enterprises Inc.
    class var physicalEnterprises: CompanyIdentifier { return CompanyIdentifier(id: 393, name: "Physical Enterprises Inc.") }
    /// Able Trend Technology Limited
    class var ableTrendTechnology: CompanyIdentifier { return CompanyIdentifier(id: 394, name: "Able Trend Technology Limited") }
    /// Konica Minolta, Inc.
    class var konicaMinolta: CompanyIdentifier { return CompanyIdentifier(id: 395, name: "Konica Minolta, Inc.") }
    /// Wilo SE
    class var wilo: CompanyIdentifier { return CompanyIdentifier(id: 396, name: "Wilo SE") }
    /// Extron Design Services
    class var extronDesignServices: CompanyIdentifier { return CompanyIdentifier(id: 397, name: "Extron Design Services") }
    /// Fitbit, Inc.
    class var fitbit: CompanyIdentifier { return CompanyIdentifier(id: 398, name: "Fitbit, Inc.") }
    /// Fireflies Systems
    class var firefliesSystems: CompanyIdentifier { return CompanyIdentifier(id: 399, name: "Fireflies Systems") }
    /// Intelletto Technologies Inc.
    class var intellettoTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 400, name: "Intelletto Technologies Inc.") }
    /// FDK CORPORATION
    class var fdkCorporation: CompanyIdentifier { return CompanyIdentifier(id: 401, name: "FDK CORPORATION") }
    /// Cloudleaf, Inc
    class var cloudleaf: CompanyIdentifier { return CompanyIdentifier(id: 402, name: "Cloudleaf, Inc") }
    /// Maveric Automation LLC
    class var mavericAutomation: CompanyIdentifier { return CompanyIdentifier(id: 403, name: "Maveric Automation LLC") }
    /// Acoustic Stream Corporation
    class var acousticStream: CompanyIdentifier { return CompanyIdentifier(id: 404, name: "Acoustic Stream Corporation") }
    /// Zuli
    class var zuli: CompanyIdentifier { return CompanyIdentifier(id: 405, name: "Zuli") }
    /// Paxton Access Ltd
    class var paxtonAccess: CompanyIdentifier { return CompanyIdentifier(id: 406, name: "Paxton Access Ltd") }
    /// WiSilica Inc.
    class var wiSilica: CompanyIdentifier { return CompanyIdentifier(id: 407, name: "WiSilica Inc.") }
    /// VENGIT Korlatolt Felelossegu Tarsasag
    class var vengitKorlatolt: CompanyIdentifier { return CompanyIdentifier(id: 408, name: "VENGIT Korlatolt Felelossegu Tarsasag") }
    /// SALTO SYSTEMS S.L.
    class var saltoSystems: CompanyIdentifier { return CompanyIdentifier(id: 409, name: "SALTO SYSTEMS S.L.") }
    /// TRON Forum (formerly T-Engine Forum)
    class var tronForum: CompanyIdentifier { return CompanyIdentifier(id: 410, name: "TRON Forum") }
    /// CUBETECH s.r.o.
    class var cubetech: CompanyIdentifier { return CompanyIdentifier(id: 411, name: "CUBETECH s.r.o.") }
    /// Cokiya Incorporated
    class var cokiya: CompanyIdentifier { return CompanyIdentifier(id: 412, name: "Cokiya Incorporated") }
    /// CVS Health
    class var cvsHealth: CompanyIdentifier { return CompanyIdentifier(id: 413, name: "CVS Health") }
    /// Ceruus
    class var ceruus: CompanyIdentifier { return CompanyIdentifier(id: 414, name: "Ceruus") }
    /// Strainstall Ltd
    class var strainstall: CompanyIdentifier { return CompanyIdentifier(id: 415, name: "Strainstall Ltd") }
    /// Channel Enterprises (HK) Ltd.
    class var channelEnterprises: CompanyIdentifier { return CompanyIdentifier(id: 416, name: "Channel Enterprises (HK) Ltd.") }
    /// FIAMM
    class var fiaam: CompanyIdentifier { return CompanyIdentifier(id: 417, name: "FIAMM") }
    /// GIGALANE.CO.,LTD
    class var gigalane: CompanyIdentifier { return CompanyIdentifier(id: 418, name: "GIGALANE.CO.,LTD") }
    /// EROAD
    class var eroad: CompanyIdentifier { return CompanyIdentifier(id: 419, name: "EROAD") }
    /// Mine Safety Appliances
    class var mineSafeyAppliances: CompanyIdentifier { return CompanyIdentifier(id: 420, name: "Mine Safety Appliances") }
    /// Icon Health and Fitness
    class var iconHealth: CompanyIdentifier { return CompanyIdentifier(id: 421, name: "Icon Health and Fitness") }
    /// Asandoo GmbH
    class var asandoo: CompanyIdentifier { return CompanyIdentifier(id: 422, name: "Asandoo GmbH") }
    /// ENERGOUS CORPORATION
    class var energous: CompanyIdentifier { return CompanyIdentifier(id: 423, name: "ENERGOUS CORPORATION") }
    /// Taobao
    class var taobao: CompanyIdentifier { return CompanyIdentifier(id: 424, name: "Taobao") }
    /// Canon Inc.
    class var canon: CompanyIdentifier { return CompanyIdentifier(id: 425, name: "Canon Inc.") }
    /// Geophysical Technology Inc.
    class var geophysicalTechnology: CompanyIdentifier { return CompanyIdentifier(id: 426, name: "Geophysical Technology Inc.") }
    /// Facebook, Inc
    class var facebook: CompanyIdentifier { return CompanyIdentifier(id: 427, name: "Facebook, Inc") }
    /// Nipro Diagnostics, Inc.
    class var niproDiagnostics: CompanyIdentifier { return CompanyIdentifier(id: 428, name: "Nipro Diagnostics, Inc.") }
    /// FlightSafety International
    class var flightSafety: CompanyIdentifier { return CompanyIdentifier(id: 429, name: "FlightSafety International") }
    /// Earlens Corporation
    class var earlens: CompanyIdentifier { return CompanyIdentifier(id: 430, name: "Earlens Corporation") }
    /// Sunrise Micro Devices, Inc.
    class var sunriseMicroDevices: CompanyIdentifier { return CompanyIdentifier(id: 431, name: "Sunrise Micro Devices, Inc.") }
    /// Star Micronics Co., Ltd.
    class var starMicronics: CompanyIdentifier { return CompanyIdentifier(id: 432, name: "Star Micronics Co., Ltd.") }
    /// Netizens Sp. z o.o.
    class var netizens: CompanyIdentifier { return CompanyIdentifier(id: 433, name: "Netizens Sp. z o.o.") }
    /// Nymi Inc.
    class var nymi: CompanyIdentifier { return CompanyIdentifier(id: 434, name: "Nymi Inc.") }
    /// Nytec, Inc.
    class var nytec: CompanyIdentifier { return CompanyIdentifier(id: 435, name: "Nytec, Inc.") }
    /// Trineo Sp. z o.o.
    class var trineo: CompanyIdentifier { return CompanyIdentifier(id: 436, name: "Trineo Sp. z o.o.") }
    /// Nest Labs Inc.
    class var nestLabs: CompanyIdentifier { return CompanyIdentifier(id: 437, name: "Nest Labs Inc.") }
    /// LM Technologies Ltd
    class var lmTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 438, name: "LM Technologies Ltd") }
    /// General Electric Company
    class var generalElectric: CompanyIdentifier { return CompanyIdentifier(id: 439, name: "General Electric Company") }
    /// i+D3 S.L.
    class var id3: CompanyIdentifier { return CompanyIdentifier(id: 440, name: "i+D3 S.L.") }
    /// HANA Micron
    class var hanaMicron: CompanyIdentifier { return CompanyIdentifier(id: 441, name: "HANA Micron") }
    /// Stages Cycling LLC
    class var stagesCycling: CompanyIdentifier { return CompanyIdentifier(id: 442, name: "Stages Cycling LLC") }
    /// Cochlear Bone Anchored Solutions AB
    class var cochlearBone: CompanyIdentifier { return CompanyIdentifier(id: 443, name: "Cochlear Bone Anchored Solutions AB") }
    /// SenionLab AB
    class var senionLab: CompanyIdentifier { return CompanyIdentifier(id: 444, name: "SenionLab AB") }
    /// Syszone Co., Ltd
    class var syszone: CompanyIdentifier { return CompanyIdentifier(id: 445, name: "Syszone Co., Ltd") }
    /// Pulsate Mobile Ltd.
    class var pulsateMobile: CompanyIdentifier { return CompanyIdentifier(id: 446, name: "Pulsate Mobile Ltd.") }
    /// Hong Kong HunterSun Electronic Limited
    class var hongKongHunterSun: CompanyIdentifier { return CompanyIdentifier(id: 447, name: "Hong Kong HunterSun Electronic Limited") }
    /// pironex GmbH
    class var pironex: CompanyIdentifier { return CompanyIdentifier(id: 448, name: "pironex GmbH") }
    /// BRADATECH Corp.
    class var bradtech: CompanyIdentifier { return CompanyIdentifier(id: 449, name: "BRADATECH Corp.") }
    /// Transenergooil AG
    class var transenergooil: CompanyIdentifier { return CompanyIdentifier(id: 450, name: "Transenergooil AG") }
    /// Bunch
    class var bunch: CompanyIdentifier { return CompanyIdentifier(id: 451, name: "Bunch") }
    /// DME Microelectronics
    class var dmeMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 452, name: "DME Microelectronics") }
    /// Bitcraze AB
    class var bitcraze: CompanyIdentifier { return CompanyIdentifier(id: 453, name: "Bitcraze AB") }
    /// HASWARE Inc.
    class var hasware: CompanyIdentifier { return CompanyIdentifier(id: 454, name: "HASWARE Inc.") }
    /// Abiogenix Inc.
    class var abiogenix: CompanyIdentifier { return CompanyIdentifier(id: 455, name: "Abiogenix Inc.") }
    /// Poly-Control ApS
    class var polyControl: CompanyIdentifier { return CompanyIdentifier(id: 456, name: "Poly-Control ApS") }
    /// Avi-on
    class var aviOn: CompanyIdentifier { return CompanyIdentifier(id: 457, name: "Avi-on") }
    /// Laerdal Medical AS
    class var laerdalMedical: CompanyIdentifier { return CompanyIdentifier(id: 458, name: "Laerdal Medical AS") }
    /// Fetch My Pet
    class var fetchMyPet: CompanyIdentifier { return CompanyIdentifier(id: 459, name: "Fetch My Pet") }
    /// Sam Labs Ltd.
    class var samLabs: CompanyIdentifier { return CompanyIdentifier(id: 460, name: "Sam Labs Ltd.") }
    /// Chengdu Synwing Technology Ltd
    class var chendguSynwing: CompanyIdentifier { return CompanyIdentifier(id: 461, name: "Chengdu Synwing Technology Ltd") }
    /// HOUWA SYSTEM DESIGN, k.k.
    class var houwaSystemDesign: CompanyIdentifier { return CompanyIdentifier(id: 462, name: "HOUWA SYSTEM DESIGN, k.k.") }
    /// BSH
    class var bsh: CompanyIdentifier { return CompanyIdentifier(id: 463, name: "BSH") }
    /// Primus Inter Pares Ltd
    class var primusInterPares: CompanyIdentifier { return CompanyIdentifier(id: 464, name: "Primus Inter Pares Ltd") }
    /// August Home, Inc
    class var augustHome: CompanyIdentifier { return CompanyIdentifier(id: 465, name: "August Home, Inc") }
    /// Gill Electronics
    class var gillElectronics: CompanyIdentifier { return CompanyIdentifier(id: 466, name: "Gill Electronics") }
    /// Sky Wave Design
    class var skyWaveDesign: CompanyIdentifier { return CompanyIdentifier(id: 467, name: "Sky Wave Design") }
    /// Newlab S.r.l.
    class var newlab: CompanyIdentifier { return CompanyIdentifier(id: 468, name: "Newlab S.r.l.") }
    /// ELAD srl
    class var elad: CompanyIdentifier { return CompanyIdentifier(id: 469, name: "ELAD srl") }
    /// G-wearables inc.
    class var gWearables: CompanyIdentifier { return CompanyIdentifier(id: 470, name: "G-wearables inc.") }
    /// Squadrone Systems Inc
    class var squadroneSystems: CompanyIdentifier { return CompanyIdentifier(id: 471, name: "Squadrone Systems Inc") }
    /// Code Corporation
    class var codeCorporation: CompanyIdentifier { return CompanyIdentifier(id: 472, name: "Code Corporation") }
    /// Savant Systems LLC
    class var savantSystems: CompanyIdentifier { return CompanyIdentifier(id: 473, name: "Savant Systems LLC") }
    /// Logitech International SA
    class var logitech: CompanyIdentifier { return CompanyIdentifier(id: 474, name: "Logitech International SA") }
    /// Innblue Consulting
    class var innblueConsulting: CompanyIdentifier { return CompanyIdentifier(id: 475, name: "Innblue Consulting") }
    /// iParking Ltd.
    class var iParking: CompanyIdentifier { return CompanyIdentifier(id: 476, name: "iParking Ltd.") }
    /// Koninklijke Philips Electronics N.V.
    class var philips: CompanyIdentifier { return CompanyIdentifier(id: 477, name: "Koninklijke Philips Electronics N.V.") }
    /// Minelab Electronics Pty Limited
    class var minelabElectronics: CompanyIdentifier { return CompanyIdentifier(id: 478, name: "Minelab Electronics Pty Limited") }
    /// Bison Group Ltd.
    class var bisonGroup: CompanyIdentifier { return CompanyIdentifier(id: 479, name: "Bison Group Ltd.") }
    /// Widex A/S
    class var widex: CompanyIdentifier { return CompanyIdentifier(id: 480, name: "Widex A/S") }
    /// Jolla Ltd
    class var jolla: CompanyIdentifier { return CompanyIdentifier(id: 481, name: "Jolla Ltd") }
    /// Lectronix, Inc.
    class var lectronix: CompanyIdentifier { return CompanyIdentifier(id: 482, name: "Lectronix, Inc.") }
    /// Caterpillar Inc
    class var caterpillar: CompanyIdentifier { return CompanyIdentifier(id: 483, name: "Caterpillar Inc") }
    /// Freedom Innovations
    class var freedomInnovations: CompanyIdentifier { return CompanyIdentifier(id: 484, name: "Freedom Innovations") }
    /// Dynamic Devices Ltd
    class var dynamicDevices: CompanyIdentifier { return CompanyIdentifier(id: 485, name: "Dynamic Devices Ltd") }
    /// Technology Solutions (UK) Ltd
    class var technologySolutions: CompanyIdentifier { return CompanyIdentifier(id: 486, name: "Technology Solutions (UK) Ltd") }
    /// IPS Group Inc.
    class var ipsGroup: CompanyIdentifier { return CompanyIdentifier(id: 487, name: "IPS Group Inc.") }
    /// STIR
    class var stir: CompanyIdentifier { return CompanyIdentifier(id: 488, name: "STIR") }
    /// Sano, Inc.
    class var sano: CompanyIdentifier { return CompanyIdentifier(id: 489, name: "Sano, Inc.") }
    /// Advanced Application Design, Inc.
    class var advancedApplicationDesign: CompanyIdentifier { return CompanyIdentifier(id: 490, name: "Advanced Application Design, Inc.") }
    /// AutoMap LLC
    class var autoMap: CompanyIdentifier { return CompanyIdentifier(id: 491, name: "AutoMap LLC") }
    /// Spreadtrum Communications Shanghai Ltd
    class var spreadtrumCommunications: CompanyIdentifier { return CompanyIdentifier(id: 492, name: "Spreadtrum Communications Shanghai Ltd") }
    /// CuteCircuit LTD
    class var cuteCircuit: CompanyIdentifier { return CompanyIdentifier(id: 493, name: "CuteCircuit LTD") }
    /// Valeo Service
    class var valeoService: CompanyIdentifier { return CompanyIdentifier(id: 494, name: "Valeo Service") }
    /// Fullpower Technologies, Inc.
    class var fullpowerTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 495, name: "Fullpower Technologies, Inc.") }
    /// KloudNation
    class var kloudNation: CompanyIdentifier { return CompanyIdentifier(id: 496, name: "KloudNation") }
    /// Zebra Technologies Corporation
    class var zebraTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 497, name: "Zebra Technologies Corporation") }
    /// Itron, Inc.
    class var itron: CompanyIdentifier { return CompanyIdentifier(id: 498, name: "Itron, Inc.") }
    /// The University of Tokyo
    class var tokyoUniversity: CompanyIdentifier { return CompanyIdentifier(id: 499, name: "The University of Tokyo") }
    /// UTC Fire and Security
    class var utcFireAndSecurity: CompanyIdentifier { return CompanyIdentifier(id: 500, name: "UTC Fire and Security") }
    /// Cool Webthings Limited
    class var coolWebthings: CompanyIdentifier { return CompanyIdentifier(id: 501, name: "Cool Webthings Limited") }
    /// DJO Global
    class var djoGlobal: CompanyIdentifier { return CompanyIdentifier(id: 502, name: "DJO Global") }
    /// Gelliner Limited
    class var gellier: CompanyIdentifier { return CompanyIdentifier(id: 503, name: "Gelliner Limited") }
    /// Anyka (Guangzhou) Microelectronics Technology Co, LTD
    class var anykaMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 504, name: "Anyka (Guangzhou) Microelectronics Technology Co, LTD") }
    /// Medtronic Inc.
    class var medtronic: CompanyIdentifier { return CompanyIdentifier(id: 505, name: "Medtronic Inc.") }
    /// Gozio Inc.
    class var gozio: CompanyIdentifier { return CompanyIdentifier(id: 506, name: "Gozio Inc.") }
    /// Form Lifting, LLC
    class var formLifting: CompanyIdentifier { return CompanyIdentifier(id: 507, name: "Form Lifting, LLC") }
    /// Wahoo Fitness, LLC
    class var wahooFitness: CompanyIdentifier { return CompanyIdentifier(id: 508, name: "Wahoo Fitness, LLC") }
    /// Kontakt Micro-Location Sp. z o.o.
    class var knotaktMicroLocation: CompanyIdentifier { return CompanyIdentifier(id: 509, name: "Kontakt Micro-Location Sp. z o.o.") }
    /// Radio Systems Corporation
    class var radioSystems: CompanyIdentifier { return CompanyIdentifier(id: 510, name: "Radio Systems Corporation") }
    /// Freescale Semiconductor, Inc.
    class var freescaleSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 511, name: "Freescale Semiconductor, Inc.") }
    /// Verifone Systems Pte Ltd. Taiwan Branch
    class var verifone: CompanyIdentifier { return CompanyIdentifier(id: 512, name: "Verifone Systems Pte Ltd. Taiwan Branch") }
    /// AR Timing
    class var arTiming: CompanyIdentifier { return CompanyIdentifier(id: 513, name: "AR Timing") }
    /// Rigado LLC
    class var rigado: CompanyIdentifier { return CompanyIdentifier(id: 514, name: "Rigado LLC") }
    /// Kemppi Oy
    class var kemppi: CompanyIdentifier { return CompanyIdentifier(id: 515, name: "Kemppi Oy") }
    /// Tapcentive Inc.
    class var tapcentive: CompanyIdentifier { return CompanyIdentifier(id: 516, name: "Tapcentive Inc.") }
    /// Smartbotics Inc.
    class var smartbotics: CompanyIdentifier { return CompanyIdentifier(id: 517, name: "Smartbotics Inc.") }
    /// Otter Products, LLC
    class var otterProducts: CompanyIdentifier { return CompanyIdentifier(id: 518, name: "Otter Products, LLC") }
    /// STEMP Inc
    class var stemp: CompanyIdentifier { return CompanyIdentifier(id: 519, name: "STEMP Inc") }
    /// LumiGeek LLC
    class var lumiGeek: CompanyIdentifier { return CompanyIdentifier(id: 520, name: "LumiGeek LLC") }
    /// InvisionHeart Inc.
    class var invisionHeart: CompanyIdentifier { return CompanyIdentifier(id: 521, name: "InvisionHeart Inc.") }
    /// Macnica Inc.
    class var macnica: CompanyIdentifier { return CompanyIdentifier(id: 522, name: "Macnica Inc.") }
    /// Jaguar Land Rover Limited
    class var jaguarLandRover: CompanyIdentifier { return CompanyIdentifier(id: 523, name: "Jaguar Land Rover Limited") }
    /// CoroWare Technologies, Inc
    class var coroWareTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 524, name: "CoroWare Technologies, Inc") }
    /// Simplo Technology Co., LTD
    class var simploTechnology: CompanyIdentifier { return CompanyIdentifier(id: 525, name: "Simplo Technology Co., LTD") }
    /// Omron Healthcare Co., LTD
    class var omronHealthcare: CompanyIdentifier { return CompanyIdentifier(id: 526, name: "Omron Healthcare Co., LTD") }
    /// Comodule GMBH
    class var comodule: CompanyIdentifier { return CompanyIdentifier(id: 527, name: "Comodule GMBH") }
    /// ikeGPS
    class var ikeGPS: CompanyIdentifier { return CompanyIdentifier(id: 528, name: "ikeGPS") }
    /// Telink Semiconductor Co. Ltd
    class var telinkSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 529, name: "Telink Semiconductor Co. Ltd") }
    /// Interplan Co., Ltd
    class var interplan: CompanyIdentifier { return CompanyIdentifier(id: 530, name: "Interplan Co., Ltd") }
    /// Wyler AG
    class var wyler: CompanyIdentifier { return CompanyIdentifier(id: 531, name: "Wyler AG") }
    /// IK Multimedia Production srl
    class var ikMultimedia: CompanyIdentifier { return CompanyIdentifier(id: 532, name: "IK Multimedia Production srl") }
    /// Lukoton Experience Oy
    class var lukotonExperience: CompanyIdentifier { return CompanyIdentifier(id: 533, name: "Lukoton Experience Oy") }
    /// MTI Ltd
    class var mti: CompanyIdentifier { return CompanyIdentifier(id: 534, name: "MTI Ltd") }
    /// Tech4home, Lda
    class var tech4Home: CompanyIdentifier { return CompanyIdentifier(id: 535, name: "Tech4home, Lda") }
    /// Hiotech AB
    class var hiotech: CompanyIdentifier { return CompanyIdentifier(id: 536, name: "Hiotech AB") }
    /// DOTT Limited
    class var dott: CompanyIdentifier { return CompanyIdentifier(id: 537, name: "DOTT Limited") }
    /// Blue Speck Labs, LLC
    class var blueSpeckLabs: CompanyIdentifier { return CompanyIdentifier(id: 538, name: "Blue Speck Labs, LLC") }
    /// Cisco Systems, Inc
    class var cisco: CompanyIdentifier { return CompanyIdentifier(id: 539, name: "Cisco Systems, Inc") }
    /// Mobicomm Inc
    class var mobicomm: CompanyIdentifier { return CompanyIdentifier(id: 540, name: "Mobicomm Inc") }
    /// Edamic
    class var edamic: CompanyIdentifier { return CompanyIdentifier(id: 541, name: "Edamic") }
    /// Goodnet, Ltd
    class var goodnet: CompanyIdentifier { return CompanyIdentifier(id: 542, name: "Goodnet, Ltd") }
    /// Luster Leaf Products Inc
    class var lusterLeafProducts: CompanyIdentifier { return CompanyIdentifier(id: 543, name: "Luster Leaf Products Inc") }
    /// Manus Machina BV
    class var manusMachina: CompanyIdentifier { return CompanyIdentifier(id: 544, name: "Manus Machina BV") }
    /// Mobiquity Networks Inc
    class var mobiquityNetworks: CompanyIdentifier { return CompanyIdentifier(id: 545, name: "Mobiquity Networks Inc") }
    /// Praxis Dynamics
    class var praxisDynamics: CompanyIdentifier { return CompanyIdentifier(id: 546, name: "Praxis Dynamics") }
    /// Philip Morris Products S.A.
    class var philipMorrisProducts: CompanyIdentifier { return CompanyIdentifier(id: 547, name: "Philip Morris Products S.A.") }
    /// Comarch SA
    class var comarch: CompanyIdentifier { return CompanyIdentifier(id: 548, name: "Comarch SA") }
    /// Nestl Nespresso S.A.
    class var nestlNespresso: CompanyIdentifier { return CompanyIdentifier(id: 549, name: "Nestl Nespresso S.A.") }
    /// Merlinia A/S
    class var merlinia: CompanyIdentifier { return CompanyIdentifier(id: 550, name: "Merlinia A/S") }
    /// LifeBEAM Technologies
    class var lifeBeamTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 551, name: "LifeBEAM Technologies") }
    /// Twocanoes Labs, LLC
    class var twocanoesLabs: CompanyIdentifier { return CompanyIdentifier(id: 552, name: "Twocanoes Labs, LLC") }
    /// Muoverti Limited
    class var muoverti: CompanyIdentifier { return CompanyIdentifier(id: 553, name: "Muoverti Limited") }
    /// Stamer Musikanlagen GMBH
    class var stamerMusikanlagen: CompanyIdentifier { return CompanyIdentifier(id: 554, name: "Stamer Musikanlagen GMBH") }
    /// Tesla Motors
    class var teslaMotors: CompanyIdentifier { return CompanyIdentifier(id: 555, name: "Tesla Motors") }
    /// Pharynks Corporation
    class var pharynks: CompanyIdentifier { return CompanyIdentifier(id: 556, name: "Pharynks Corporation") }
    /// Lupine
    class var lupine: CompanyIdentifier { return CompanyIdentifier(id: 557, name: "Lupine") }
    /// Siemens AG
    class var siemens: CompanyIdentifier { return CompanyIdentifier(id: 558, name: "Siemens AG") }
    /// Huami (Shanghai) Culture Communication CO., LTD
    class var huamiCultureCommunications: CompanyIdentifier { return CompanyIdentifier(id: 559, name: "Huami (Shanghai) Culture Communication CO., LTD") }
    /// Foster Electric Company, Ltd
    class var fosterElectric: CompanyIdentifier { return CompanyIdentifier(id: 560, name: "Foster Electric Company, Ltd") }
    /// ETA SA
    class var eta: CompanyIdentifier { return CompanyIdentifier(id: 561, name: "ETA SA") }
    /// x-Senso Solutions Kft
    class var xSensoSolutions: CompanyIdentifier { return CompanyIdentifier(id: 562, name: "x-Senso Solutions Kft") }
    /// Shenzhen SuLong Communication Ltd
    class var shenzhenSuLongCommunication: CompanyIdentifier { return CompanyIdentifier(id: 563, name: "Shenzhen SuLong Communication Ltd") }
    /// FengFan (BeiJing) Technology Co, Ltd
    class var fengFanTechnology: CompanyIdentifier { return CompanyIdentifier(id: 564, name: "FengFan (BeiJing) Technology Co, Ltd") }
    /// Qrio Inc
    class var qrio: CompanyIdentifier { return CompanyIdentifier(id: 565, name: "Qrio Inc") }
    /// Pitpatpet Ltd
    class var pitpatpet: CompanyIdentifier { return CompanyIdentifier(id: 566, name: "Pitpatpet Ltd") }
    /// MSHeli s.r.l.
    class var msHeli: CompanyIdentifier { return CompanyIdentifier(id: 567, name: "MSHeli s.r.l.") }
    /// Trakm8 Ltd
    class var trakm8: CompanyIdentifier { return CompanyIdentifier(id: 568, name: "Trakm8 Ltd") }
    /// JIN CO, Ltd
    class var jinCo: CompanyIdentifier { return CompanyIdentifier(id: 569, name: "JIN CO, Ltd") }
    /// Alatech Tehnology
    class var alatech: CompanyIdentifier { return CompanyIdentifier(id: 570, name: "Alatech Tehnology") }
    /// Beijing CarePulse Electronic Technology Co, Ltd
    class var beijingCarePulseElectronic: CompanyIdentifier { return CompanyIdentifier(id: 571, name: "Beijing CarePulse Electronic Technology Co, Ltd") }
    /// Awarepoint
    class var awarepoint: CompanyIdentifier { return CompanyIdentifier(id: 572, name: "Awarepoint") }
    /// ViCentra B.V.
    class var viCentra: CompanyIdentifier { return CompanyIdentifier(id: 573, name: "ViCentra B.V.") }
    /// Raven Industries
    class var ravenIndustries: CompanyIdentifier { return CompanyIdentifier(id: 574, name: "Raven Industries") }
    /// WaveWare Technologies Inc.
    class var waveWareTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 575, name: "WaveWare Technologies Inc.") }
    /// Argenox Technologies
    class var argenox: CompanyIdentifier { return CompanyIdentifier(id: 576, name: "Argenox Technologies") }
    /// Bragi GmbH
    class var bragi: CompanyIdentifier { return CompanyIdentifier(id: 577, name: "Bragi GmbH") }
    /// 16Lab Inc
    class var sixteenLab: CompanyIdentifier { return CompanyIdentifier(id: 578, name: "16Lab Inc") }
    /// Masimo Corp
    class var masimo: CompanyIdentifier { return CompanyIdentifier(id: 579, name: "Masimo Corp") }
    /// Iotera Inc
    class var iotera: CompanyIdentifier { return CompanyIdentifier(id: 580, name: "Iotera Inc") }
    /// Endress+Hauser
    class var endressHauser: CompanyIdentifier { return CompanyIdentifier(id: 581, name: "Endress+Hauser") }
    /// ACKme Networks, Inc.
    class var ackmeNetworks: CompanyIdentifier { return CompanyIdentifier(id: 582, name: "ACKme Networks, Inc.") }
    /// FiftyThree Inc.
    class var fiftyThree: CompanyIdentifier { return CompanyIdentifier(id: 583, name: "FiftyThree Inc.") }
    /// Parker Hannifin Corp
    class var parkerHennifin: CompanyIdentifier { return CompanyIdentifier(id: 584, name: "Parker Hannifin Corp") }
    /// Transcranial Ltd
    class var transcranial: CompanyIdentifier { return CompanyIdentifier(id: 585, name: "Transcranial Ltd") }
    /// Uwatec AG
    class var uwatec: CompanyIdentifier { return CompanyIdentifier(id: 586, name: "Uwatec AG") }
    /// Orlan LLC
    class var orlan: CompanyIdentifier { return CompanyIdentifier(id: 587, name: "Orlan LLC") }
    /// Blue Clover Devices
    class var blueCloverDevices: CompanyIdentifier { return CompanyIdentifier(id: 588, name: "Blue Clover Devices") }
    /// M-Way Solutions GmbH
    class var mWaySolutions: CompanyIdentifier { return CompanyIdentifier(id: 589, name: "M-Way Solutions GmbH") }
    /// Microtronics Engineering GmbH
    class var microtronicsEngineering: CompanyIdentifier { return CompanyIdentifier(id: 590, name: "Microtronics Engineering GmbH") }
    /// Schneider Schreibgerte GmbH
    class var schneiderSchreibgerte: CompanyIdentifier { return CompanyIdentifier(id: 591, name: "Schneider Schreibgerte GmbH") }
    /// Sapphire Circuits LLC
    class var sapphireCircuits: CompanyIdentifier { return CompanyIdentifier(id: 592, name: "Sapphire Circuits LLC") }
    /// Lumo Bodytech Inc
    class var lumoBodytech: CompanyIdentifier { return CompanyIdentifier(id: 593, name: "Lumo Bodytech Inc") }
    /// UKC Technosolution
    class var ukcTechnosolution: CompanyIdentifier { return CompanyIdentifier(id: 594, name: "UKC Technosolution") }
    /// Xicato Inc
    class var xicato: CompanyIdentifier { return CompanyIdentifier(id: 595, name: "Xicato Inc") }
    /// Playbrush
    class var playbrush: CompanyIdentifier { return CompanyIdentifier(id: 596, name: "Playbrush") }
    /// Dai Nippon Printing Co., Ltd.
    class var daiNipponPrinting: CompanyIdentifier { return CompanyIdentifier(id: 597, name: "Dai Nippon Printing Co., Ltd.") }
    /// G24 Power Limited
    class var g24Power: CompanyIdentifier { return CompanyIdentifier(id: 598, name: "G24 Power Limited") }
    /// AdBabble Local Commerce Inc.
    class var adBabbleLocalCommerce: CompanyIdentifier { return CompanyIdentifier(id: 599, name: "AdBabble Local Commerce Inc.") }
    /// Devialet SA
    class var devialet: CompanyIdentifier { return CompanyIdentifier(id: 600, name: "Devialet SA") }
    /// ALTYOR
    class var altyor: CompanyIdentifier { return CompanyIdentifier(id: 601, name: "ALTYOR") }
    /// University of Applied Sciences Valais/Haute Ecole Valaisanne
    class var universityAppliedSciencesValaisanne: CompanyIdentifier { return CompanyIdentifier(id: 602, name: "University of Applied Sciences Valais/Haute Ecole Valaisanne") }
    /// Five Interactive, LLC dba Zendo
    class var fiveInteractive: CompanyIdentifier { return CompanyIdentifier(id: 603, name: "Five Interactive, LLC dba Zendo") }
    /// NetEaseHangzhouNetwork co.Ltd
    class var netEaseHangzhouNetwork: CompanyIdentifier { return CompanyIdentifier(id: 604, name: "NetEaseHangzhouNetwork co.Ltd") }
    /// Lexmark International Inc.
    class var lexmark: CompanyIdentifier { return CompanyIdentifier(id: 605, name: "Lexmark International Inc.") }
    /// Fluke Corporation
    class var fluke: CompanyIdentifier { return CompanyIdentifier(id: 606, name: "Fluke Corporation") }
    /// Yardarm Technologies
    class var yardarmTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 607, name: "Yardarm Technologies") }
    /// SensaRx
    class var sensaRx: CompanyIdentifier { return CompanyIdentifier(id: 608, name: "SensaRx") }
    /// SECVRE GmbH
    class var secvre: CompanyIdentifier { return CompanyIdentifier(id: 609, name: "SECVRE GmbH") }
    /// Glacial Ridge Technologies
    class var glacialRidgeTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 610, name: "Glacial Ridge Technologies") }
    /// Identiv, Inc.
    class var identiv: CompanyIdentifier { return CompanyIdentifier(id: 611, name: "Identiv, Inc.") }
    /// DDS Inc.
    class var ddsInc: CompanyIdentifier { return CompanyIdentifier(id: 612, name: "DDS Inc.") }
    /// SMK Corporation
    class var smkCorporation: CompanyIdentifier { return CompanyIdentifier(id: 613, name: "SMK Corporation") }
    /// Schawbel Technologies LLC
    class var schawbelTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 614, name: "Schawbel Technologies LLC") }
    /// XMI Systems SA
    class var xmiSystems: CompanyIdentifier { return CompanyIdentifier(id: 615, name: "XMI Systems SA") }
    /// Cerevo
    class var cerevo: CompanyIdentifier { return CompanyIdentifier(id: 616, name: "Cerevo") }
    /// Torrox GmbH & Co KG
    class var torrox: CompanyIdentifier { return CompanyIdentifier(id: 617, name: "Torrox GmbH & Co KG") }
    /// Gemalto
    class var gemalto: CompanyIdentifier { return CompanyIdentifier(id: 618, name: "Gemalto") }
    /// DEKA Research & Development Corp
    class var dekkaResearch: CompanyIdentifier { return CompanyIdentifier(id: 619, name: "DEKA Research & Development Corp") }
    /// Domster Tadeusz Szydlowski
    class var domsterTadeuszSzydlowski: CompanyIdentifier { return CompanyIdentifier(id: 620, name: "Domster Tadeusz Szydlowski") }
    /// Technogym SPA
    class var technogym: CompanyIdentifier { return CompanyIdentifier(id: 621, name: "Technogym SPA") }
    /// FLEURBAEY BVBA
    class var fleurbaey: CompanyIdentifier { return CompanyIdentifier(id: 622, name: "FLEURBAEY BVBA") }
    /// Aptcode Solutions
    class var aptcodeSolutions: CompanyIdentifier { return CompanyIdentifier(id: 623, name: "Aptcode Solutions") }
    /// LSI ADL Technology
    class var lsiAdlTechnology: CompanyIdentifier { return CompanyIdentifier(id: 624, name: "LSI ADL Technology") }
    /// Animas Corp
    class var animasCorp: CompanyIdentifier { return CompanyIdentifier(id: 625, name: "Animas Corp") }
    /// Alps Electric Co., Ltd
    class var alpsElectric: CompanyIdentifier { return CompanyIdentifier(id: 626, name: "Alps Electric Co., Ltd") }
    /// OCEASOFT
    class var oceasoft: CompanyIdentifier { return CompanyIdentifier(id: 627, name: "OCEASOFT") }
    /// Motsai Research
    class var motsaiResearch: CompanyIdentifier { return CompanyIdentifier(id: 628, name: "Motsai Research") }
    /// Geotab
    class var geotab: CompanyIdentifier { return CompanyIdentifier(id: 629, name: "Geotab") }
    /// E.G.O. Elektro-Gertebau GmbH
    class var egoElektroGertebau: CompanyIdentifier { return CompanyIdentifier(id: 630, name: "E.G.O. Elektro-Gertebau GmbH") }
    /// bewhere inc
    class var bhwhere: CompanyIdentifier { return CompanyIdentifier(id: 631, name: "bewhere inc") }
    /// Johnson Outdoors Inc
    class var johnsonOutdoors: CompanyIdentifier { return CompanyIdentifier(id: 632, name: "Johnson Outdoors Inc") }
    /// steute Schaltgerate GmbH & Co. KG
    class var steuteSchaltgerate: CompanyIdentifier { return CompanyIdentifier(id: 633, name: "steute Schaltgerate GmbH & Co. KG") }
    /// Ekomini inc.
    class var ekomini: CompanyIdentifier { return CompanyIdentifier(id: 634, name: "Ekomini inc.") }
    /// DEFA AS
    class var defa: CompanyIdentifier { return CompanyIdentifier(id: 635, name: "DEFA AS") }
    /// Aseptika Ltd
    class var aseptika: CompanyIdentifier { return CompanyIdentifier(id: 636, name: "Aseptika Ltd") }
    /// HUAWEI Technologies Co., Ltd
    class var huawei: CompanyIdentifier { return CompanyIdentifier(id: 637, name: "HUAWEI Technologies Co., Ltd") }
    /// HabitAware, LLC
    class var habitAware: CompanyIdentifier { return CompanyIdentifier(id: 638, name: "HabitAware, LLC") }
    /// ruwido austria gmbh
    class var ruwidoAustria: CompanyIdentifier { return CompanyIdentifier(id: 639, name: "ruwido austria gmbh") }
    /// ITEC corporation
    class var itecCorporation: CompanyIdentifier { return CompanyIdentifier(id: 640, name: "ITEC corporation") }
    /// StoneL
    class var stoneL: CompanyIdentifier { return CompanyIdentifier(id: 641, name: "StoneL") }
    /// Sonova AG
    class var sonova: CompanyIdentifier { return CompanyIdentifier(id: 642, name: "Sonova AG") }
    /// Maven Machines, Inc.
    class var mavenMachines: CompanyIdentifier { return CompanyIdentifier(id: 643, name: "Maven Machines, Inc.") }
    /// Synapse Electronics
    class var synapseElectronics: CompanyIdentifier { return CompanyIdentifier(id: 644, name: "Synapse Electronics") }
    /// Standard Innovation Inc.
    class var standardInnovation: CompanyIdentifier { return CompanyIdentifier(id: 645, name: "Standard Innovation Inc.") }
    /// RF Code, Inc.
    class var rfCode: CompanyIdentifier { return CompanyIdentifier(id: 646, name: "RF Code, Inc.") }
    /// Wally Ventures S.L.
    class var wallyVentures: CompanyIdentifier { return CompanyIdentifier(id: 647, name: "Wally Ventures S.L.") }
    /// Willowbank Electronics Ltd
    class var willowbankElectronics: CompanyIdentifier { return CompanyIdentifier(id: 648, name: "Willowbank Electronics Ltd") }
    /// SK Telecom
    class var skTelecom: CompanyIdentifier { return CompanyIdentifier(id: 649, name: "SK Telecom") }
    /// Jetro AS
    class var jetro: CompanyIdentifier { return CompanyIdentifier(id: 650, name: "Jetro AS") }
    /// Code Gears LTD
    class var codeGears: CompanyIdentifier { return CompanyIdentifier(id: 651, name: "Code Gears LTD") }
    /// NANOLINK APS
    class var nanolink: CompanyIdentifier { return CompanyIdentifier(id: 652, name: "NANOLINK APS") }
    /// IF, LLC
    class var ifLlc: CompanyIdentifier { return CompanyIdentifier(id: 653, name: "IF, LLC") }
    /// RF Digital Corp
    class var rfDigital: CompanyIdentifier { return CompanyIdentifier(id: 654, name: "RF Digital Corp") }
    /// Church & Dwight Co., Inc
    class var churchDwight: CompanyIdentifier { return CompanyIdentifier(id: 655, name: "Church & Dwight Co., Inc") }
    /// Multibit Oy
    class var multibit: CompanyIdentifier { return CompanyIdentifier(id: 656, name: "Multibit Oy") }
    /// CliniCloud Inc
    class var cliniCloud: CompanyIdentifier { return CompanyIdentifier(id: 657, name: "CliniCloud Inc") }
    /// SwiftSensors
    class var swiftSensors: CompanyIdentifier { return CompanyIdentifier(id: 658, name: "SwiftSensors") }
    /// Blue Bite
    class var blueBite: CompanyIdentifier { return CompanyIdentifier(id: 659, name: "Blue Bite") }
    /// ELIAS GmbH
    class var elias: CompanyIdentifier { return CompanyIdentifier(id: 660, name: "ELIAS GmbH") }
    /// Sivantos GmbH
    class var sivantos: CompanyIdentifier { return CompanyIdentifier(id: 661, name: "Sivantos GmbH") }
    /// Petzl
    class var petzl: CompanyIdentifier { return CompanyIdentifier(id: 662, name: "Petzl") }
    /// storm power ltd
    class var stormPower: CompanyIdentifier { return CompanyIdentifier(id: 663, name: "storm power ltd") }
    /// EISST Ltd
    class var eisst: CompanyIdentifier { return CompanyIdentifier(id: 664, name: "EISST Ltd") }
    /// Inexess Technology Simma KG
    class var inexessTechnology: CompanyIdentifier { return CompanyIdentifier(id: 665, name: "Inexess Technology Simma KG") }
    /// Currant, Inc
    class var currantInc: CompanyIdentifier { return CompanyIdentifier(id: 666, name: "Currant, Inc") }
    /// C2 Development, Inc.
    class var c2Development: CompanyIdentifier { return CompanyIdentifier(id: 667, name: "C2 Development, Inc.") }
    /// Blue Sky Scientific, LLC
    class var blueSkyScientific: CompanyIdentifier { return CompanyIdentifier(id: 668, name: "Blue Sky Scientific, LLC") }
    /// ALOTTAZS LABS, LLC
    class var alottazsLabs: CompanyIdentifier { return CompanyIdentifier(id: 669, name: "ALOTTAZS LABS, LLC") }
    /// Kupson spol. s r.o.
    class var kupsonSpol: CompanyIdentifier { return CompanyIdentifier(id: 670, name: "Kupson spol. s r.o.") }
    /// Areus Engineering GmbH
    class var areusEngineering: CompanyIdentifier { return CompanyIdentifier(id: 671, name: "Areus Engineering GmbH") }
    /// Impossible Camera GmbH
    class var impossibleCamera: CompanyIdentifier { return CompanyIdentifier(id: 672, name: "Impossible Camera GmbH") }
    /// InventureTrack Systems
    class var inventureTrackSystems: CompanyIdentifier { return CompanyIdentifier(id: 673, name: "InventureTrack Systems") }
    /// LockedUp
    class var lockedUp: CompanyIdentifier { return CompanyIdentifier(id: 674, name: "LockedUp") }
    /// Itude
    class var iTude: CompanyIdentifier { return CompanyIdentifier(id: 675, name: "Itude") }
    /// Pacific Lock Company
    class var pacificLock: CompanyIdentifier { return CompanyIdentifier(id: 676, name: "Pacific Lock Company") }
    /// Tendyron Corporation
    class var tendyron: CompanyIdentifier { return CompanyIdentifier(id: 677, name: "Tendyron Corporation") }
    /// Robert Bosch GmbH
    class var robertBosch: CompanyIdentifier { return CompanyIdentifier(id: 678, name: "Robert Bosch GmbH") }
    /// Illuxtron international B.V.
    class var illuxtronInternational: CompanyIdentifier { return CompanyIdentifier(id: 679, name: "Illuxtron international B.V.") }
    /// miSport Ltd.
    class var miSport: CompanyIdentifier { return CompanyIdentifier(id: 680, name: "miSport Ltd.") }
    /// Chargelib
    class var chargeLib: CompanyIdentifier { return CompanyIdentifier(id: 681, name: "Chargelib") }
    /// Doppler Lab
    class var dopperLab: CompanyIdentifier { return CompanyIdentifier(id: 682, name: "Doppler Lab") }
    /// BBPOS Limited
    class var bbposLimited: CompanyIdentifier { return CompanyIdentifier(id: 683, name: "BBPOS Limited") }
    /// RTB Elektronik GmbH & Co. KG
    class var rtbElektronik: CompanyIdentifier { return CompanyIdentifier(id: 684, name: "RTB Elektronik GmbH & Co. KG") }
    /// Rx Networks, Inc.
    class var rxNetworks: CompanyIdentifier { return CompanyIdentifier(id: 685, name: "Rx Networks, Inc.") }
    /// WeatherFlow, Inc.
    class var weatherFlow: CompanyIdentifier { return CompanyIdentifier(id: 686, name: "WeatherFlow, Inc.") }
    /// Technicolor USA Inc.
    class var technicolor: CompanyIdentifier { return CompanyIdentifier(id: 687, name: "Technicolor USA Inc.") }
    /// Bestechnic(Shanghai),Ltd
    class var bestechnic: CompanyIdentifier { return CompanyIdentifier(id: 688, name: "Bestechnic(Shanghai),Ltd") }
    /// Raden Inc
    class var radenInc: CompanyIdentifier { return CompanyIdentifier(id: 689, name: "Raden Inc") }
    /// JouZen Oy
    class var jouZen: CompanyIdentifier { return CompanyIdentifier(id: 690, name: "JouZen Oy") }
    /// CLABER S.P.A.
    class var claber: CompanyIdentifier { return CompanyIdentifier(id: 691, name: "CLABER S.P.A.") }
    /// Hyginex, Inc.
    class var hyginex: CompanyIdentifier { return CompanyIdentifier(id: 692, name: "Hyginex, Inc.") }
    /// HANSHIN ELECTRIC RAILWAY CO.,LTD.
    class var hanshinElectricRailway: CompanyIdentifier { return CompanyIdentifier(id: 693, name: "HANSHIN ELECTRIC RAILWAY CO.,LTD.") }
    /// Schneider Electric
    class var schneiderElectric: CompanyIdentifier { return CompanyIdentifier(id: 694, name: "Schneider Electric") }
    /// Oort Technologies LLC
    class var oortTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 695, name: "Oort Technologies LLC") }
    /// Chrono Therapeutics
    class var chronoTherapeutics: CompanyIdentifier { return CompanyIdentifier(id: 696, name: "Chrono Therapeutics") }
    /// Rinnai Corporation
    class var rinnaiCorporation: CompanyIdentifier { return CompanyIdentifier(id: 697, name: "Rinnai Corporation") }
    /// Swissprime Technologies AG
    class var swissprimeTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 698, name: "Swissprime Technologies AG") }
    /// Koha.,Co.Ltd
    class var kohaCo: CompanyIdentifier { return CompanyIdentifier(id: 699, name: "Koha.,Co.Ltd") }
    /// Genevac Ltd
    class var gennevac: CompanyIdentifier { return CompanyIdentifier(id: 700, name: "Genevac Ltd") }
    /// Chemtronics
    class var chemtronics: CompanyIdentifier { return CompanyIdentifier(id: 701, name: "Chemtronics") }
    /// Seguro Technology Sp. z o.o.
    class var seguroTechnology: CompanyIdentifier { return CompanyIdentifier(id: 702, name: "Seguro Technology Sp. z o.o.") }
    /// Redbird Flight Simulations
    class var redbirdFlightSimulations: CompanyIdentifier { return CompanyIdentifier(id: 703, name: "Redbird Flight Simulations") }
    /// Dash Robotics
    class var dashRobotics: CompanyIdentifier { return CompanyIdentifier(id: 704, name: "Dash Robotics") }
    /// LINE Corporation
    class var lineCorporation: CompanyIdentifier { return CompanyIdentifier(id: 705, name: "LINE Corporation") }
    /// Guillemot Corporation
    class var guillemot: CompanyIdentifier { return CompanyIdentifier(id: 706, name: "Guillemot Corporation") }
    /// Techtronic Power Tools Technology Limited
    class var techtronicPowerTools: CompanyIdentifier { return CompanyIdentifier(id: 707, name: "Techtronic Power Tools Technology Limited") }
    /// Wilson Sporting Goods
    class var wilsonSportingGoods: CompanyIdentifier { return CompanyIdentifier(id: 708, name: "Wilson Sporting Goods") }
    /// Lenovo (Singapore) Pte Ltd.
    class var lenovo: CompanyIdentifier { return CompanyIdentifier(id: 709, name: "Lenovo (Singapore) Pte Ltd.") }
    /// Ayatan Sensors
    class var ayatanSensors: CompanyIdentifier { return CompanyIdentifier(id: 710, name: "Ayatan Sensors") }
    /// Electronics Tomorrow Limited
    class var electronicsTomorrow: CompanyIdentifier { return CompanyIdentifier(id: 711, name: "Electronics Tomorrow Limited") }
    /// VASCO Data Security International, Inc.
    class var vascoDataSecurity: CompanyIdentifier { return CompanyIdentifier(id: 712, name: "VASCO Data Security International, Inc.") }
    /// PayRange Inc.
    class var payRangeInc: CompanyIdentifier { return CompanyIdentifier(id: 713, name: "PayRange Inc.") }
    /// ABOV Semiconductor
    class var abovSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 714, name: "ABOV Semiconductor") }
    /// AINA-Wireless Inc.
    class var ainaWireless: CompanyIdentifier { return CompanyIdentifier(id: 715, name: "AINA-Wireless Inc.") }
    /// Eijkelkamp Soil & Water
    class var eijkelkampSoilWater: CompanyIdentifier { return CompanyIdentifier(id: 716, name: "Eijkelkamp Soil & Water") }
    /// BMA ergonomics b.v.
    class var bmaErgonomics: CompanyIdentifier { return CompanyIdentifier(id: 717, name: "BMA ergonomics b.v.") }
    /// Teva Branded Pharmaceutical Products R&D, Inc
    class var tevaBrandedPharmaceutical: CompanyIdentifier { return CompanyIdentifier(id: 718, name: "Teva Branded Pharmaceutical Products R&D, Inc") }
    /// Anima
    class var anima: CompanyIdentifier { return CompanyIdentifier(id: 719, name: "Anima") }
    /// 3M
    class var threeM: CompanyIdentifier { return CompanyIdentifier(id: 720, name: "3M") }
    /// Empatica Srl
    class var empatica: CompanyIdentifier { return CompanyIdentifier(id: 721, name: "Empatica Srl") }
    /// Afero, Inc
    class var aferoInc: CompanyIdentifier { return CompanyIdentifier(id: 722, name: "Afero, Inc") }
    /// Powercast Corporation
    class var powercastCorporation: CompanyIdentifier { return CompanyIdentifier(id: 723, name: "Powercast Corporation") }
    /// Secuyou ApS
    class var secuyou: CompanyIdentifier { return CompanyIdentifier(id: 724, name: "Secuyou ApS") }
    /// OMRON Corporation
    class var omronCorporation: CompanyIdentifier { return CompanyIdentifier(id: 725, name: "OMRON Corporation") }
    /// Send Solutions
    class var sendSolutions: CompanyIdentifier { return CompanyIdentifier(id: 726, name: "Send Solutions") }
    /// NIPPON SYSTEMWARE CO.,LTD.
    class var nipponSystemware: CompanyIdentifier { return CompanyIdentifier(id: 727, name: "NIPPON SYSTEMWARE CO.,LTD.") }
    /// Neosfar
    class var neosfar: CompanyIdentifier { return CompanyIdentifier(id: 728, name: "Neosfar") }
    /// Fliegl Agrartechnik GmbH
    class var flieglAgrartechnik: CompanyIdentifier { return CompanyIdentifier(id: 729, name: "Fliegl Agrartechnik GmbH") }
    /// Gilvader
    class var gilvader: CompanyIdentifier { return CompanyIdentifier(id: 730, name: "Gilvader") }
    /// Digi International Inc (R)
    class var digiInternational: CompanyIdentifier { return CompanyIdentifier(id: 731, name: "Digi International Inc") }
    /// DeWalch Technologies, Inc.
    class var deWalchTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 732, name: "DeWalch Technologies, Inc.") }
    /// Flint Rehabilitation Devices, LLC
    class var flintRehabilitationDevices: CompanyIdentifier { return CompanyIdentifier(id: 733, name: "Flint Rehabilitation Devices, LLC") }
    /// Samsung SDS Co., Ltd.
    class var samsungSds: CompanyIdentifier { return CompanyIdentifier(id: 734, name: "Samsung SDS Co., Ltd.") }
    /// Blur Product Development
    class var blurProductDevelopment: CompanyIdentifier { return CompanyIdentifier(id: 735, name: "Blur Product Development") }
    /// University of Michigan
    class var universityOfMichigan: CompanyIdentifier { return CompanyIdentifier(id: 736, name: "University of Michigan") }
    /// Victron Energy BV
    class var victronEnergy: CompanyIdentifier { return CompanyIdentifier(id: 737, name: "Victron Energy BV") }
    /// NTT docomo
    class var nttDocomo: CompanyIdentifier { return CompanyIdentifier(id: 738, name: "NTT docomo") }
    /// Carmanah Technologies Corp.
    class var carmanahTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 739, name: "Carmanah Technologies Corp.") }
    /// Bytestorm Ltd.
    class var bytestorm: CompanyIdentifier { return CompanyIdentifier(id: 740, name: "Bytestorm Ltd.") }
    /// Espressif Incorporated
    class var espressif: CompanyIdentifier { return CompanyIdentifier(id: 741, name: "Espressif Incorporated") }
    /// Unwire
    class var unwire: CompanyIdentifier { return CompanyIdentifier(id: 742, name: "Unwire") }
    /// Connected Yard, Inc.
    class var connectedYard: CompanyIdentifier { return CompanyIdentifier(id: 743, name: "Connected Yard, Inc.") }
    /// American Music Environments
    class var americanMusicEnvironments: CompanyIdentifier { return CompanyIdentifier(id: 744, name: "American Music Environments") }
    /// Sensogram Technologies, Inc.
    class var sensogramTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 745, name: "Sensogram Technologies, Inc.") }
    /// Fujitsu Limited
    class var fujitsuLimited: CompanyIdentifier { return CompanyIdentifier(id: 746, name: "Fujitsu Limited") }
    /// Ardic Technology
    class var ardicTechnology: CompanyIdentifier { return CompanyIdentifier(id: 747, name: "Ardic Technology") }
    /// Delta Systems, Inc
    class var deltaSystems: CompanyIdentifier { return CompanyIdentifier(id: 748, name: "Delta Systems, Inc") }
    /// HTC Corporation
    class var htcCorporation: CompanyIdentifier { return CompanyIdentifier(id: 749, name: "HTC Corporation") }
    /// Citizen Holdings Co., Ltd.
    class var citizenHoldings: CompanyIdentifier { return CompanyIdentifier(id: 750, name: "Citizen Holdings Co., Ltd.") }
    /// SMART-INNOVATION.inc
    class var smartInnovation: CompanyIdentifier { return CompanyIdentifier(id: 751, name: "SMART-INNOVATION.inc") }
    /// Blackrat Software
    class var blackratSoftware: CompanyIdentifier { return CompanyIdentifier(id: 752, name: "Blackrat Software") }
    /// The Idea Cave, LLC
    class var theIdeaCave: CompanyIdentifier { return CompanyIdentifier(id: 753, name: "The Idea Cave, LLC") }
    /// GoPro, Inc.
    class var goPro: CompanyIdentifier { return CompanyIdentifier(id: 754, name: "GoPro, Inc.") }
    /// AuthAir, Inc
    class var authAir: CompanyIdentifier { return CompanyIdentifier(id: 755, name: "AuthAir, Inc") }
    /// Vensi, Inc.
    class var vensi: CompanyIdentifier { return CompanyIdentifier(id: 756, name: "Vensi, Inc.") }
    /// Indagem Tech LLC
    class var indagemTech: CompanyIdentifier { return CompanyIdentifier(id: 757, name: "Indagem Tech LLC") }
    /// Intemo Technologies
    class var intemoTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 758, name: "Intemo Technologies") }
    /// DreamVisions co., Ltd.
    class var dreamVisions: CompanyIdentifier { return CompanyIdentifier(id: 759, name: "DreamVisions co., Ltd.") }
    /// Runteq Oy Ltd
    class var runteq: CompanyIdentifier { return CompanyIdentifier(id: 760, name: "Runteq Oy Ltd") }
    /// IMAGINATION TECHNOLOGIES LTD
    class var imaginationTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 761, name: "IMAGINATION TECHNOLOGIES LTD") }
    /// CoSTAR TEchnologies
    class var coStarTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 762, name: "CoSTAR TEchnologies") }
    /// Clarius Mobile Health Corp
    class var clariusMobileHeatlthCorp: CompanyIdentifier { return CompanyIdentifier(id: 763, name: "Clarius Mobile Health Corp") }
    /// Shanghai Frequen Microelectronics Co., Ltd.
    class var shanghaiFrequenMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 764, name: "Shanghai Frequen Microelectronics Co., Ltd.") }
    /// Uwanna, Inc.
    class var uwanna: CompanyIdentifier { return CompanyIdentifier(id: 765, name: "Uwanna, Inc.") }
    /// Lierda Science & Technology Group Co., Ltd.
    class var lierdaScienceTechnology: CompanyIdentifier { return CompanyIdentifier(id: 766, name: "Lierda Science & Technology Group Co., Ltd.") }
    /// Silicon Laboratories
    class var siliconLaboratories: CompanyIdentifier { return CompanyIdentifier(id: 767, name: "Silicon Laboratories") }
    /// World Moto Inc.
    class var worldMoto: CompanyIdentifier { return CompanyIdentifier(id: 768, name: "World Moto Inc.") }
    /// Giatec Scientific Inc.
    class var giatecScientific: CompanyIdentifier { return CompanyIdentifier(id: 769, name: "Giatec Scientific Inc.") }
    /// Loop Devices, Inc
    class var loopDevices: CompanyIdentifier { return CompanyIdentifier(id: 770, name: "Loop Devices, Inc") }
    /// IACA electronique
    class var iacaElectronique: CompanyIdentifier { return CompanyIdentifier(id: 771, name: "IACA electronique") }
    /// Martians Inc
    class var martians: CompanyIdentifier { return CompanyIdentifier(id: 772, name: "Martians Inc") }
    /// Swipp ApS
    class var swipp: CompanyIdentifier { return CompanyIdentifier(id: 773, name: "Swipp ApS") }
    /// Life Laboratory Inc.
    class var lifeLaboratory: CompanyIdentifier { return CompanyIdentifier(id: 774, name: "Life Laboratory Inc.") }
    /// FUJI INDUSTRIAL CO.,LTD.
    class var fujiIndustrial: CompanyIdentifier { return CompanyIdentifier(id: 775, name: "FUJI INDUSTRIAL CO.,LTD.") }
    /// Surefire, LLC
    class var surefire: CompanyIdentifier { return CompanyIdentifier(id: 776, name: "Surefire, LLC") }
    /// Dolby Labs
    class var dolbyLabs: CompanyIdentifier { return CompanyIdentifier(id: 777, name: "Dolby Labs") }
    /// Ellisys
    class var ellisys: CompanyIdentifier { return CompanyIdentifier(id: 778, name: "Ellisys") }
    /// Magnitude Lighting Converters
    class var magnitudeLightingConverters: CompanyIdentifier { return CompanyIdentifier(id: 779, name: "Magnitude Lighting Converters") }
    /// Hilti AG
    class var hilti: CompanyIdentifier { return CompanyIdentifier(id: 780, name: "Hilti AG") }
    /// Devdata S.r.l.
    class var davdata: CompanyIdentifier { return CompanyIdentifier(id: 781, name: "Devdata S.r.l.") }
    /// Deviceworx
    class var deviceworx: CompanyIdentifier { return CompanyIdentifier(id: 782, name: "Deviceworx") }
    /// Shortcut Labs
    class var shortcutLabs: CompanyIdentifier { return CompanyIdentifier(id: 783, name: "Shortcut Labs") }
    /// SGL Italia S.r.l.
    class var sglItalia: CompanyIdentifier { return CompanyIdentifier(id: 784, name: "SGL Italia S.r.l.") }
    /// PEEQ DATA
    class var peeqData: CompanyIdentifier { return CompanyIdentifier(id: 785, name: "PEEQ DATA") }
    /// Ducere Technologies Pvt Ltd
    class var ducereTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 786, name: "Ducere Technologies Pvt Ltd") }
    /// DiveNav, Inc.
    class var diveNav: CompanyIdentifier { return CompanyIdentifier(id: 787, name: "DiveNav, Inc.") }
    /// RIIG AI Sp. z o.o.
    class var riigAi: CompanyIdentifier { return CompanyIdentifier(id: 788, name: "RIIG AI Sp. z o.o.") }
    /// Thermo Fisher Scientific
    class var thermoFisher: CompanyIdentifier { return CompanyIdentifier(id: 789, name: "Thermo Fisher Scientific") }
    /// AG Measurematics Pvt. Ltd.
    class var agMeasurematics: CompanyIdentifier { return CompanyIdentifier(id: 790, name: "AG Measurematics Pvt. Ltd.") }
    /// CHUO Electronics CO., LTD.
    class var chuoElectronics: CompanyIdentifier { return CompanyIdentifier(id: 791, name: "CHUO Electronics CO., LTD.") }
    /// Aspenta International
    class var aspentaInternational: CompanyIdentifier { return CompanyIdentifier(id: 792, name: "Aspenta International") }
    /// Eugster Frismag AG
    class var eugsterFrismag: CompanyIdentifier { return CompanyIdentifier(id: 793, name: "Eugster Frismag AG") }
    /// Amber wireless GmbH
    class var amberWireless: CompanyIdentifier { return CompanyIdentifier(id: 794, name: "Amber wireless GmbH") }
    /// HQ Inc
    class var hqInc: CompanyIdentifier { return CompanyIdentifier(id: 795, name: "HQ Inc") }
    /// Lab Sensor Solutions
    class var labSensorSolutions: CompanyIdentifier { return CompanyIdentifier(id: 796, name: "Lab Sensor Solutions") }
    /// Enterlab ApS
    class var enterlab: CompanyIdentifier { return CompanyIdentifier(id: 797, name: "Enterlab ApS") }
    /// Eyefi, Inc.
    class var eyeFi: CompanyIdentifier { return CompanyIdentifier(id: 798, name: "Eyefi, Inc.") }
    /// MetaSystem S.p.A.
    class var metaSystems: CompanyIdentifier { return CompanyIdentifier(id: 799, name: "MetaSystem S.p.A.") }
    /// SONO ELECTRONICS. CO., LTD
    class var sonoElectronics: CompanyIdentifier { return CompanyIdentifier(id: 800, name: "SONO ELECTRONICS. CO., LTD") }
    /// Jewelbots
    class var jewelbots: CompanyIdentifier { return CompanyIdentifier(id: 801, name: "Jewelbots") }
    /// Compumedics Limited
    class var compumedics: CompanyIdentifier { return CompanyIdentifier(id: 802, name: "Compumedics Limited") }
    /// Rotor Bike Components
    class var rotorBikeComponents: CompanyIdentifier { return CompanyIdentifier(id: 803, name: "Rotor Bike Components") }
    /// Astro, Inc.
    class var astroInc: CompanyIdentifier { return CompanyIdentifier(id: 804, name: "Astro, Inc.") }
    /// Amotus Solutions
    class var amotusSolutions: CompanyIdentifier { return CompanyIdentifier(id: 805, name: "Amotus Solutions") }
    /// Healthwear Technologies (Changzhou)Ltd
    class var healthwearTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 806, name: "Healthwear Technologies (Changzhou)Ltd") }
    /// Essex Electronics
    class var essexElectronics: CompanyIdentifier { return CompanyIdentifier(id: 807, name: "Essex Electronics") }
    /// Grundfos A/S
    class var grundfos: CompanyIdentifier { return CompanyIdentifier(id: 808, name: "Grundfos A/S") }
    /// Eargo, Inc
    class var eargoInc: CompanyIdentifier { return CompanyIdentifier(id: 809, name: "Eargo, Inc") }
    /// Electronic Design Lab
    class var electronicDesignLab: CompanyIdentifier { return CompanyIdentifier(id: 810, name: "Electronic Design Lab") }
    /// ESYLUX
    class var esylux: CompanyIdentifier { return CompanyIdentifier(id: 811, name: "ESYLUX") }
    /// NIPPON SMT.CO.,Ltd
    class var nipponSmt: CompanyIdentifier { return CompanyIdentifier(id: 812, name: "NIPPON SMT.CO.,Ltd") }
    /// BM innovations GmbH
    class var bmInnovations: CompanyIdentifier { return CompanyIdentifier(id: 813, name: "BM innovations GmbH") }
    /// indoormap
    class var indoormap: CompanyIdentifier { return CompanyIdentifier(id: 814, name: "indoormap") }
    /// OttoQ Inc
    class var ottoQ: CompanyIdentifier { return CompanyIdentifier(id: 815, name: "OttoQ Inc") }
    /// North Pole Engineering
    class var northPoleEngineering: CompanyIdentifier { return CompanyIdentifier(id: 816, name: "North Pole Engineering") }
    /// 3flares Technologies Inc.
    class var threeFlaresTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 817, name: "3flares Technologies Inc.") }
    /// Electrocompaniet A.S.
    class var electrocompaniet: CompanyIdentifier { return CompanyIdentifier(id: 818, name: "Electrocompaniet A.S.") }
    /// Mul-T-Lock
    class var mulTLock: CompanyIdentifier { return CompanyIdentifier(id: 819, name: "Mul-T-Lock") }
    /// Corentium AS
    class var corentium: CompanyIdentifier { return CompanyIdentifier(id: 820, name: "Corentium AS") }
    /// Enlighted Inc
    class var enlightedInc: CompanyIdentifier { return CompanyIdentifier(id: 821, name: "Enlighted Inc") }
    /// GISTIC
    class var gistic: CompanyIdentifier { return CompanyIdentifier(id: 822, name: "GISTIC") }
    /// AJP2 Holdings, LLC
    class var ajp2Holdings: CompanyIdentifier { return CompanyIdentifier(id: 823, name: "AJP2 Holdings, LLC") }
    /// COBI GmbH
    class var cobi: CompanyIdentifier { return CompanyIdentifier(id: 824, name: "COBI GmbH") }
    /// Blue Sky Scientific, LLC
    class var blueSkyScientificLlc: CompanyIdentifier { return CompanyIdentifier(id: 825, name: "Blue Sky Scientific, LLC") }
    /// Appception, Inc.
    class var appception: CompanyIdentifier { return CompanyIdentifier(id: 826, name: "Appception, Inc.") }
    /// Courtney Thorne Limited
    class var courtneyThorne: CompanyIdentifier { return CompanyIdentifier(id: 827, name: "Courtney Thorne Limited") }
    /// Virtuosys
    class var virtuosys: CompanyIdentifier { return CompanyIdentifier(id: 828, name: "Virtuosys") }
    /// TPV Technology Limited
    class var tpvTechnologyLimited: CompanyIdentifier { return CompanyIdentifier(id: 829, name: "TPV Technology Limited") }
    /// Monitra SA
    class var monitra: CompanyIdentifier { return CompanyIdentifier(id: 830, name: "Monitra SA") }
    /// Automation Components, Inc.
    class var automationComponents: CompanyIdentifier { return CompanyIdentifier(id: 831, name: "Automation Components, Inc.") }
    /// Letsense s.r.l.
    class var letsense: CompanyIdentifier { return CompanyIdentifier(id: 832, name: "Letsense s.r.l.") }
    /// Etesian Technologies LLC
    class var etesianTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 833, name: "Etesian Technologies LLC") }
    /// GERTEC BRASIL LTDA
    class var gertecBrasil: CompanyIdentifier { return CompanyIdentifier(id: 834, name: "GERTEC BRASIL LTDA") }
    /// Drekker Development Pty. Ltd.
    class var drekkerDevelopment: CompanyIdentifier { return CompanyIdentifier(id: 835, name: "Drekker Development Pty. Ltd.") }
    /// Whirl Inc.
    class var whirl: CompanyIdentifier { return CompanyIdentifier(id: 836, name: "Whirl Inc.") }
    /// Locus Positioning
    class var locusPositioning: CompanyIdentifier { return CompanyIdentifier(id: 837, name: "Locus Positioning") }
    /// Acuity Brands Lighting, Inc
    class var acuityBrandsLighting: CompanyIdentifier { return CompanyIdentifier(id: 838, name: "Acuity Brands Lighting, Inc") }
    /// Prevent Biometrics
    class var preventBiometrics: CompanyIdentifier { return CompanyIdentifier(id: 839, name: "Prevent Biometrics") }
    /// Arioneo
    class var arioneo: CompanyIdentifier { return CompanyIdentifier(id: 840, name: "Arioneo") }
    /// VersaMe
    class var versaMe: CompanyIdentifier { return CompanyIdentifier(id: 841, name: "VersaMe") }
    /// Vaddio
    class var vaddio: CompanyIdentifier { return CompanyIdentifier(id: 842, name: "Vaddio") }
    /// Libratone A/S
    class var libratone: CompanyIdentifier { return CompanyIdentifier(id: 843, name: "Libratone A/S") }
    /// HM Electronics, Inc.
    class var hmElectronics: CompanyIdentifier { return CompanyIdentifier(id: 844, name: "HM Electronics, Inc.") }
    /// TASER International, Inc.
    class var taserInternational: CompanyIdentifier { return CompanyIdentifier(id: 845, name: "TASER International, Inc.") }
    /// SafeTrust Inc.
    class var safeTrust: CompanyIdentifier { return CompanyIdentifier(id: 846, name: "SafeTrust Inc.") }
    /// Heartland Payment Systems
    class var heartlandPaymentSystems: CompanyIdentifier { return CompanyIdentifier(id: 847, name: "Heartland Payment Systems") }
    /// Bitstrata Systems Inc.
    class var bitstrataSystems: CompanyIdentifier { return CompanyIdentifier(id: 848, name: "Bitstrata Systems Inc.") }
    /// Pieps GmbH
    class var pieps: CompanyIdentifier { return CompanyIdentifier(id: 849, name: "Pieps GmbH") }
    /// iRiding(Xiamen)Technology Co.,Ltd.
    class var iRidingTechnology: CompanyIdentifier { return CompanyIdentifier(id: 850, name: "iRiding(Xiamen)Technology Co.,Ltd.") }
    /// Alpha Audiotronics, Inc.
    class var alphaAudiotronics: CompanyIdentifier { return CompanyIdentifier(id: 851, name: "Alpha Audiotronics, Inc.") }
    /// TOPPAN FORMS CO.,LTD.
    class var toppanForms: CompanyIdentifier { return CompanyIdentifier(id: 852, name: "TOPPAN FORMS CO.,LTD.") }
    /// Sigma Designs, Inc.
    class var sigmaDesigns: CompanyIdentifier { return CompanyIdentifier(id: 853, name: "Sigma Designs, Inc.") }
    /// Spectrum Brands, Inc.
    class var spectrumBrands: CompanyIdentifier { return CompanyIdentifier(id: 854, name: "Spectrum Brands, Inc.") }
    /// Polymap Wireless
    class var polymapWiress: CompanyIdentifier { return CompanyIdentifier(id: 855, name: "Polymap Wireless") }
    /// MagniWare Ltd.
    class var magniWare: CompanyIdentifier { return CompanyIdentifier(id: 856, name: "MagniWare Ltd.") }
    /// Novotec Medical GmbH
    class var novotecMedical: CompanyIdentifier { return CompanyIdentifier(id: 857, name: "Novotec Medical GmbH") }
    /// Medicom Innovation Partner a/s
    class var medicomInnovationPartner: CompanyIdentifier { return CompanyIdentifier(id: 858, name: "Medicom Innovation Partner a/s") }
    /// Matrix Inc.
    class var matrix: CompanyIdentifier { return CompanyIdentifier(id: 859, name: "Matrix Inc.") }
    /// Eaton Corporation
    class var eaton: CompanyIdentifier { return CompanyIdentifier(id: 860, name: "Eaton Corporation") }
    /// KYS
    class var kys: CompanyIdentifier { return CompanyIdentifier(id: 861, name: "KYS") }
    /// Naya Health, Inc.
    class var nayaHealth: CompanyIdentifier { return CompanyIdentifier(id: 862, name: "Naya Health, Inc.") }
    /// Acromag
    class var acromag: CompanyIdentifier { return CompanyIdentifier(id: 863, name: "Acromag") }
    /// Insulet Corporation
    class var insulet: CompanyIdentifier { return CompanyIdentifier(id: 864, name: "Insulet Corporation") }
    /// Wellinks Inc.
    class var welllinks: CompanyIdentifier { return CompanyIdentifier(id: 865, name: "Wellinks Inc.") }
    /// ON Semiconductor
    class var onSemiconductor: CompanyIdentifier { return CompanyIdentifier(id: 866, name: "ON Semiconductor") }
    /// FREELAP SA
    class var freelap: CompanyIdentifier { return CompanyIdentifier(id: 867, name: "FREELAP SA") }
    /// Favero Electronics Srl
    class var faveroElectronics: CompanyIdentifier { return CompanyIdentifier(id: 868, name: "Favero Electronics Srl") }
    /// BioMech Sensor LLC
    class var bioMechSensor: CompanyIdentifier { return CompanyIdentifier(id: 869, name: "BioMech Sensor LLC") }
    /// BOLTT Sports technologies Private limited
    class var bolttSportsTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 870, name: "BOLTT Sports technologies Private limited") }
    /// Saphe International
    class var sapheInternational: CompanyIdentifier { return CompanyIdentifier(id: 871, name: "Saphe International") }
    /// Metormote AB
    class var metromote: CompanyIdentifier { return CompanyIdentifier(id: 872, name: "Metormote AB") }
    /// littleBits
    class var littleBits: CompanyIdentifier { return CompanyIdentifier(id: 873, name: "littleBits") }
    /// SetPoint Medical
    class var setPointMedical  : CompanyIdentifier { return CompanyIdentifier(id: 874, name: "SetPoint Medical") }
    /// BRControls Products BV
    class var brControlsProducts: CompanyIdentifier { return CompanyIdentifier(id: 875, name: "BRControls Products BV") }
    /// Zipcar
    class var zipcar: CompanyIdentifier { return CompanyIdentifier(id: 876, name: "Zipcar") }
    /// AirBolt Pty Ltd
    class var airBolt: CompanyIdentifier { return CompanyIdentifier(id: 877, name: "AirBolt Pty Ltd") }
    /// KeepTruckin Inc
    class var keepTruckin: CompanyIdentifier { return CompanyIdentifier(id: 878, name: "KeepTruckin Inc") }
    /// Motiv, Inc.
    class var motiv: CompanyIdentifier { return CompanyIdentifier(id: 879, name: "Motiv, Inc.") }
    /// Wazombi Labs OÜ
    class var wazombiLabs: CompanyIdentifier { return CompanyIdentifier(id: 880, name: "Wazombi Labs OÜ") }
    /// ORBCOMM
    class var orbcomm: CompanyIdentifier { return CompanyIdentifier(id: 881, name: "ORBCOMM") }
    /// Nixie Labs, Inc.
    class var nixieLabs: CompanyIdentifier { return CompanyIdentifier(id: 882, name: "Nixie Labs, Inc.") }
    /// AppNearMe Ltd
    class var appNearMe: CompanyIdentifier { return CompanyIdentifier(id: 883, name: "AppNearMe Ltd") }
    /// Holman Industries
    class var holmanIndustries: CompanyIdentifier { return CompanyIdentifier(id: 884, name: "Holman Industries") }
    /// Expain AS
    class var expain: CompanyIdentifier { return CompanyIdentifier(id: 885, name: "Expain AS") }
    /// Electronic Temperature Instruments Ltd
    class var electronicTemperatureInstruments: CompanyIdentifier { return CompanyIdentifier(id: 886, name: "Electronic Temperature Instruments Ltd") }
    /// Plejd AB
    class var plejd: CompanyIdentifier { return CompanyIdentifier(id: 887, name: "Plejd AB") }
    /// Propeller Health
    class var propellerHealth: CompanyIdentifier { return CompanyIdentifier(id: 888, name: "Propeller Health") }
    /// Shenzhen iMCO Electronic Technology Co.,Ltd
    class var shenzhenImcoElectronicTechnology: CompanyIdentifier { return CompanyIdentifier(id: 889, name: "Shenzhen iMCO Electronic Technology Co.,Ltd") }
    /// Algoria
    class var algoria: CompanyIdentifier { return CompanyIdentifier(id: 890, name: "Algoria") }
    /// Apption Labs Inc.
    class var apptionLabs: CompanyIdentifier { return CompanyIdentifier(id: 891, name: "Apption Labs Inc.") }
    /// Cronologics Corporation
    class var chronologicsCorporation: CompanyIdentifier { return CompanyIdentifier(id: 892, name: "Cronologics Corporation") }
    /// MICRODIA Ltd.
    class var microdia: CompanyIdentifier { return CompanyIdentifier(id: 893, name: "MICRODIA Ltd.") }
    /// lulabytes S.L.
    class var lulabytes: CompanyIdentifier { return CompanyIdentifier(id: 894, name: "lulabytes S.L.") }
    /// Nestec S.A.
    class var nestec: CompanyIdentifier { return CompanyIdentifier(id: 895, name: "Nestec S.A.") }
    /// MEGA-F service LLC
    class var megaFService: CompanyIdentifier { return CompanyIdentifier(id: 896, name: "MEGA-F service LLC") }
    /// Sharp Corporation
    class var sharp: CompanyIdentifier { return CompanyIdentifier(id: 897, name: "Sharp Corporation") }
    /// Precision Outcomes Ltd
    class var percisionOutcomes: CompanyIdentifier { return CompanyIdentifier(id: 898, name: "Precision Outcomes Ltd") }
    /// Kronos Incorporated
    class var kronosIncorporated: CompanyIdentifier { return CompanyIdentifier(id: 899, name: "Kronos Incorporated") }
    /// OCOSMOS Co., Ltd.
    class var ocosmos: CompanyIdentifier { return CompanyIdentifier(id: 900, name: "OCOSMOS Co., Ltd.") }
    /// Embedded Electronic Solutions Ltd. dba e2Solutions
    class var embeddedElectronicSolutions: CompanyIdentifier { return CompanyIdentifier(id: 901, name: "Embedded Electronic Solutions Ltd. dba e2Solutions") }
    /// Aterica Inc.
    class var aterica: CompanyIdentifier { return CompanyIdentifier(id: 902, name: "Aterica Inc.") }
    /// BluStor PMC, Inc.
    class var blueStore: CompanyIdentifier { return CompanyIdentifier(id: 903, name: "BluStor PMC, Inc.") }
    /// Kapsch TrafficCom AB
    class var kapschTrafficCom: CompanyIdentifier { return CompanyIdentifier(id: 904, name: "Kapsch TrafficCom AB") }
    /// ActiveBlu Corporation
    class var activeBlu: CompanyIdentifier { return CompanyIdentifier(id: 905, name: "ActiveBlu Corporation") }
    /// Kohler Mira Limited
    class var kohlerMira: CompanyIdentifier { return CompanyIdentifier(id: 906, name: "Kohler Mira Limited") }
    /// Noke
    class var noke: CompanyIdentifier { return CompanyIdentifier(id: 907, name: "Noke") }
    /// Appion Inc.
    class var appionInc: CompanyIdentifier { return CompanyIdentifier(id: 908, name: "Appion Inc.") }
    /// Resmed Ltd
    class var resmed: CompanyIdentifier { return CompanyIdentifier(id: 909, name: "Resmed Ltd") }
    /// Crownstone B.V.
    class var crownstone: CompanyIdentifier { return CompanyIdentifier(id: 910, name: "Crownstone B.V.") }
    /// Xiaomi Inc.
    class var xiaomi: CompanyIdentifier { return CompanyIdentifier(id: 911, name: "Xiaomi Inc.") }
    /// INFOTECH s.r.o.
    class var infotech: CompanyIdentifier { return CompanyIdentifier(id: 912, name: "INFOTECH s.r.o.") }
    /// Thingsquare AB
    class var thingsquare: CompanyIdentifier { return CompanyIdentifier(id: 913, name: "Thingsquare AB") }
    /// T&D
    class var tAndD: CompanyIdentifier { return CompanyIdentifier(id: 914, name: "T&D") }
    /// LAVAZZA S.p.A.
    class var lavazza: CompanyIdentifier { return CompanyIdentifier(id: 915, name: "LAVAZZA S.p.A.") }
    /// Netclearance Systems, Inc.
    class var netclearanceSystems: CompanyIdentifier { return CompanyIdentifier(id: 916, name: "Netclearance Systems, Inc.") }
    /// SDATAWAY
    class var sdataway: CompanyIdentifier { return CompanyIdentifier(id: 917, name: "SDATAWAY") }
    /// BLOKS GmbH
    class var bloks: CompanyIdentifier { return CompanyIdentifier(id: 918, name: "BLOKS GmbH") }
    /// LEGO System A/S
    class var legoSystem: CompanyIdentifier { return CompanyIdentifier(id: 919, name: "LEGO System A/S") }
    /// Thetatronics Ltd
    class var thetatronics: CompanyIdentifier { return CompanyIdentifier(id: 920, name: "Thetatronics Ltd") }
    /// Nikon Corporation
    class var nikon: CompanyIdentifier { return CompanyIdentifier(id: 921, name: "Nikon Corporation") }
    /// NeST
    class var nest: CompanyIdentifier { return CompanyIdentifier(id: 922, name: "NeST") }
    /// South Silicon Valley Microelectronics
    class var southSiliconVallyMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 923, name: "South Silicon Valley Microelectronics") }
    /// ALE International
    class var aleInternational: CompanyIdentifier { return CompanyIdentifier(id: 924, name: "ALE International") }
    /// CareView Communications, Inc.
    class var careViewCommunications: CompanyIdentifier { return CompanyIdentifier(id: 925, name: "CareView Communications, Inc.") }
    /// SchoolBoard Limited
    class var schooBoardLimited: CompanyIdentifier { return CompanyIdentifier(id: 926, name: "SchoolBoard Limited") }
    /// Molex Corporation
    class var molex: CompanyIdentifier { return CompanyIdentifier(id: 927, name: "Molex Corporation") }
    /// IVT Wireless Limited
    class var ivtWireless: CompanyIdentifier { return CompanyIdentifier(id: 928, name: "IVT Wireless Limited") }
    /// Alpine Labs LLC
    class var alpineLabs: CompanyIdentifier { return CompanyIdentifier(id: 929, name: "Alpine Labs LLC") }
    /// Candura Instruments
    class var canduraInstruments: CompanyIdentifier { return CompanyIdentifier(id: 930, name: "Candura Instruments") }
    /// SmartMovt Technology Co., Ltd
    class var smartMovtTechnology: CompanyIdentifier { return CompanyIdentifier(id: 931, name: "SmartMovt Technology Co., Ltd") }
    /// Token Zero Ltd
    class var tokenZero: CompanyIdentifier { return CompanyIdentifier(id: 932, name: "Token Zero Ltd") }
    /// ACE CAD Enterprise Co., Ltd. (ACECAD)
    class var aceCadEnterprise: CompanyIdentifier { return CompanyIdentifier(id: 933, name: "ACE CAD Enterprise Co., Ltd. (ACECAD)") }
    /// Medela, Inc
    class var medelaInc: CompanyIdentifier { return CompanyIdentifier(id: 934, name: "Medela, Inc") }
    /// AeroScout
    class var aeroScout: CompanyIdentifier { return CompanyIdentifier(id: 935, name: "AeroScout") }
    /// Esrille Inc.
    class var esrille: CompanyIdentifier { return CompanyIdentifier(id: 936, name: "Esrille Inc.") }
    /// THINKERLY SRL
    class var thinkerly: CompanyIdentifier { return CompanyIdentifier(id: 937, name: "THINKERLY SRL") }
    /// Exon Sp. z o.o
    class var exonSp: CompanyIdentifier { return CompanyIdentifier(id: 938, name: "Exon Sp. z o.o.") }
    /// Meizu Technology Co., Ltd.
    class var meizuTechnology: CompanyIdentifier { return CompanyIdentifier(id: 939, name: "Meizu Technology Co., Ltd.") }
    /// Smablo LTD
    class var smablo: CompanyIdentifier { return CompanyIdentifier(id: 940, name: "Smablo LTD") }
    /// XiQ
    class var xiQ: CompanyIdentifier { return CompanyIdentifier(id: 941, name: "XiQ") }
    /// Allswell Inc.
    class var allswell: CompanyIdentifier { return CompanyIdentifier(id: 942, name: "Allswell Inc.") }
    /// Comm-N-Sense Corp DBA Verigo
    class var verigo: CompanyIdentifier { return CompanyIdentifier(id: 943, name: "Comm-N-Sense Corp DBA Verigo") }
    /// VIBRADORM GmbH
    class var virbradorm: CompanyIdentifier { return CompanyIdentifier(id: 944, name: "VIBRADORM GmbH") }
    /// Otodata Wireless Network Inc.
    class var otodataWirelessNetwork: CompanyIdentifier { return CompanyIdentifier(id: 945, name: "Otodata Wireless Network Inc.") }
    /// Propagation Systems Limited
    class var propagationSystems: CompanyIdentifier { return CompanyIdentifier(id: 946, name: "Propagation Systems Limited") }
    /// Midwest Instruments & Controls
    class var midwestInstrumentsControls: CompanyIdentifier { return CompanyIdentifier(id: 947, name: "Midwest Instruments & Controls") }
    /// Alpha Nodus, inc.
    class var alphaNodus: CompanyIdentifier { return CompanyIdentifier(id: 948, name: "Alpha Nodus, inc.") }
    /// petPOMM, Inc
    class var petPomm: CompanyIdentifier { return CompanyIdentifier(id: 949, name: "petPOMM, Inc") }
    /// Mattel
    class var mattel: CompanyIdentifier { return CompanyIdentifier(id: 950, name: "Mattel") }
    /// Airbly Inc.
    class var airblyInc: CompanyIdentifier { return CompanyIdentifier(id: 951, name: "Airbly Inc.") }
    /// A-Safe Limited
    class var aSafe: CompanyIdentifier { return CompanyIdentifier(id: 952, name: "A-Safe Limited") }
    /// FREDERIQUE CONSTANT SA
    class var frederiqueConstant: CompanyIdentifier { return CompanyIdentifier(id: 953, name: "FREDERIQUE CONSTANT SA") }
    /// Maxscend Microelectronics Company Limited
    class var maxscendMicroelectronics: CompanyIdentifier { return CompanyIdentifier(id: 954, name: "Maxscend Microelectronics Company Limited") }
    /// Abbott Diabetes Care
    class var abbottDiabetesCare: CompanyIdentifier { return CompanyIdentifier(id: 955, name: "Abbott Diabetes Care") }
    /// ASB Bank Ltd
    class var asbBank: CompanyIdentifier { return CompanyIdentifier(id: 956, name: "ASB Bank Ltd") }
    /// amadas
    class var amadas: CompanyIdentifier { return CompanyIdentifier(id: 957, name: "amadas") }
    /// Applied Science, Inc.
    class var appliedScience: CompanyIdentifier { return CompanyIdentifier(id: 958, name: "Applied Science, Inc.") }
    /// iLumi Solutions Inc.
    class var iLumiSolutions: CompanyIdentifier { return CompanyIdentifier(id: 959, name: "iLumi Solutions Inc.") }
    /// Arch Systems Inc
    class var archSystems: CompanyIdentifier { return CompanyIdentifier(id: 960, name: "Arch Systems Inc") }
    /// Ember Technologies, Inc.
    class var emberTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 961, name: "Ember Technologies, Inc.") }
    /// Snapchat Inc
    class var snapchat: CompanyIdentifier { return CompanyIdentifier(id: 962, name: "Snapchat Inc") }
    /// Casambi Technologies Oy
    class var casambiTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 963, name: "Casambi Technologies Oy") }
    /// Pico Technology Inc.
    class var picoTechnoloy: CompanyIdentifier { return CompanyIdentifier(id: 964, name: "Pico Technology Inc.") }
    /// St. Jude Medical, Inc.
    class var stJudeMedical: CompanyIdentifier { return CompanyIdentifier(id: 965, name: "St. Jude Medical, Inc.") }
    /// Intricon
    class var intricon: CompanyIdentifier { return CompanyIdentifier(id: 966, name: "Intricon") }
    /// Structural Health Systems, Inc.
    class var structuralHealthSystems: CompanyIdentifier { return CompanyIdentifier(id: 967, name: "Structural Health Systems, Inc.") }
    /// Avvel International
    class var avvelInternational: CompanyIdentifier { return CompanyIdentifier(id: 968, name: "Avvel International") }
    /// Gallagher Group
    class var gallagherGroup: CompanyIdentifier { return CompanyIdentifier(id: 969, name: "Gallagher Group") }
    /// In2things Automation Pvt. Ltd.
    class var in2thingsAutomation: CompanyIdentifier { return CompanyIdentifier(id: 970, name: "In2things Automation Pvt. Ltd.") }
    ///  SYSDEV Srl
    class var sysdev: CompanyIdentifier { return CompanyIdentifier(id: 971, name: "SYSDEV Srl") }
    /// Vonkil Technologies Ltd
    class var vonkilTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 972, name: "Vonkil Technologies Ltd") }
    /// Wynd Technologies, Inc.
    class var wyndTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 973, name: "Wynd Technologies, Inc.") }
    /// CONTRINEX S.A.
    class var contrinex: CompanyIdentifier { return CompanyIdentifier(id: 974, name: "CONTRINEX S.A.") }
    /// MIRA, Inc
    class var miraInc: CompanyIdentifier { return CompanyIdentifier(id: 975, name: "MIRA, Inc") }
    /// Watteam Ltd
    class var watteam: CompanyIdentifier { return CompanyIdentifier(id: 976, name: "Watteam Ltd") }
    /// Density Inc.
    class var densityInc: CompanyIdentifier { return CompanyIdentifier(id: 977, name: "Density Inc.") }
    /// IOT Pot India Private Limited
    class var iotPotIndia: CompanyIdentifier { return CompanyIdentifier(id: 978, name: "IOT Pot India Private Limited") }
    /// Sigma Connectivity AB
    class var sigmaConnectivity: CompanyIdentifier { return CompanyIdentifier(id: 979, name: "Sigma Connectivity AB") }
    /// PEG PEREGO SPA
    class var pegPerego: CompanyIdentifier { return CompanyIdentifier(id: 980, name: "PEG PEREGO SPA") }
    /// Wyzelink Systems Inc.
    class var wyzelinkSystems: CompanyIdentifier { return CompanyIdentifier(id: 981, name: "Wyzelink Systems Inc.") }
    /// Yota Devices LTD
    class var yotaDevices: CompanyIdentifier { return CompanyIdentifier(id: 982, name: "Yota Devices LTD") }
    /// FINSECUR
    class var finsecur: CompanyIdentifier { return CompanyIdentifier(id: 983, name: "FINSECUR") }
    /// Zen-Me Labs Ltd
    class var zenMeLabs: CompanyIdentifier { return CompanyIdentifier(id: 984, name: "Zen-Me Labs Ltd") }
    /// 3IWare Co., Ltd
    class var threeIWare: CompanyIdentifier { return CompanyIdentifier(id: 985, name: "3IWare Co., Ltd") }
    /// EnOcean GmbH
    class var enOcean: CompanyIdentifier { return CompanyIdentifier(id: 986, name: "EnOcean GmbH") }
    /// Instabeat, Inc
    class var instabeat: CompanyIdentifier { return CompanyIdentifier(id: 987, name: "Instabeat, Inc") }
    /// Nima Labs
    class var nimaLabs: CompanyIdentifier { return CompanyIdentifier(id: 988, name: "Nima Labs") }
    /// Andreas Stihl AG & Co. KG
    class var andreasStihl: CompanyIdentifier { return CompanyIdentifier(id: 989, name: "Andreas Stihl AG & Co. KG") }
    /// Nathan Rhoades LLC
    class var nathanRhoades: CompanyIdentifier { return CompanyIdentifier(id: 990, name: "Nathan Rhoades LLC") }
    /// Grob Technologies, LLC
    class var grobTechnologies: CompanyIdentifier { return CompanyIdentifier(id: 991, name: "Grob Technologies, LLC") }
    /// Actions (Zhuhai) Technology Co., Limited
    class var actionsZhuhaiTechnology: CompanyIdentifier { return CompanyIdentifier(id: 992, name: "Actions (Zhuhai) Technology Co., Limited") }
    /// SPD Development Company Ltd
    class var spdDevelopmentCompany: CompanyIdentifier { return CompanyIdentifier(id: 993, name: "SPD Development Company Ltd") }
    /// Sensoan Oy
    class var sensoan: CompanyIdentifier { return CompanyIdentifier(id: 994, name: "Sensoan Oy") }
    /// Qualcomm Life Inc
    class var qualcommLife: CompanyIdentifier { return CompanyIdentifier(id: 995, name: "Qualcomm Life Inc") }
    /// Chip-ing AG
    class var chiping: CompanyIdentifier { return CompanyIdentifier(id: 996, name: "Chip-ing AG") }
    /// ffly4u
    class var ffly4u: CompanyIdentifier { return CompanyIdentifier(id: 997, name: "ffly4u") }
    /// IoT Instruments Oy
    class var iotInstruments: CompanyIdentifier { return CompanyIdentifier(id: 998, name: "IoT Instruments Oy") }
    /// TRUE Fitness Technology
    class var trueFitnessTechnology: CompanyIdentifier { return CompanyIdentifier(id: 999, name: "TRUE Fitness Technology") }
}
