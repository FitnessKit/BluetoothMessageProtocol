//
//  BluetoothManufacturer.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 8/6/17.
//
//

import Foundation


/// BLE Manufacturer
///
public enum BluetoothManufacturer: UInt16 {

    case ericssonTechnology             = 0
    case nokiaMobilePhone               = 1
    case intel                          = 2
    case ibm                            = 3
    case toshibaCorp                    = 4
    case threeCom                       = 5
    case microsoft                      = 6
    case lucent                         = 7
    case motorola                       = 8
    case infineonTechnologies           = 9
    case cambridgeSiliconRadio          = 10
    case siliconWave                    = 11
    case digianswer                     = 12
    case texasInstruments               = 13
    case parthusTechnologies            = 14
    case broadcom                       = 15
    case mitelSemiconductor             = 16
    case windcomm                       = 17
    case zeevo                          = 18
    case atmel                          = 19
    case mitsubishi                     = 20
    case rtxTelecom                     = 21
    case kcTechnology                   = 22
    case newlogic                       = 23
    case transilica                     = 24
    case rohdeAndSchwarz                = 25
    case ttpCom                         = 26
    case signiaTechnologies             = 27
    case conexantSystems                = 28
    case qualcomm                       = 29
    case inventel                       = 30
    case avmBerlin                      = 31
    case bandSpeed                      = 32
    case mansella                       = 33
    case nec                            = 34
    case wavePlusTechnology             = 35
    case alcatel                        = 36
    case nxpSemiconductors              = 37 // NXP Semiconductors (formerly Philips Semiconductors)
    case cTechnologies                  = 38
    case openInterface                  = 39
    case rfMicroDevices                 = 40
    case hitachi                        = 41
    case symbolTechnologies             = 42
    case tenovis                        = 43
    case macronix                       = 44
    case gctSemiconductor               = 45
    case norwoodSystems                 = 46
    case mewTelTechnology               = 47
    case stMicroelectronics             = 48
    case synopsys                       = 49
    case redMCommunications             = 50
    case commil                         = 51
    case computerAccessTechnology       = 52
    case eclipse                        = 53
    case renesasElectronics             = 54
    case mobilianCorporation            = 55
    case terax                          = 56
    case integratedSystemSolutionCorp   = 57
    case matsushita                     = 58
    case gennumCorporation              = 59
    case blackberry                     = 60 //BlackBerry Limited (formerly Research In Motion)
    case iPextreme                      = 61
    case systemsAndChips                = 62
    case bluetoothSIG                   = 63
    case seikoEpsonCorporation          = 64
    case integratedSiliconSolution      = 65
    case conwiseTechnology              = 66
    case parrotAutomotive               = 67
    case socketMobile                   = 68
    case atherosCommunications          = 69
    case mediaTek                       = 70
    case bluegiga                       = 71
    case marvellTechnology              = 72
    case threeDSPCorporation            = 73
    case accelSemiconductor             = 74
    case continentalAutomotiveSystems   = 75
    case apple                          = 76
    case staccatoCommunications         = 77
    case avagoTechnologies              = 78
    case aptLtd                         = 79
    case sirfTechnology                 = 80
    case tzeroTechnologies              = 81
    case jAndMCorporation               = 82
    case free2Move                      = 83
    case threeDiJoy                     = 84
    case plantronics                    = 85
    case sonyEricassonMobile            = 86
    case harmanInternational            = 87
    case vizio                          = 88
    case nordicSemiconductor            = 89
    case emMicroeletronic               = 90
    case ralinkTechnology               = 91
    case belkin                         = 92
    case realtekSemiconductor           = 93
    case stonestreetOne                 = 94
    case wicentric                      = 95
    case rivieraWaves                   = 96
    case rdaMicroelectronics            = 97
    case gibsonGuitars                  = 98
    case miCommand                      = 99
    case bandXI                         = 100
    case hewlettPackard                 = 101
    case nineSolutions                  = 102
    case gnNetcom                       = 103
    case generalMotors                  = 104
    case adEngineering                  = 105
    case mindTree                       = 106
    case polar                          = 107
    case beautifulEnterprise            = 108
    case briarTek                       = 109
    case summitDataCommunications       = 110
    case soundID                        = 111
    case monster                        = 112
    case connectBlue                    = 113
    case shangHaiSuperSmart             = 114
    case groupSense                     = 115
    case zomm                           = 116
    case samsungElectronics             = 117
    case creativeTechnology             = 118
    case lairdTechnologies              = 119
    case nike                           = 120
    case lesswire                       = 121
    case mStarSemiconductor             = 122
    case hanlynnTechnologies            = 123
    case aAndRCambridge                 = 124
    case seersTechnology                = 125
    case sportsTrackingTechnologies     = 126
    case autonetMobile                  = 127
    case deLormePublishing              = 128
    case wuXiVimicro                    = 129
    case sennheiser                     = 130
    case timeKeepingSystems             = 131
    case ludusHelsinki                  = 132
    case blueRadios                     = 133
    case equinux                        = 134
    case garmin                         = 135
    case ecotest                        = 136
    case gnResound                      = 137
    case jawbone                        = 138
    case topconPositioningSystems       = 139
    case gimbal                         = 140 //Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)
    case zScanSoftware                  = 141
    case quinticCorp                    = 142
    case telitWireless                  = 143 //Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)
    case funaiElectric                  = 144
    case advancedPanmobil               = 145
    case thinkOptics                    = 146
    case universalElectronics           = 147
    case airohaTechnology               = 148
    case necLighting                    = 149
    case odmTechnology                  = 150
    case connecteDevice                 = 151
    case zero1TV                        = 152
    case iTechDynamic                   = 153
    case alpwise                        = 154
    case jiangsuToppower                = 155
    case colorfy                        = 156
    case geoforce                       = 157
    case bose                           = 158
    case suunto                         = 159
    case kennsington                    = 160
    case srMedizinelektronik            = 161
    case vertu                          = 162
    case metaWatch                      = 163
    case linak                          = 164
    case otlDynamics                    = 165
    case pandaOcean                     = 166
    case visteonCorporation             = 167
    case arpDevices                     = 168
    case magnetiMarelli                 = 169
    case caenRfid                       = 170
    case ingenieurSystemgruppe          = 171
    case greenThrottleGames             = 172
    case peterSystemtechnik             = 173
    case omegawave                      = 174
    case cinetix                        = 175
    case passifSemiconductor            = 176

    //Non offical IDs
    case viiiiva                        = 16657 //Not in offical document (four eyes Viiiiva)
    case exogal                         = 17752 //Not in offical document
    case uniKey                         = 24065 //case 350:   return @"Unikey Technologies, Inc.";  Have the Byte order Wrong
    case dropcam                        = 35888 //not in offical document

    case reserved                       = 65535
}

public extension BluetoothManufacturer {

    public var nameValue: String {

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
