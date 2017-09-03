//
//  BluetoothManufacturer.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/6/17.
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


/// Manufacturer
///
public enum Manufacturer: UInt16 {
    /// Ericsson Technology Licensing
    case ericssonTechnology             = 0
    /// Nokia Mobile Phones
    case nokiaMobilePhone               = 1
    /// Intel Corp.
    case intel                          = 2
    /// IBM Corp.
    case ibm                            = 3
    /// Toshiba Corp.
    case toshibaCorp                    = 4
    /// 3Com
    case threeCom                       = 5
    /// Microsoft
    case microsoft                      = 6
    /// Lucent
    case lucent                         = 7
    /// Motorola
    case motorola                       = 8
    /// Infineon Technologies AG
    case infineonTechnologies           = 9
    /// Cambridge Silicon Radio
    case cambridgeSiliconRadio          = 10
    /// Silicon Wave
    case siliconWave                    = 11
    /// Digianswer A/S
    case digianswer                     = 12
    /// Texas Instruments Inc.
    case texasInstruments               = 13
    /// Parthus Technologies Inc.
    case parthusTechnologies            = 14
    /// Broadcom Corporation
    case broadcom                       = 15
    /// Mitel Semiconductor
    case mitelSemiconductor             = 16
    /// Widcomm, Inc.
    case windcomm                       = 17
    /// Zeevo, Inc.
    case zeevo                          = 18
    /// Atmel Corporation
    case atmel                          = 19
    /// Mitsubishi Electric Corporation
    case mitsubishi                     = 20
    /// RTX Telecom A/S
    case rtxTelecom                     = 21
    /// KC Technology Inc.
    case kcTechnology                   = 22
    /// Newlogic
    case newlogic                       = 23
    /// Transilica, Inc.
    case transilica                     = 24
    /// Rohde & Schwarz GmbH & Co. KG
    case rohdeAndSchwarz                = 25
    /// TTPCom Limited
    case ttpCom                         = 26
    /// Signia Technologies, Inc.
    case signiaTechnologies             = 27
    /// Conexant Systems Inc.
    case conexantSystems                = 28
    /// Qualcomm
    case qualcomm                       = 29
    /// Inventel
    case inventel                       = 30
    /// AVM Berlin
    case avmBerlin                      = 31
    /// BandSpeed, Inc.
    case bandSpeed                      = 32
    /// Mansella Ltd
    case mansella                       = 33
    /// NEC Corporation
    case nec                            = 34
    /// WavePlus Technology Co., Ltd.
    case wavePlusTechnology             = 35
    /// Alcatel
    case alcatel                        = 36
    /// NXP Semiconductors (formerly Philips Semiconductors)
    case nxpSemiconductors              = 37
    /// C Technologies
    case cTechnologies                  = 38
    /// Open Interface
    case openInterface                  = 39
    /// R F Micro Devices
    case rfMicroDevices                 = 40
    /// Hitachi Ltd
    case hitachi                        = 41
    /// Symbol Technologies, Inc.
    case symbolTechnologies             = 42
    /// Tenovis
    case tenovis                        = 43
    /// Macronix International Co. Ltd..
    case macronix                       = 44
    /// GCT Semiconductor
    case gctSemiconductor               = 45
    /// Norwood Systems
    case norwoodSystems                 = 46
    /// MewTel Technology Inc.
    case mewTelTechnology               = 47
    /// ST Microelectronics
    case stMicroelectronics             = 48
    /// Synopsys, Inc.
    case synopsys                       = 49
    /// Red-M (Communications) Ltd
    case redMCommunications             = 50
    /// Commil Ltd
    case commil                         = 51
    /// Computer Access Technology Corporation (CATC)
    case computerAccessTechnology       = 52
    /// Eclipse (HQ Espana) S.L.
    case eclipse                        = 53
    /// Renesas Electronics Corporation
    case renesasElectronics             = 54
    /// Mobilian Corporation
    case mobilianCorporation            = 55
    /// Terax
    case terax                          = 56
    /// Integrated System Solution Corp.
    case integratedSystemSolutionCorp   = 57
    /// Matsushita Electric Industrial Co., Ltd.
    case matsushita                     = 58
    /// Gennum Corporation
    case gennumCorporation              = 59
    /// BlackBerry Limited (formerly Research In Motion)
    case blackberry                     = 60
    /// IPextreme, Inc.
    case iPextreme                      = 61
    /// Systems and Chips, Inc
    case systemsAndChips                = 62
    /// Bluetooth SIG, Inc
    case bluetoothSIG                   = 63
    /// Seiko Epson Corporation
    case seikoEpsonCorporation          = 64
    /// Integrated Silicon Solution Taiwan, Inc.
    case integratedSiliconSolution      = 65
    /// CONWISE Technology Corporation Ltd
    case conwiseTechnology              = 66
    /// PARROT AUTOMOTIVE SAS
    case parrotAutomotive               = 67
    /// Socket Mobile
    case socketMobile                   = 68
    /// Atheros Communications, Inc.
    case atherosCommunications          = 69
    /// MediaTek, Inc.
    case mediaTek                       = 70
    /// Bluegiga
    case bluegiga                       = 71
    /// Marvell Technology Group Ltd.
    case marvellTechnology              = 72
    /// 3DSP Corporation
    case threeDSPCorporation            = 73
    /// Accel Semiconductor Ltd.
    case accelSemiconductor             = 74
    /// Continental Automotive Systems
    case continentalAutomotiveSystems   = 75
    /// Apple, Inc.
    case apple                          = 76
    /// Staccato Communications, Inc.
    case staccatoCommunications         = 77
    /// Avago Technologies
    case avagoTechnologies              = 78
    /// APT Ltd.
    case aptLtd                         = 79
    /// SiRF Technology, Inc.
    case sirfTechnology                 = 80
    /// Tzero Technologies, Inc.
    case tzeroTechnologies              = 81
    /// J&M Corporation
    case jAndMCorporation               = 82
    /// Free2move AB
    case free2Move                      = 83
    /// 3DiJoy Corporation
    case threeDiJoy                     = 84
    /// Plantronics, Inc.
    case plantronics                    = 85
    /// Sony Ericsson Mobile Communications
    case sonyEricassonMobile            = 86
    /// Harman International Industries, Inc.
    case harmanInternational            = 87
    /// Vizio, Inc.
    case vizio                          = 88
    /// Nordic Semiconductor ASA
    case nordicSemiconductor            = 89
    /// EM Microelectronic-Marin SA
    case emMicroeletronic               = 90
    /// Ralink Technology Corporation
    case ralinkTechnology               = 91
    /// Belkin International, Inc.
    case belkin                         = 92
    /// Realtek Semiconductor Corporation
    case realtekSemiconductor           = 93
    /// Stonestreet One, LLC
    case stonestreetOne                 = 94
    /// Wicentric, Inc.
    case wicentric                      = 95
    /// RivieraWaves S.A.S
    case rivieraWaves                   = 96
    /// RDA Microelectronics
    case rdaMicroelectronics            = 97
    /// Gibson Guitars
    case gibsonGuitars                  = 98
    /// MiCommand Inc.
    case miCommand                      = 99
    /// Band XI International, LLC
    case bandXI                         = 100
    /// Hewlett-Packard Company
    case hewlettPackard                 = 101
    /// 9Solutions Oy
    case nineSolutions                  = 102
    /// GN Netcom A/S
    case gnNetcom                       = 103
    /// General Motors
    case generalMotors                  = 104
    /// A&D Engineering, Inc.
    case adEngineering                  = 105
    /// MindTree Ltd.
    case mindTree                       = 106
    /// Polar Electro OY
    case polar                          = 107
    /// Beautiful Enterprise Co., Ltd.
    case beautifulEnterprise            = 108
    /// BriarTek, Inc
    case briarTek                       = 109
    /// Summit Data Communications, Inc.
    case summitDataCommunications       = 110
    /// Sound ID
    case soundID                        = 111
    /// Monster, LLC
    case monster                        = 112
    /// connectBlue AB
    case connectBlue                    = 113
    /// ShangHai Super Smart Electronics Co. Ltd.
    case shangHaiSuperSmart             = 114
    /// Group Sense Ltd.
    case groupSense                     = 115
    /// Zomm, LLC
    case zomm                           = 116
    /// Samsung Electronics Co. Ltd.
    case samsungElectronics             = 117
    /// Creative Technology Ltd.
    case creativeTechnology             = 118
    /// Laird Technologies
    case lairdTechnologies              = 119
    /// Nike, Inc.
    case nike                           = 120
    /// lesswire AG
    case lesswire                       = 121
    /// MStar Semiconductor, Inc.
    case mStarSemiconductor             = 122
    /// Hanlynn Technologies
    case hanlynnTechnologies            = 123
    /// A & R Cambridge
    case aAndRCambridge                 = 124
    /// Seers Technology Co., Ltd.
    case seersTechnology                = 125
    /// Sports Tracking Technologies Ltd.
    case sportsTrackingTechnologies     = 126
    /// Autonet Mobile
    case autonetMobile                  = 127
    /// DeLorme Publishing Company, Inc.
    case deLormePublishing              = 128
    /// WuXi Vimicro
    case wuXiVimicro                    = 129
    /// Sennheiser Communications A/S
    case sennheiser                     = 130
    /// TimeKeeping Systems, Inc.
    case timeKeepingSystems             = 131
    /// Ludus Helsinki Ltd.
    case ludusHelsinki                  = 132
    /// BlueRadios, Inc.
    case blueRadios                     = 133
    /// Equinux AG
    case equinux                        = 134
    /// Garmin International, Inc.
    case garmin                         = 135
    /// Ecotest
    case ecotest                        = 136
    /// GN ReSound A/S
    case gnResound                      = 137
    /// Jawbone
    case jawbone                        = 138
    /// Topcon Positioning Systems, LLC
    case topconPositioningSystems       = 139
    /// Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)
    case gimbal                         = 140
    /// Zscan Software
    case zScanSoftware                  = 141
    /// Quintic Corp
    case quinticCorp                    = 142
    /// Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)
    case telitWireless                  = 143
    /// Funai Electric Co., Ltd.
    case funaiElectric                  = 144
    /// Advanced PANMOBIL systems GmbH & Co. KG
    case advancedPanmobil               = 145
    /// ThinkOptics, Inc.
    case thinkOptics                    = 146
    /// Universal Electronics, Inc.
    case universalElectronics           = 147
    /// Airoha Technology Corp.
    case airohaTechnology               = 148
    /// NEC Lighting, Ltd.
    case necLighting                    = 149
    /// ODM Technology, Inc.
    case odmTechnology                  = 150
    /// ConnecteDevice Ltd.
    case connecteDevice                 = 151
    /// zero1.tv GmbH
    case zero1TV                        = 152
    /// i.Tech Dynamic Global Distribution Ltd.
    case iTechDynamic                   = 153
    /// Alpwise
    case alpwise                        = 154
    /// Jiangsu Toppower Automotive Electronics Co., Ltd.
    case jiangsuToppower                = 155
    /// Colorfy, Inc.
    case colorfy                        = 156
    /// Geoforce Inc.
    case geoforce                       = 157
    /// Bose Corporation
    case bose                           = 158
    /// Suunto Oy
    case suunto                         = 159
    /// Kensington Computer Products Group
    case kennsington                    = 160
    /// SR-Medizinelektronik
    case srMedizinelektronik            = 161
    /// Vertu Corporation Limited
    case vertu                          = 162
    /// Meta Watch Ltd.
    case metaWatch                      = 163
    /// LINAK A/S
    case linak                          = 164
    /// OTL Dynamics LLC
    case otlDynamics                    = 165
    /// Panda Ocean Inc.
    case pandaOcean                     = 166
    /// Visteon Corporation
    case visteonCorporation             = 167
    /// ARP Devices Limited
    case arpDevices                     = 168
    /// Magneti Marelli S.p.A
    case magnetiMarelli                 = 169
    /// CAEN RFID srl
    case caenRfid                       = 170
    /// Ingenieur-Systemgruppe Zahn GmbH
    case ingenieurSystemgruppe          = 171
    /// Green Throttle Games
    case greenThrottleGames             = 172
    /// Peter Systemtechnik GmbH
    case peterSystemtechnik             = 173
    /// Omegawave Oy
    case omegawave                      = 174
    /// Cinetix
    case cinetix                        = 175
    /// Passif Semiconductor Corp
    case passifSemiconductor            = 176
    /// Saris Cycling Group, Inc
    case sarisCyclingGroup              = 177
    /// Bekey A/S
    case bekey                          = 178
    /// Clarinox Technologies Pty. Ltd.
    case clarinoxTechnologies           = 179
    /// BDE Technology Co., Ltd.
    case bdeTechnology                  = 180
    /// Swirl Networks
    case swirlNetworks                  = 181
    /// Meso international
    case mesoInternational              = 182
    /// TreLab Ltd
    case treLab                         = 183
    /// Qualcomm Innovation Center, Inc. (QuIC)
    case qualcommInnovation             = 184
    /// Johnson Controls, Inc.
    case johnsonControls                = 185
    /// Starkey Laboratories Inc.
    case starkeyLaboratories            = 186
    /// S-Power Electronics Limited
    case sPowerElectronics              = 187
    /// Ace Sensor Inc
    case aceSensor                      = 188
    /// Aplix Corporation
    case aplixCorporation               = 189
    /// AAMP of America
    case aampOfAmerica                  = 190
    /// Stalmart Technology Limited
    case stalmartTechnology             = 191
    /// AMICCOM Electronics Corporation
    case amiccomElectronics             = 192
    /// Shenzhen Excelsecu Data Technology Co.,Ltd
    case shenzhenExcelsecuData          = 193
    /// Geneq Inc.
    case geneqInc                       = 194
    /// adidas AG
    case adidas                         = 195
    /// LG Electronics
    case lgElectronics                  = 196
    /// Onset Computer Corporation
    case onsetComputerCorporation       = 197
    /// Selfly BV
    case selfly                         = 198
    /// Quuppa Oy.
    case quuppa                         = 199
    /// GeLo Inc
    case geLo                           = 200
    /// Evluma
    case evluma                         = 201
    /// MC10
    case mc10                           = 202
    /// Binauric SE
    case binauric                       = 203
    /// Beats Electronics
    case beatsElectronics               = 204
    /// Microchip Technology Inc.
    case microchip                      = 205
    /// Elgato Systems GmbH
    case elgato                         = 206
    /// ARCHOS SA
    case archos                         = 207
    /// Dexcom, Inc.
    case dexcom                         = 208
    /// Polar Electro Europe B.V.
    case polarElectroEurope             = 209
    /// Dialog Semiconductor B.V.
    case dialogSemiconductor            = 210
    /// Taixingbang Technology (HK) Co,. LTD.
    case taixingbangTechnology          = 211
    /// Kawantech
    case kawantech                      = 212
    /// Austco Communication Systems
    case austcoCommunication            = 213
    /// Timex Group USA, Inc.
    case timex                          = 214
    /// Qualcomm Technologies, Inc.
    case qualcommTechnologies           = 215
    /// Qualcomm Connected Experiences, Inc.
    case qualcommConnectedExperiences   = 216
    /// Voyetra Turtle Beach
    case voyetra                        = 217
    /// txtr GmbH
    case txtr                           = 218
    /// Biosentronics
    case biosentronics                  = 219
    /// Procter & Gamble
    case procterGamble                  = 220
    /// Hosiden Corporation
    case hosiden                        = 221
    /// Muzik LLC
    case muzik                          = 222
    /// Misfit Wearables Corp
    case misfit                         = 223
    /// Google
    case google                         = 224
    /// Danlers Ltd
    case danlers                        = 225
    /// Semilink Inc
    case semilink                       = 226
    /// inMusic Brands, Inc
    case inMusicBrands                  = 227
    /// L.S. Research Inc.
    case lsResearch                     = 228
    /// Eden Software Consultants Ltd.
    case edenSoftwareConsultants        = 229
    /// Freshtemp
    case freshtemp                      = 230
    /// KS Technologies
    case ksTechnologies                 = 231



    //Non offical IDs
    case viiiiva                        = 16657 //Not in offical document (four eyes Viiiiva)
    case exogal                         = 17752 //Not in offical document
    case uniKey                         = 24065 //case 350:   return @"Unikey Technologies, Inc.";  Have the Byte order Wrong
    case dropcam                        = 35888 //not in offical document

    case reserved                       = 65535
}

public extension Manufacturer {

    /// String value for Manufacturer
    public var stringValue: String {

        switch self {
        case .ericssonTechnology:
            return "Ericsson Technology Licensing"

        case .nokiaMobilePhone:
            return "Nokia Mobile Phones"

        case .intel:
            return "Intel Corp"

        case .ibm:
            return "IBM Corp"

        case .toshibaCorp:
            return "Toshiba Corp."

        case .threeCom:
            return "3Com"

        case .microsoft:
            return "Microsoft"

        case .lucent:
            return "Lucent"

        case .motorola:
            return "Motorola"

        case .infineonTechnologies:
            return "Infineon Technologies AG"

        case .cambridgeSiliconRadio:
            return "Cambridge Silicon Radio"

        case .siliconWave:
            return "Silicon Wave"

        case .digianswer:
            return "Digianswer A/S"

        case .texasInstruments:
            return "Texas Instruments Inc."

        case .parthusTechnologies:
            return "Parthus Technologies Inc."

        case .broadcom:
            return "Broadcom Corporation"

        case .mitelSemiconductor:
            return "Mitel Semiconductor"

        case .windcomm:
            return "Widcomm, Inc."

        case .zeevo:
            return "Zeevo, Inc."

        case .atmel:
            return "Atmel Corporation"

        case .mitsubishi:
            return "Mitsubishi Electric Corporation"

        case .rtxTelecom:
            return "RTX Telecom A/S"

        case .kcTechnology:
            return "KC Technology Inc."

        case .newlogic:
            return "Newlogic"

        case .transilica:
            return "Transilica, Inc."

        case .rohdeAndSchwarz:
            return "Rohde & Schwarz GmbH & Co. KG"

        case .ttpCom:
            return "TTPCom Limited"

        case .signiaTechnologies:
            return "Signia Technologies, Inc."

        case .conexantSystems:
            return "Conexant Systems Inc."

        case .qualcomm:
            return "Qualcomm"

        case .inventel:
            return "Inventel"

        case .avmBerlin:
            return "AVM Berlin"

        case .bandSpeed:
            return "BandSpeed, Inc."

        case .mansella:
            return "Mansella Ltd"

        case .nec:
            return "NEC Corporation"

        case .wavePlusTechnology:
            return "WavePlus Technology Co., Ltd."

        case .alcatel:
            return "Alcatel"

        case .nxpSemiconductors:
            return "NXP Semiconductors"

        case .cTechnologies:
            return "C Technologies"

        case .openInterface:
            return "Open Interface"

        case .rfMicroDevices:
            return "R F Micro Devices"

        case .hitachi:
            return "Hitachi Ltd"

        case .symbolTechnologies:
            return "Symbol Technologies, Inc."

        case .tenovis:
            return "Tenovis"

        case .macronix:
            return "Macronix International Co. Ltd."

        case .gctSemiconductor:
            return "GCT Semiconductor"

        case .norwoodSystems:
            return "Norwood Systems"

        case .mewTelTechnology:
            return "MewTel Technology Inc"

        case .stMicroelectronics:
            return "ST Microelectronics"

        case .synopsys:
            return "Synopsys, Inc."

        case .redMCommunications:
            return "Red-M (Communications) Ltd"

        case .commil:
            return "Commil Ltd"

        case .computerAccessTechnology:
            return "Computer Access Technology Corporation (CATC)"

        case .eclipse:
            return "Eclipse (HQ Espana) S.L."

        case .renesasElectronics:
            return "Renesas Electronics Corporation"

        case .mobilianCorporation:
            return "Mobilian Corporation"

        case .terax:
            return "Terax"

        case .integratedSystemSolutionCorp:
            return "Integrated System Solution Corp"

        case .matsushita:
            return "Matsushita Electric Industrial Co., Ltd."

        case .gennumCorporation:
            return "Gennum Corporation"

        case .blackberry:
            return "BlackBerry Limited"

        case .iPextreme:
            return "IPextreme, Inc."

        case .systemsAndChips:
            return "Systems and Chips, Inc"

        case .bluetoothSIG:
            return "Bluetooth SIG, Inc"

        case .seikoEpsonCorporation:
            return "Seiko Epson Corporation"

        case .integratedSiliconSolution:
            return "Integrated Silicon Solution Taiwan, Inc"

        case .conwiseTechnology:
            return "CONWISE Technology Corporation Ltd"

        case .parrotAutomotive:
            return "PARROT AUTOMOTIVE SAS"

        case .socketMobile:
            return "Socket Mobile"

        case .atherosCommunications:
            return "Atheros Communications, Inc."

        case .mediaTek:
            return "MediaTek, Inc."

        case .bluegiga:
            return "Bluegiga"

        case .marvellTechnology:
            return "Marvell Technology Group Ltd"

        case .threeDSPCorporation:
            return "3DSP Corporation"

        case .accelSemiconductor:
            return "Accel Semiconductor Ltd."

        case .continentalAutomotiveSystems:
            return "Continental Automotive Systems"

        case .apple:
            return "Apple, Inc."

        case .staccatoCommunications:
            return "Staccato Communications, Inc."

        case .avagoTechnologies:
            return "Avago Technologies"

        case .aptLtd:
            return "APT Ltd."

        case .sirfTechnology:
            return "SiRF Technology, Inc."

        case .tzeroTechnologies:
            return "Tzero Technologies, Inc."

        case .jAndMCorporation:
            return "J&M Corporation"

        case .free2Move:
            return "Free2move AB"

        case .threeDiJoy:
            return "3DiJoy Corporation"

        case .plantronics:
            return "Plantronics, Inc."

        case .sonyEricassonMobile:
            return "Sony Ericsson Mobile Communications"

        case .harmanInternational:
            return "Harman International Industries, Inc."

        case .vizio:
            return "Vizio, Inc."

        case .nordicSemiconductor:
            return "Nordic Semiconductor ASA"

        case .emMicroeletronic:
            return "EM Microelectronic-Marin SA"

        case .ralinkTechnology:
            return "Ralink Technology Corporation"

        case .belkin:
            return "Belkin International, Inc."

        case .realtekSemiconductor:
            return "Realtek Semiconductor Corporation"

        case .stonestreetOne:
            return "Stonestreet One, LLC"

        case .wicentric:
            return "Wicentric, Inc."

        case .rivieraWaves:
            return "RivieraWaves S.A.S"

        case .rdaMicroelectronics:
            return "RDA Microelectronics"

        case .gibsonGuitars:
            return "Gibson Guitars"

        case .miCommand:
            return "MiCommand Inc."

        case .bandXI:
            return "Band XI International, LLC"

        case .hewlettPackard:
            return "Hewlett-Packard Company"

        case .nineSolutions:
            return "9Solutions Oy"

        case .gnNetcom:
            return "GN Netcom A/S"

        case .generalMotors:
            return "General Motors"

        case .adEngineering:
            return "A&D Engineering, Inc."

        case .mindTree:
            return "MindTree Ltd."

        case .polar:
            return "Polar Electro OY"

        case .beautifulEnterprise:
            return "Beautiful Enterprise Co., Ltd."

        case .briarTek:
            return "BriarTek, Inc."

        case .summitDataCommunications:
            return "Summit Data Communications, Inc."

        case .soundID:
            return "Sound ID"

        case .monster:
            return "Monster, LLC"

        case .connectBlue:
            return "connectBlue AB"

        case .shangHaiSuperSmart:
            return "ShangHai Super Smart Electronics Co. Ltd."

        case .groupSense:
            return "Group Sense Ltd."

        case .zomm:
            return "Zomm, LLC"

        case .samsungElectronics:
            return "Samsung Electronics Co. Ltd."

        case .creativeTechnology:
            return "Creative Technology Ltd."

        case .lairdTechnologies:
            return "Laird Technologies"

        case .nike:
            return "Nike, Inc."

        case .lesswire:
            return "lesswire AG"

        case .mStarSemiconductor:
            return "MStar Semiconductor, Inc."

        case .hanlynnTechnologies:
            return "Hanlynn Technologies"

        case .aAndRCambridge:
            return "A & R Cambridge"

        case .seersTechnology:
            return "Seers Technology Co., Ltd."

        case .sportsTrackingTechnologies:
            return "Sports Tracking Technologies Ltd."

        case .autonetMobile:
            return "Autonet Mobile"

        case .deLormePublishing:
            return "DeLorme Publishing Company, Inc."

        case .wuXiVimicro:
            return "WuXi Vimicro"

        case .sennheiser:
            return "Sennheiser Communications A/S"

        case .timeKeepingSystems:
            return "TimeKeeping Systems, Inc."

        case .ludusHelsinki:
            return "Ludus Helsinki Ltd."

        case .blueRadios:
            return "BlueRadios, Inc."

        case .equinux:
            return "Equinux AG"

        case .garmin:
            return "Garmin International, Inc."

        case .ecotest:
            return "Ecotest"

        case .gnResound:
            return "GN ReSound A/S"

        case .jawbone:
            return "Jawbone"

        case .topconPositioningSystems:
            return "Topcon Positioning Systems, LLC"

        case .gimbal:
            return "Gimbal Inc."

        case .zScanSoftware:
            return "Zscan Software"

        case .quinticCorp:
            return "Quintic Corp"

        case .telitWireless:
            return "Telit Wireless Solutions GmbH"

        case .funaiElectric:
            return "Funai Electric Co., Ltd."

        case .advancedPanmobil:
            return "Advanced PANMOBIL systems GmbH & Co. KG"

        case .thinkOptics:
            return "ThinkOptics, Inc."

        case .universalElectronics:
            return "Universal Electronics, Inc."

        case .airohaTechnology:
            return "Airoha Technology Corp."

        case .necLighting:
            return "NEC Lighting, Ltd."

        case .odmTechnology:
            return "ODM Technology, Inc."

        case .connecteDevice:
            return "ConnecteDevice Ltd."

        case .zero1TV:
            return "zero1.tv GmbH"

        case .iTechDynamic:
            return "i.Tech Dynamic Global Distribution Ltd."

        case .alpwise:
            return "Alpwise"

        case .jiangsuToppower:
            return "Jiangsu Toppower Automotive Electronics Co., Ltd."

        case .colorfy:
            return "Colorfy, Inc."

        case .geoforce:
            return "Geoforce Inc."

        case .bose:
            return "Bose Corporation"

        case .suunto:
            return "Suunto Oy"

        case .kennsington:
            return "Kensington Computer Products Group"

        case .srMedizinelektronik:
            return "SR-Medizinelektronik"

        case .vertu:
            return "Vertu Corporation Limited"

        case .metaWatch:
            return "Meta Watch Ltd."

        case .linak:
            return "LINAK A/S"

        case .otlDynamics:
            return "OTL Dynamics LLC"

        case .pandaOcean:
            return "Panda Ocean Inc."

        case .visteonCorporation:
            return "Visteon Corporation"

        case .arpDevices:
            return "ARP Devices Limited"

        case .magnetiMarelli:
            return "Magneti Marelli S.p.A"

        case .caenRfid:
            return "CAEN RFID srl"

        case .ingenieurSystemgruppe:
            return "Ingenieur-Systemgruppe Zahn GmbH"

        case .greenThrottleGames:
            return "Green Throttle Games"
            
        case .peterSystemtechnik:
            return "Peter Systemtechnik GmbH"

        case .omegawave:
            return "Omegawave Oy"

        case .cinetix:
            return "Cinetix"

        case .passifSemiconductor:
            return "Passif Semiconductor Corp"

        case .sarisCyclingGroup:
            return "Saris Cycling Group, Inc"

        case .bekey:
            return "Bekey A/S"

        case .clarinoxTechnologies:
            return "Clarinox Technologies Pty. Ltd."

        case .bdeTechnology:
            return "BDE Technology Co., Ltd."

        case .swirlNetworks:
            return "Swirl Networks"

        case .mesoInternational:
            return "Meso international"

        case .treLab:
            return "TreLab Ltd"

        case .qualcommInnovation:
            return "Qualcomm Innovation Center, Inc. (QuIC)"

        case .johnsonControls:
            return "Johnson Controls, Inc."

        case .starkeyLaboratories:
            return "Starkey Laboratories Inc."

        case .sPowerElectronics:
            return "S-Power Electronics Limited"

        case .aceSensor:
            return "Ace Sensor Inc"

        case .aplixCorporation:
            return "Aplix Corporation"

        case .aampOfAmerica:
            return "AAMP of America"

        case .stalmartTechnology:
            return "Stalmart Technology Limited"

        case .amiccomElectronics:
            return "AMICCOM Electronics Corporation"

        case .shenzhenExcelsecuData:
            return "Shenzhen Excelsecu Data Technology Co.,Ltd"

        case .geneqInc:
            return "Geneq Inc."

        case .adidas:
            return "adidas AG"

        case .lgElectronics:
            return "LG Electronics"

        case .onsetComputerCorporation:
            return "Onset Computer Corporation"

        case .selfly:
            return "Selfly BV"

        case .quuppa:
            return "Quuppa Oy."

        case .geLo:
            return "GeLo Inc"

        case .evluma:
            return "Evluma"

        case .mc10:
            return "MC10"

        case .binauric:
            return "Binauric SE"

        case .beatsElectronics:
            return "Beats Electronics"

        case .microchip:
            return "Microchip Technology Inc."

        case .elgato:
            return "Elgato Systems GmbH"

        case .archos:
            return "ARCHOS SA"

        case .dexcom:
            return "Dexcom, Inc."

        case .polarElectroEurope:
            return "Polar Electro Europe B.V."

        case .dialogSemiconductor:
            return "Dialog Semiconductor B.V."

        case .taixingbangTechnology:
            return "Taixingbang Technology (HK) Co,. LTD."

        case .kawantech:
            return "Kawantech"

        case .austcoCommunication:
            return "Austco Communication Systems"

        case .timex:
            return "Timex Group USA, Inc."

        case .qualcommTechnologies:
            return "Qualcomm Technologies, Inc."

        case .qualcommConnectedExperiences:
            return "Qualcomm Connected Experiences, Inc."

        case .voyetra:
            return "Voyetra Turtle Beach"

        case .txtr:
            return "txtr GmbH"

        case .biosentronics:
            return "Biosentronics"

        case .procterGamble:
            return "Procter & Gamble"

        case .hosiden:
            return "Hosiden Corporation"

        case .muzik:
            return "Muzik LLC"

        case .misfit:
            return "Misfit Wearables Corp"

        case .google:
            return "Google"

        case .danlers:
            return "Danlers Ltd"

        case .semilink:
            return "Semilink Inc"

        case .inMusicBrands:
            return "inMusic Brands, Inc"

        case .lsResearch:
            return "L.S. Research Inc."

        case .edenSoftwareConsultants:
            return "Eden Software Consultants Ltd."

        case .freshtemp:
            return "Freshtemp"

        case .ksTechnologies:
            return "KS Technologies"





        case .viiiiva:
            return "4iiii Innovations - Viiiiva"

        case .exogal:
            return "Exogal"

        case .uniKey:
            return "Unikey Technologies, Inc."

        case .dropcam:
            return "Dropcam"

        case .reserved:
            return "Unknown"
        }
        
    }
    
}
