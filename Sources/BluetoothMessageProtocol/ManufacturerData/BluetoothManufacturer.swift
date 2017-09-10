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
    /// ACTS Technologies
    case actsTechologies                = 232
    /// Vtrack Systems
    case vtrackSystems                  = 233
    /// Nielsen-Kellerman Company
    case nielsenKellerman               = 234
    /// Server Technology Inc.
    case serverTechnology               = 235
    /// BioResearch Associates
    case bioResearchAssociates          = 236
    /// Jolly Logic, LLC
    case jollyLogic                     = 237
    /// Above Average Outcomes, Inc.
    case aboveAverageOutcomes           = 238
    /// Bitsplitters GmbH
    case bitsplitters                   = 239
    /// PayPal, Inc.
    case payPal                         = 240
    /// Witron Technology Limited
    case witronTechnology               = 241
    /// Morse Project Inc
    case morseProject                   = 242
    /// Kent Displays Inc.
    case kentDisplays                   = 243
    /// Nautilus Inc.
    case nautilus                       = 244
    /// Smartifier Oy
    case smartifier                     = 245
    /// Elcometer Limited
    case elcometer                      = 246
    /// VSN Technologies, Inc.
    case vsnTechnologies                = 247
    /// AceUni Corp., Ltd.
    case aceUniCorp                     = 248
    /// StickNFind
    case stickNFind                     = 249
    /// Crystal Code AB
    case crystalCode                    = 250
    /// KOUKAAM a.s.
    case koukaam                        = 251
    /// Delphi Corporation
    case delphi                         = 252
    /// ValenceTech Limited
    case valenceTech                    = 253
    /// Stanley Black and Decker
    case stanleyBlackAndDecker          = 254
    /// Typo Products, LLC
    case typoProducts                   = 255
    /// TomTom International BV
    case tomTom                         = 256
    /// Fugoo, Inc.
    case fugoo                          = 257
    /// Keiser Corporation
    case keiser                         = 258
    /// Bang & Olufsen A/S
    case bangOlufsen                    = 259
    /// PLUS Location Systems Pty Ltd
    case plusLocationSystems            = 260
    /// Ubiquitous Computing Technology Corporation
    case ubiquitousComputing            = 261
    /// Innovative Yachtter Solutions
    case innovativeYachtter             = 262
    /// William Demant Holding A/S
    case williamDemantHolding           = 263
    /// Chicony Electronics Co., Ltd.
    case chiconyElectronics             = 264
    /// Atus BV
    case atus                           = 265
    /// Codegate Ltd
    case codegate                       = 266
    /// ERi, Inc
    case eri                            = 267
    /// Transducers Direct, LLC
    case transducersDirect              = 268
    /// Fujitsu Ten LImited
    case fujitsuTen                     = 269
    /// Audi AG
    case audi                           = 270
    /// HiSilicon Technologies Col, Ltd
    case hiSiliconTechnologies          = 271
    /// Nippon Seiki Co., Ltd.
    case nipponSeiki                    = 272
    /// Steelseries ApS
    case steelseries                    = 273
    /// Visybl Inc.
    case visybl                         = 274
    /// Openbrain Technologies, Co., Ltd.
    case openbrainTechnologies          = 275
    /// Xensr
    case xensr                          = 276
    /// e.solutions
    case eSolutions                     = 277
    /// 10AK Technologies
    case tenAKTechnologies              = 278
    /// Wimoto Technologies Inc
    case wimotoTechnologies             = 279
    /// Radius Networks, Inc.
    case radiusNetworks                 = 280
    /// Wize Technology Co., Ltd.
    case wizeTechnology                 = 281
    /// Qualcomm Labs, Inc.
    case qualcommLabs                   = 282
    /// Aruba Networks
    case arubaNetworks                  = 283
    /// Baidu
    case baidu                          = 284
    /// Arendi AG
    case arendi                         = 285
    /// Skoda Auto a.s.
    case skoda                          = 286
    /// Volkswagen AG
    case volkswagen                     = 287
    /// Porsche AG
    case porsche                        = 288
    /// Sino Wealth Electronic Ltd.
    case sinoWealthElectronic           = 289
    /// AirTurn, Inc
    case airTurn                        = 290
    /// Kinsa, Inc
    case kinsa                          = 291
    /// HID Global
    case hidGlobal                      = 292
    /// SEAT es
    case seat                           = 293
    /// Promethean Ltd.
    case promethean                     = 294
    /// Salutica Allied Solutions
    case saluticaAllied                 = 295
    /// GPSI Group Pty Ltd
    case gpsiGroup                      = 296
    /// Nimble Devices Oy
    case nimbleDevices                  = 297
    /// Changzhou Yongse Infotech Co., Ltd.
    case changzhouYongseInfotech        = 298
    /// SportIQ
    case sportIq                        = 299
    /// TEMEC Instruments B.V.
    case temecInstruments               = 300
    /// Sony Corporation
    case sony                           = 301
    /// ASSA ABLOY
    case assaAbloy                      = 302
    /// Clarion Co. Inc.
    case clarion                        = 303
    /// Warehouse Innovations
    case warehouseInnovations           = 304
    /// Cypress Semiconductor
    case cypressSemiconductor           = 305
    /// MADS Inc
    case madsInc                        = 306
    /// Blue Maestro Limited
    case blueMaestro                    = 307
    /// Resolution Products, Ltd.
    case resolutionProducts             = 308
    /// Aireware LLC
    case aireware                       = 309
    /// Silvair, Inc.
    case silvair                        = 310
    /// Prestigio Plaza Ltd.
    case prestigioPlaza                 = 311
    /// NTEO Inc.
    case nteoInc                        = 312
    /// Focus Systems Corporation
    case focusSystems                   = 313
    /// Tencent Holdings Ltd.
    case tencent                        = 314
    /// Allegion
    case allegion                       = 315
    /// Murata Manufacturing Co., Ltd.
    case murataManufacturing            = 316
    /// WirelessWERX
    case wirelessWerx                   = 317
    /// Nod, Inc.
    case nodInc                         = 318
    /// B&B Manufacturing Company
    case bbManufacturing                = 319
    /// Alpine Electronics (China) Co., Ltd
    case alpineElectronics              = 320
    /// FedEx Services
    case fedEx                          = 321
    /// Grape Systems Inc.
    case grapeSystems                   = 322
    /// Bkon Connect
    case bkonConnect                    = 323
    /// Lintech GmbH
    case lintech                        = 324
    /// Novatel Wireless
    case novatelWireless                = 325
    /// Ciright
    case cirlight                       = 326
    /// Mighty Cast, Inc.
    case mightyCast                     = 327
    /// Ambimat Electronics
    case ambimatElectronics             = 328
    /// Perytons Ltd.
    case perytons                       = 329
    /// Tivoli Audio, LLC
    case tivoliAudio                    = 330
    /// Master Lock
    case masterLock                     = 331
    /// Mesh-Net Ltd
    case meshNet                        = 332
    /// HUIZHOU DESAY SV AUTOMOTIVE CO., LTD.
    case huizhouDesay                   = 333
    /// Tangerine, Inc.
    case tangerine                      = 334
    /// B&W Group Ltd.
    case bwGroup                        = 335
    /// Pioneer Corporation
    case pioneer                        = 336
    /// OnBeep
    case onBeep                         = 337
    /// Vernier Software & Technology
    case vernierSoftware                = 338
    /// ROL Ergo
    case rolErgo                        = 339
    /// Pebble Technology
    case pebble                         = 340
    /// NETATMO
    case netamo                         = 341
    /// Accumulate AB
    case accumulate                     = 342
    /// Anhui Huami Information Technology Co., Ltd.
    case anhuiHuami                     = 343
    /// Inmite s.r.o.
    case inmite                         = 344
    /// ChefSteps, Inc.
    case chefSteps                      = 345
    /// micas AG
    case micas                          = 346
    /// Biomedical Research Ltd.
    case biomedicalResearch             = 347
    /// Pitius Tec S.L.
    case pitiusTec                      = 348
    /// Estimote, Inc.
    case estimote                       = 349
    /// Unikey Technologies, Inc.
    case unikeyTechnologies             = 350
    /// Timer Cap Co.
    case timerCap                       = 351
    /// AwoX
    case awoX                           = 352
    /// yikes
    case yikes                          = 353
    /// MADSGlobalNZ Ltd.
    case madsGlobal                     = 354
    /// PCH International
    case pchInternational               = 355
    /// Qingdao Yeelink Information Technology Co., Ltd.
    case qingdaoYeelinkInformation      = 356
    /// Milwaukee Tool (Formally Milwaukee Electric Tools)
    case milwaukeeTool                  = 357
    /// MISHIK Pte Ltd
    case mishikPte                      = 358
    /// Bayer HealthCare
    case bayerHealthCare                = 359
    /// Spicebox LLC
    case spicebox                       = 360
    /// emberlight
    case emberlight                     = 361
    /// Cooper-Atkins Corporation
    case cooperAtkins                   = 362
    /// Qblinks
    case qblinks                        = 363
    /// MYSPHERA
    case mysphera                       = 364
    /// LifeScan Inc
    case lifeScan                       = 365
    /// Volantic AB
    case volantic                       = 366
    /// Podo Labs, Inc
    case podoLabs                       = 367
    /// Roche Diabetes Care AG
    case rocheDiabetesCare              = 368
    /// Amazon Fulfillment Service
    case amazonFulfilmentService        = 369
    /// Connovate Technology Private Limited
    case connovateTechnology            = 370
    /// Kocomojo, LLC
    case kocomojo                       = 371
    /// Everykey Inc.
    case everykey                       = 372
    /// Dynamic Controls
    case dynamicControls                = 373
    /// SentriLock
    case sentriLock                     = 374
    /// I-SYST inc.
    case iSyst                          = 375
    /// CASIO COMPUTER CO., LTD.
    case casioComputer                  = 376
    /// LAPIS Semiconductor Co., Ltd.
    case lapisSemiconductor             = 377
    /// Telemonitor, Inc.
    case telemonitor                    = 378
    /// taskit GmbH
    case taskit                         = 379
    /// Daimler AG
    case daimler                        = 380
    /// BatAndCat
    case batAndCat                      = 381
    /// BluDotz Ltd
    case bluDotz                        = 382
    /// XTel Wireless ApS
    case xTelWireless                   = 383
    /// Gigaset Communications GmbH
    case gigasetCommunications          = 384
    /// Gecko Health Innovations, Inc.
    case geckoHealthInnovations         = 385
    /// HOP Ubiquitous
    case hopUbiquitous                  = 386
    /// Walt Disney
    case waltDisney                     = 387
    /// Nectar
    case nectar                         = 388
    /// bel'apps LLC
    case belApps                        = 389
    /// CORE Lighting Ltd
    case coreLighting                   = 390
    /// Seraphim Sense Ltd
    case seraphimSense                  = 391
    /// Unico RBC
    case unicoRBC                       = 392
    /// Physical Enterprises Inc.
    case physicalEnterprises            = 393
    /// Able Trend Technology Limited
    case ableTrendTechnology            = 394
    /// Konica Minolta, Inc.
    case konicaMinolta                  = 395
    /// Wilo SE
    case wilo                           = 396
    /// Extron Design Services
    case extronDesignServices           = 397
    /// Fitbit, Inc.
    case fitbit                         = 398
    /// Fireflies Systems
    case firefliesSystems               = 399
    /// Intelletto Technologies Inc.
    case intellettoTechnologies         = 400
    /// FDK CORPORATION
    case fdkCorporation                 = 401
    /// Cloudleaf, Inc
    case cloudleaf                      = 402
    /// Maveric Automation LLC
    case mavericAutomation              = 403
    /// Acoustic Stream Corporation
    case acousticStream                 = 404
    /// Zuli
    case zuli                           = 405
    /// Paxton Access Ltd
    case paxtonAccess                   = 406
    /// WiSilica Inc.
    case wiSilica                       = 407
    /// VENGIT Korlatolt Felelossegu Tarsasag
    case vengitKorlatolt                = 408
    /// SALTO SYSTEMS S.L.
    case saltoSystems                   = 409
    /// TRON Forum (formerly T-Engine Forum)
    case tronForum                      = 410
    /// CUBETECH s.r.o.
    case cubetech                       = 411
    /// Cokiya Incorporated
    case cokiya                         = 412
    /// CVS Health
    case cvsHealth                      = 413
    /// Ceruus
    case ceruus                         = 414
    /// Strainstall Ltd
    case strainstall                    = 415
    /// Channel Enterprises (HK) Ltd.
    case channelEnterprises             = 416
    /// FIAMM
    case fiaam                          = 417
    /// GIGALANE.CO.,LTD
    case gigalane                       = 418
    /// EROAD
    case eroad                          = 419
    /// Mine Safety Appliances
    case mineSafeyAppliances            = 420
    /// Icon Health and Fitness
    case iconHealth                     = 421
    /// Asandoo GmbH
    case asandoo                        = 422
    /// ENERGOUS CORPORATION
    case energous                       = 423
    /// Taobao
    case taobao                         = 424
    /// Canon Inc.
    case canon                          = 425
    /// Geophysical Technology Inc.
    case geophysicalTechnology          = 426
    /// Facebook, Inc
    case facebook                       = 427
    /// Nipro Diagnostics, Inc.
    case niproDiagnostics               = 428
    /// FlightSafety International
    case flightSafety                   = 429
    /// Earlens Corporation
    case earlens                        = 430
    /// Sunrise Micro Devices, Inc.
    case sunriseMicroDevices            = 431
    /// Star Micronics Co., Ltd.
    case starMicronics                  = 432
    /// Netizens Sp. z o.o.
    case netizens                       = 433
    /// Nymi Inc.
    case nymi                           = 434
    /// Nytec, Inc.
    case nytec                          = 435
    /// Trineo Sp. z o.o.
    case trineo                         = 436
    /// Nest Labs Inc.
    case nestLabs                       = 437
    /// LM Technologies Ltd
    case lmTechnologies                 = 438
    /// General Electric Company
    case generalElectric                = 439
    /// i+D3 S.L.
    case id3                            = 440
    /// HANA Micron
    case hanaMicron                     = 441
    /// Stages Cycling LLC
    case stagesCycling                  = 442
    /// Cochlear Bone Anchored Solutions AB
    case cochlearBone                   = 443
    /// SenionLab AB
    case senionLab                      = 444
    /// Syszone Co., Ltd
    case syszone                        = 445
    /// Pulsate Mobile Ltd.
    case pulsateMobile                  = 446
    /// Hong Kong HunterSun Electronic Limited
    case hongKongHunterSun              = 447
    /// pironex GmbH
    case pironex                        = 448
    /// BRADATECH Corp.
    case bradtech                       = 449
    /// Transenergooil AG
    case transenergooil                 = 450
    /// Bunch
    case bunch                          = 451
    /// DME Microelectronics
    case dmeMicroelectronics            = 452
    /// Bitcraze AB
    case bitcraze                       = 453
    /// HASWARE Inc.
    case hasware                        = 454
    /// Abiogenix Inc.
    case abiogenix                      = 455
    /// Poly-Control ApS
    case polyControl                    = 456
    /// Avi-on
    case aviOn                          = 457
    /// Laerdal Medical AS
    case laerdalMedical                 = 458
    /// Fetch My Pet
    case fetchMyPet                     = 459
    /// Sam Labs Ltd.
    case samLabs                        = 460
    /// Chengdu Synwing Technology Ltd
    case chendguSynwing                 = 461
    /// HOUWA SYSTEM DESIGN, k.k.
    case houwaSystemDesign              = 462
    /// BSH
    case bsh                            = 463
    /// Primus Inter Pares Ltd
    case primusInterPares               = 464
    /// August Home, Inc
    case augustHome                     = 465
    /// Gill Electronics
    case gillElectronics                = 466
    /// Sky Wave Design
    case skyWaveDesign                  = 467
    /// Newlab S.r.l.
    case newlab                         = 468
    /// ELAD srl
    case elad                           = 469
    /// G-wearables inc.
    case gWearables                     = 470
    /// Squadrone Systems Inc
    case squadroneSystems               = 471
    /// Code Corporation
    case codeCorporation                = 472
    /// Savant Systems LLC
    case savantSystems                  = 473
    /// Logitech International SA
    case logitech                       = 474
    /// Innblue Consulting
    case innblueConsulting              = 475
    /// iParking Ltd.
    case iParking                       = 476
    /// Koninklijke Philips Electronics N.V.
    case philips                        = 477
    /// Minelab Electronics Pty Limited
    case minelabElectronics             = 478
    /// Bison Group Ltd.
    case bisonGroup                     = 479
    /// Widex A/S
    case widex                          = 480
    /// Jolla Ltd
    case jolla                          = 481
    /// Lectronix, Inc.
    case lectronix                      = 482
    /// Caterpillar Inc
    case caterpillar                    = 483
    /// Freedom Innovations
    case freedomInnovations             = 484
    /// Dynamic Devices Ltd
    case dynamicDevices                 = 485
    /// Technology Solutions (UK) Ltd
    case technologySolutions            = 486
    /// IPS Group Inc.
    case ipsGroup                       = 487
    /// STIR
    case stir                           = 488
    /// Sano, Inc.
    case sano                           = 489
    /// Advanced Application Design, Inc.
    case advancedApplicationDesign      = 490
    /// AutoMap LLC
    case autoMap                        = 491
    /// Spreadtrum Communications Shanghai Ltd
    case spreadtrumCommunications       = 492
    /// CuteCircuit LTD
    case cuteCircuit                    = 493
    /// Valeo Service
    case valeoService                   = 494
    /// Fullpower Technologies, Inc.
    case fullpowerTechnologies          = 495
    /// KloudNation
    case kloudNation                    = 496
    /// Zebra Technologies Corporation
    case zebraTechnologies              = 497
    /// Itron, Inc.
    case itron                          = 498
    /// The University of Tokyo
    case tokyoUniversity                = 499
    /// UTC Fire and Security
    case utcFireAndSecurity             = 500
    /// Cool Webthings Limited
    case coolWebthings                  = 501
    /// DJO Global
    case djoGlobal                      = 502
    /// Gelliner Limited
    case gellier                        = 503
    /// Anyka (Guangzhou) Microelectronics Technology Co, LTD
    case anykaMicroelectronics          = 504
    /// Medtronic Inc.
    case medtronic                      = 505
    /// Gozio Inc.
    case gozio                          = 506
    /// Form Lifting, LLC
    case formLifting                    = 507
    /// Wahoo Fitness, LLC
    case wahooFitness                   = 508
    /// Kontakt Micro-Location Sp. z o.o.
    case knotaktMicroLocation           = 509
    /// Radio Systems Corporation
    case radioSystems                   = 510
    /// Freescale Semiconductor, Inc.
    case freescaleSemiconductor         = 511
    /// Verifone Systems Pte Ltd. Taiwan Branch
    case verifone                       = 512
    /// AR Timing
    case arTiming                       = 513
    /// Rigado LLC
    case rigado                         = 514
    /// Kemppi Oy
    case kemppi                         = 515
    /// Tapcentive Inc.
    case tapcentive                     = 516
    /// Smartbotics Inc.
    case smartbotics                    = 517
    /// Otter Products, LLC
    case otterProducts                  = 518
    /// STEMP Inc
    case stemp                          = 519
    /// LumiGeek LLC
    case lumiGeek                       = 520
    /// InvisionHeart Inc.
    case invisionHeart                  = 521
    /// Macnica Inc.
    case macnica                        = 522
    /// Jaguar Land Rover Limited
    case jaguarLandRover                = 523
    /// CoroWare Technologies, Inc
    case coroWareTechnologies           = 524
    /// Simplo Technology Co., LTD
    case simploTechnology               = 525
    /// Omron Healthcare Co., LTD
    case omronHealthcare                = 526
    /// Comodule GMBH
    case comodule                       = 527
    /// ikeGPS
    case ikeGPS                         = 528
    /// Telink Semiconductor Co. Ltd
    case telinkSemiconductor            = 529
    /// Interplan Co., Ltd
    case interplan                      = 530
    /// Wyler AG
    case wyler                          = 531
    /// IK Multimedia Production srl
    case ikMultimedia                   = 532
    /// Lukoton Experience Oy
    case lukotonExperience              = 533
    /// MTI Ltd
    case mti                            = 534
    /// Tech4home, Lda
    case tech4Home                      = 535
    /// Hiotech AB
    case hiotech                        = 536
    /// DOTT Limited
    case dott                           = 537
    /// Blue Speck Labs, LLC
    case blueSpeckLabs                  = 538
    /// Cisco Systems, Inc
    case cisco                          = 539
    /// Mobicomm Inc
    case mobicomm                       = 540
    /// Edamic
    case edamic                         = 541
    /// Goodnet, Ltd
    case goodnet                        = 542
    /// Luster Leaf Products Inc
    case lusterLeafProducts             = 543
    /// Manus Machina BV
    case manusMachina                   = 544
    /// Mobiquity Networks Inc
    case mobiquityNetworks              = 545
    /// Praxis Dynamics
    case praxisDynamics                 = 546
    /// Philip Morris Products S.A.
    case philipMorrisProducts           = 547
    /// Comarch SA
    case comarch                        = 548
    /// Nestl Nespresso S.A.
    case nestlNespresso                 = 549
    /// Merlinia A/S
    case merlinia                       = 550
    /// LifeBEAM Technologies
    case lifeBeamTechnologies           = 551
    /// Twocanoes Labs, LLC
    case twocanoesLabs                  = 552
    /// Muoverti Limited
    case muoverti                       = 553
    /// Stamer Musikanlagen GMBH
    case stamerMusikanlagen             = 554
    /// Tesla Motors
    case teslaMotors                    = 555
    /// Pharynks Corporation
    case pharynks                       = 556
    /// Lupine
    case lupine                         = 557
    /// Siemens AG
    case siemens                        = 558
    /// Huami (Shanghai) Culture Communication CO., LTD
    case huamiCultureCommunications     = 559
    /// Foster Electric Company, Ltd
    case fosterElectric                 = 560
    /// ETA SA
    case eta                            = 561
    /// x-Senso Solutions Kft
    case xSensoSolutions                = 562
    /// Shenzhen SuLong Communication Ltd
    case shenzhenSuLongSommunication    = 563
    /// FengFan (BeiJing) Technology Co, Ltd
    case fengFanTechnology              = 564
    /// Qrio Inc
    case qrio                           = 565
    /// Pitpatpet Ltd
    case pitpatpet                      = 566
    /// MSHeli s.r.l.
    case msHeli                         = 567
    /// Trakm8 Ltd
    case trakm8                         = 568
    /// JIN CO, Ltd
    case jinCo                          = 569
    /// Alatech Tehnology
    case alatech                        = 570
    /// Beijing CarePulse Electronic Technology Co, Ltd
    case beijingCarePulseElectronic     = 571
    /// Awarepoint
    case awarepoint                     = 572
    /// ViCentra B.V.
    case viCentra                       = 573
    /// Raven Industries
    case ravenIndustries                = 574
    /// WaveWare Technologies Inc.
    case waveWareTechnologies           = 575
    /// Argenox Technologies
    case argenox                        = 576
    /// Bragi GmbH
    case bragi                          = 577
    /// 16Lab Inc
    case sixteenLab                     = 578
    /// Masimo Corp
    case masimo                         = 579
    /// Iotera Inc
    case iotera                         = 580

    //Non offical IDs
    //
    /// Four Eyes Viiiiva
    ///
    /// - note: Non assigned Number
    case viiiiva                        = 16657
    /// Exogal
    ///
    /// - note: Non assigned Number
    case exogal                         = 17752
    /// Unikey Technologies, Inc.
    ///
    /// Some of the devices have the Manufacturer in Big Endian
    ///
    /// - note: Non assigned Number
    /// - SeeAlso: unikeyTechnologies
    case uniKey                         = 24065
    /// Dropcam
    ///
    /// - note: Non assigned Number
    case dropcam                        = 35888
    /// Reserved
    ///
    /// This value has special meaning depending on the context in which it used.
    /// - Link Manager Protocol (LMP): This value may be used in the internal and interoperability tests before a Company ID has been assigned. This value shall not be used in shipping end products.
    /// - Device ID Profile: This value is reserved as the default vendor ID when no Device ID service record is present in a remote device
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

        case .actsTechologies:
            return "ACTS Technologies"

        case .vtrackSystems:
            return "Vtrack Systems"

        case .nielsenKellerman:
            return "Nielsen-Kellerman Company"

        case .serverTechnology:
            return "Server Technology Inc"

        case .bioResearchAssociates:
            return "BioResearch Associates"

        case .jollyLogic:
            return "Jolly Logic, LLC"

        case .aboveAverageOutcomes:
            return "Above Average Outcomes, Inc"

        case .bitsplitters:
            return "Bitsplitters GmbH"

        case .payPal:
            return "PayPal, Inc"

        case .witronTechnology:
            return "Witron Technology Limited"

        case .morseProject:
            return "Morse Project Inc"

        case .kentDisplays:
            return "Kent Displays Inc"

        case .nautilus:
            return "Nautilus Inc"

        case .smartifier:
            return "Smartifier Oy"

        case .elcometer:
            return "Elcometer Limited"

        case .vsnTechnologies:
            return "VSN Technologies, Inc"

        case .aceUniCorp:
            return "AceUni Corp., Ltd."

        case .stickNFind:
            return "StickNFind"

        case .crystalCode:
            return "Crystal Code AB"

        case .koukaam:
            return "KOUKAAM a.s."

        case .delphi:
            return "Delphi Corporation"

        case .valenceTech:
            return "ValenceTech Limited"

        case .stanleyBlackAndDecker:
            return "Stanley Black and Decker"

        case .typoProducts:
            return "Typo Products, LLC"

        case .tomTom:
            return "TomTom International BV"

        case .fugoo:
            return "Fugoo, Inc"

        case .keiser:
            return "Keiser Corporation"

        case .bangOlufsen:
            return "Bang & Olufsen A/S"

        case .plusLocationSystems:
            return "PLUS Location Systems Pty Ltd"

        case .ubiquitousComputing:
            return "Ubiquitous Computing Technology Corporation"

        case .innovativeYachtter:
            return "Innovative Yachtter Solutions"

        case .williamDemantHolding:
            return "William Demant Holding A/S"

        case .chiconyElectronics:
            return "Chicony Electronics Co., Ltd"

        case .atus:
            return "Atus BV"

        case .codegate:
            return "Codegate Ltd"

        case .eri:
            return "ERi, Inc"

        case .transducersDirect:
            return "Transducers Direct, LLC"

        case .fujitsuTen:
            return "Fujitsu Ten LImited"

        case .audi:
            return "Audi AG"

        case .hiSiliconTechnologies:
            return "HiSilicon Technologies Col, Ltd"

        case .nipponSeiki:
            return "Nippon Seiki Co., Ltd"

        case .steelseries:
            return "Steelseries ApS"

        case .visybl:
            return "Visybl Inc"

        case .openbrainTechnologies:
            return "Openbrain Technologies, Co., Ltd."

        case .xensr:
            return "Xensr"

        case .eSolutions:
            return "e.solutions"

        case .tenAKTechnologies:
            return "10AK Technologies"

        case .wimotoTechnologies:
            return "Wimoto Technologies Inc"

        case .radiusNetworks:
            return "Radius Networks, Inc"

        case .wizeTechnology:
            return "Wize Technology Co., Ltd"

        case .qualcommLabs:
            return "Qualcomm Labs, Inc."

        case .arubaNetworks:
            return "Aruba Networks"

        case .baidu:
            return "Baidu"

        case .arendi:
            return "Arendi AG"

        case .skoda:
            return "Skoda Auto a.s."

        case .volkswagen:
            return "Volkswagen AG"

        case .porsche:
            return "Porsche AG"

        case .sinoWealthElectronic:
            return "Sino Wealth Electronic Ltd."

        case .airTurn:
            return "AirTurn, Inc"

        case .kinsa:
            return "Kinsa, Inc"

        case .hidGlobal:
            return "HID Global"

        case .seat:
            return "SEAT es"

        case .promethean:
            return "Promethean Ltd."

        case .saluticaAllied:
            return "Salutica Allied Solutions"

        case .gpsiGroup:
            return "GPSI Group Pty Ltd"

        case .nimbleDevices:
            return "Nimble Devices Oy"

        case .changzhouYongseInfotech:
            return "Changzhou Yongse Infotech Co., Ltd."

        case .sportIq:
            return "SportIQ"

        case .temecInstruments:
            return "TEMEC Instruments B.V."

        case .sony:
            return "Sony Corporation"

        case .assaAbloy:
            return "ASSA ABLOY"

        case .clarion:
            return "Clarion Co. Inc."

        case .warehouseInnovations:
            return "Warehouse Innovations"

        case .cypressSemiconductor:
            return "Cypress Semiconductor"

        case .madsInc:
            return "MADS Inc"

        case .blueMaestro:
            return "Blue Maestro Limited"

        case .resolutionProducts:
            return "Resolution Products, Ltd."

        case .aireware:
            return "Aireware LLC"

        case .silvair:
            return "Silvair, Inc."

        case .prestigioPlaza:
            return "Prestigio Plaza Ltd."

        case .nteoInc:
            return "NTEO Inc."

        case .focusSystems:
            return "Focus Systems Corporation"

        case .tencent:
            return "Tencent Holdings Ltd."

        case .allegion:
            return "Allegion"

        case .murataManufacturing:
            return "Murata Manufacturing Co., Ltd."

        case .wirelessWerx:
            return "WirelessWERX"

        case .nodInc:
            return "Nod, Inc."

        case .bbManufacturing:
            return "B&B Manufacturing Company"

        case .alpineElectronics:
            return "Alpine Electronics (China) Co., Ltd"

        case .fedEx:
            return "FedEx Services"

        case .grapeSystems:
            return "Grape Systems Inc."

        case .bkonConnect:
            return "Bkon Connect"

        case .lintech:
            return "Lintech GmbH"

        case .novatelWireless:
            return "Novatel Wireless"

        case .cirlight:
            return "Ciright"

        case .mightyCast:
            return "Mighty Cast, Inc."

        case .ambimatElectronics:
            return "Ambimat Electronics"

        case .perytons:
            return "Perytons Ltd."

        case .tivoliAudio:
            return "Tivoli Audio, LLC"

        case .masterLock:
            return "Master Lock"

        case .meshNet:
            return "Mesh-Net Ltd"

        case .huizhouDesay:
            return "HUIZHOU DESAY SV AUTOMOTIVE CO., LTD."

        case .tangerine:
            return "Tangerine, Inc."

        case .bwGroup:
            return "B&W Group Ltd."

        case .pioneer:
            return "Pioneer Corporation"

        case .onBeep:
            return "OnBeep"

        case .vernierSoftware:
            return "Vernier Software & Technology"

        case .rolErgo:
            return "ROL Ergo"

        case .pebble:
            return "Pebble Technology"

        case .netamo:
            return "NETATMO"

        case .accumulate:
            return "Accumulate AB"

        case .anhuiHuami:
            return "Anhui Huami Information Technology Co., Ltd."

        case .inmite:
            return "Inmite s.r.o."

        case .chefSteps:
            return "ChefSteps, Inc."

        case .micas:
            return "micas AG"

        case .biomedicalResearch:
            return "Biomedical Research Ltd."

        case .pitiusTec:
            return "Pitius Tec S.L."

        case .estimote:
            return "Estimote, Inc."

        case .unikeyTechnologies:
            return "Unikey Technologies, Inc."

        case .timerCap:
            return "Timer Cap Co."

        case .awoX:
            return "AwoX"

        case .yikes:
            return "yikes"

        case .madsGlobal:
            return "MADSGlobalNZ Ltd."

        case .pchInternational:
            return "PCH International"

        case .qingdaoYeelinkInformation:
            return "Qingdao Yeelink Information Technology Co., Ltd."

        case .milwaukeeTool:
            return "Milwaukee Tool"

        case .mishikPte:
            return "MISHIK Pte Ltd"

        case .bayerHealthCare:
            return "Bayer HealthCare"

        case .spicebox:
            return "Spicebox LLC"

        case .emberlight:
            return "emberlight"

        case .cooperAtkins:
            return "Cooper-Atkins Corporation"

        case .qblinks:
            return "Qblinks"

        case .mysphera:
            return "MYSPHERA"

        case .lifeScan:
            return "LifeScan Inc"

        case .volantic:
            return "Volantic AB"

        case .podoLabs:
            return "Podo Labs, Inc"

        case .rocheDiabetesCare:
            return "Roche Diabetes Care AG"

        case .amazonFulfilmentService:
            return "Amazon Fulfillment Service"

        case .connovateTechnology:
            return "Connovate Technology Private Limited"

        case .kocomojo:
            return "Kocomojo, LLC"

        case .everykey:
            return "Everykey Inc."

        case .dynamicControls:
            return "Dynamic Controls"

        case .sentriLock:
            return "SentriLock"

        case .iSyst:
            return "I-SYST inc."

        case .casioComputer:
            return "CASIO COMPUTER CO., LTD."

        case .lapisSemiconductor:
            return "LAPIS Semiconductor Co., Ltd."

        case .telemonitor:
            return "Telemonitor, Inc."

        case .taskit:
            return "taskit GmbH"

        case .daimler:
            return "Daimler AG"

        case .batAndCat:
            return "BatAndCat"

        case .bluDotz:
            return "BluDotz Ltd"

        case .xTelWireless:
            return "XTel Wireless ApS"

        case .gigasetCommunications:
            return "Gigaset Communications GmbH"

        case .geckoHealthInnovations:
            return "Gecko Health Innovations, Inc."

        case .hopUbiquitous:
            return "HOP Ubiquitous"

        case .waltDisney:
            return "Walt Disney"

        case .nectar:
            return "Nectar"

        case .belApps:
            return "bel'apps LLC"

        case .coreLighting:
            return "CORE Lighting Ltd"

        case .seraphimSense:
            return "Seraphim Sense Ltd"

        case .unicoRBC:
            return "Unico RBC"

        case .physicalEnterprises:
            return "Physical Enterprises Inc."

        case .ableTrendTechnology:
            return "Able Trend Technology Limited"

        case .konicaMinolta:
            return "Konica Minolta, Inc"

        case .wilo:
            return "Wilo SE"

        case .extronDesignServices:
            return "Extron Design Services"

        case .fitbit:
            return "Fitbit, Inc."

        case .firefliesSystems:
            return "Fireflies Systems"

        case .intellettoTechnologies:
            return "Intelletto Technologies Inc."

        case .fdkCorporation:
            return "FDK CORPORATION"

        case .cloudleaf:
            return "Cloudleaf, Inc"

        case .mavericAutomation:
            return "Maveric Automation LLC"

        case .acousticStream:
            return "Acoustic Stream Corporation"

        case .zuli:
            return "Zuli"

        case .paxtonAccess:
            return "Paxton Access Ltd"

        case .wiSilica:
            return "WiSilica Inc"

        case .vengitKorlatolt:
            return "VENGIT Korlatolt Felelossegu Tarsasag"

        case .saltoSystems:
            return "SALTO SYSTEMS S.L."

        case .tronForum:
            return "TRON Forum"

        case .cubetech:
            return "CUBETECH s.r.o."

        case .cokiya:
            return "Cokiya Incorporated"

        case .cvsHealth:
            return "CVS Health"

        case .ceruus:
            return "Ceruus"

        case .strainstall:
            return "Strainstall Ltd"

        case .channelEnterprises:
            return "Channel Enterprises (HK) Ltd."

        case .fiaam:
            return "FIAMM"

        case .gigalane:
            return "GIGALANE.CO.,LTD"

        case .eroad:
            return "EROAD"

        case .mineSafeyAppliances:
            return "Mine Safety Appliances"

        case .iconHealth:
            return "Icon Health and Fitness"

        case .asandoo:
            return "Asandoo GmbH"

        case .energous:
            return "ENERGOUS CORPORATION"

        case .taobao:
            return "Taobao"

        case .canon:
            return "Canon Inc."

        case .geophysicalTechnology:
            return "Geophysical Technology Inc."

        case .facebook:
            return "Facebook, Inc"

        case .niproDiagnostics:
            return "Nipro Diagnostics, Inc."

        case .flightSafety:
            return "FlightSafety International"

        case .earlens:
            return "Earlens Corporation"

        case .sunriseMicroDevices:
            return "Sunrise Micro Devices, Inc."

        case .starMicronics:
            return "Star Micronics Co., Ltd."

        case .netizens:
            return "Netizens Sp. z o.o."

        case .nymi:
            return "Nymi Inc."

        case .nytec:
            return "Nytec, Inc."

        case .trineo:
            return "Trineo Sp. z o.o."

        case .nestLabs:
            return "Nest Labs Inc."

        case .lmTechnologies:
            return "LM Technologies Ltd"

        case .generalElectric:
            return "General Electric Company"

        case .id3:
            return "i+D3 S.L."

        case .hanaMicron:
            return "HANA Micron"

        case .stagesCycling:
            return "Stages Cycling LLC"

        case .cochlearBone:
            return "Cochlear Bone Anchored Solutions AB"

        case .senionLab:
            return "SenionLab AB"

        case .syszone:
            return "Syszone Co., Ltd"

        case .pulsateMobile:
            return "Pulsate Mobile Ltd."

        case .hongKongHunterSun:
            return "Hong Kong HunterSun Electronic Limited"

        case .pironex:
            return "pironex GmbH"

        case .bradtech:
            return "BRADATECH Corp."

        case .transenergooil:
            return "Transenergooil AG"

        case .bunch:
            return "Bunch"

        case .dmeMicroelectronics:
            return "DME Microelectronics"

        case .bitcraze:
            return "Bitcraze AB"

        case .hasware:
            return "HASWARE Inc."

        case .abiogenix:
            return "Abiogenix Inc."

        case .polyControl:
            return "Poly-Control ApS"

        case .aviOn:
            return "Avi-on"

        case .laerdalMedical:
            return "Laerdal Medical AS"

        case .fetchMyPet:
            return "Fetch My Pet"

        case .samLabs:
            return "Sam Labs Ltd."

        case .chendguSynwing:
            return "Chengdu Synwing Technology Ltd"

        case .houwaSystemDesign:
            return "HOUWA SYSTEM DESIGN, k.k."

        case .bsh:
            return "BSH"

        case .primusInterPares:
            return "Primus Inter Pares Ltd"

        case .augustHome:
            return "August Home, Inc"

        case .gillElectronics:
            return "Gill Electronics"

        case .skyWaveDesign:
            return "Sky Wave Design"

        case .newlab:
            return "Newlab S.r.l."

        case .elad:
            return "ELAD srl"

        case .gWearables:
            return "G-wearables inc."

        case .squadroneSystems:
            return "Squadrone Systems Inc"

        case .codeCorporation:
            return "Code Corporation"

        case .savantSystems:
            return "Savant Systems LLC"

        case .logitech:
            return "Logitech International SA"

        case .innblueConsulting:
            return "Innblue Consulting"

        case .iParking:
            return "iParking Ltd."

        case .philips:
            return "Koninklijke Philips Electronics N.V."

        case .minelabElectronics:
            return "Minelab Electronics Pty Limited"

        case .bisonGroup:
            return "Bison Group Ltd."

        case .widex:
            return "Widex A/S"

        case .jolla:
            return "Jolla Ltd"

        case .lectronix:
            return "Lectronix, Inc."

        case .caterpillar:
            return "Caterpillar Inc"

        case .freedomInnovations:
            return "Freedom Innovations"

        case .dynamicDevices:
            return "Dynamic Devices Ltd"

        case .technologySolutions:
            return "Technology Solutions (UK) Ltd"

        case .ipsGroup:
            return "IPS Group Inc."

        case .stir:
            return "STIR"

        case .sano:
            return "Sano, Inc."

        case .advancedApplicationDesign:
            return "Advanced Application Design, Inc."

        case .autoMap:
            return "AutoMap LLC"

        case .spreadtrumCommunications:
            return "Spreadtrum Communications Shanghai Ltd"

        case .cuteCircuit:
            return "CuteCircuit LTD"

        case .valeoService:
            return "Valeo Service"

        case .fullpowerTechnologies:
            return "Fullpower Technologies, Inc."

        case .kloudNation:
            return "KloudNation"

        case .zebraTechnologies:
            return "Zebra Technologies Corporation"

        case .itron:
            return "Itron, Inc."

        case .tokyoUniversity:
            return "The University of Tokyo"

        case .utcFireAndSecurity:
            return "UTC Fire and Security"

        case .coolWebthings:
            return "Cool Webthings Limited"

        case .djoGlobal:
            return "DJO Global"

        case .gellier:
            return "Gelliner Limited"

        case .anykaMicroelectronics:
            return "Anyka (Guangzhou) Microelectronics Technology Co, LTD"

        case .medtronic:
            return "Medtronic Inc."

        case .gozio:
            return "Gozio Inc."

        case .formLifting:
            return "Form Lifting, LLC"

        case .wahooFitness:
            return "Wahoo Fitness, LLC"

        case .knotaktMicroLocation:
            return "Kontakt Micro-Location Sp. z o.o."

        case .radioSystems:
            return "Radio Systems Corporation"

        case .freescaleSemiconductor:
            return "Freescale Semiconductor, Inc."

        case .verifone:
            return "Verifone Systems Pte Ltd. Taiwan Branch"

        case .arTiming:
            return "AR Timing"

        case .rigado:
            return "Rigado LLC"

        case .kemppi:
            return "Kemppi Oy"

        case .tapcentive:
            return "Tapcentive Inc"

        case .smartbotics:
            return "Smartbotics Inc."

        case .otterProducts:
            return "Otter Products, LLC"

        case .stemp:
            return "STEMP Inc"

        case .lumiGeek:
            return "LumiGeek LLC"

        case .invisionHeart:
            return "InvisionHeart Inc."

        case .macnica:
            return "Macnica Inc."

        case .jaguarLandRover:
            return "Jaguar Land Rover Limited"

        case .coroWareTechnologies:
            return "CoroWare Technologies, Inc"

        case .simploTechnology:
            return "Simplo Technology Co., LTD"

        case .omronHealthcare:
            return "Omron Healthcare Co., LTD"

        case .comodule:
            return "Comodule GMBH"

        case .ikeGPS:
            return "ikeGPS"

        case .telinkSemiconductor:
            return "Telink Semiconductor Co. Ltd"

        case .interplan:
            return "Interplan Co., Ltd"

        case .wyler:
            return "Wyler AG"

        case .ikMultimedia:
            return "IK Multimedia Production srl"

        case .lukotonExperience:
            return "Lukoton Experience Oy"

        case .mti:
            return "MTI Ltd"

        case .tech4Home:
            return "Tech4home, Lda"

        case .hiotech:
            return "Hiotech AB"

        case .dott:
            return "DOTT Limited"

        case .blueSpeckLabs:
            return "Blue Speck Labs, LLC"

        case .cisco:
            return "Cisco Systems, Inc"

        case .mobicomm:
            return "Mobicomm Inc"

        case .edamic:
            return "Edamic"

        case .goodnet:
            return "Goodnet, Ltd"

        case .lusterLeafProducts:
            return "Luster Leaf Products Inc"

        case .manusMachina:
            return "Manus Machina BV"

        case .mobiquityNetworks:
            return "Mobiquity Networks Inc"

        case .praxisDynamics:
            return "Praxis Dynamics"

        case .philipMorrisProducts:
            return "Philip Morris Products S.A."

        case .comarch:
            return "Comarch SA"

        case .nestlNespresso:
            return "Nestl Nespresso S.A."

        case .merlinia:
            return "Merlinia A/S"

        case .lifeBeamTechnologies:
            return "LifeBEAM Technologies"

        case .twocanoesLabs:
            return "Twocanoes Labs, LLC"

        case .muoverti:
            return "Muoverti Limited"

        case .stamerMusikanlagen:
            return "Stamer Musikanlagen GMBH"

        case .teslaMotors:
            return "Tesla Motors"

        case .pharynks:
            return "Pharynks Corporation"

        case .lupine:
            return "Lupine"

        case .siemens:
            return "Siemens AG"

        case .huamiCultureCommunications:
            return "Huami (Shanghai) Culture Communication CO., LTD"

        case .fosterElectric:
            return "Foster Electric Company, Ltd"

        case .eta:
            return "ETA SA"

        case .xSensoSolutions:
            return "x-Senso Solutions Kft"

        case .shenzhenSuLongSommunication:
            return "Shenzhen SuLong Communication Ltd"

        case .fengFanTechnology:
            return "FengFan (BeiJing) Technology Co, Ltd"

        case .qrio:
            return "Qrio Inc"

        case .pitpatpet:
            return "Pitpatpet Ltd"

        case .msHeli:
            return "MSHeli s.r.l."

        case .trakm8:
            return "Trakm8 Ltd"

        case .jinCo:
            return "JIN CO, Ltd"

        case .alatech:
            return "Alatech Tehnology"

        case .beijingCarePulseElectronic:
            return "Beijing CarePulse Electronic Technology Co, Ltd"

        case .awarepoint:
            return "Awarepoint"

        case .viCentra:
            return "ViCentra B.V."

        case .ravenIndustries:
            return "Raven Industries"

        case .waveWareTechnologies:
            return "WaveWare Technologies Inc."

        case .argenox:
            return "Argenox Technologies"

        case .bragi:
            return "Bragi GmbH"

        case .sixteenLab:
            return "16Lab Inc"

        case .masimo:
            return "Masimo Corp"

        case .iotera:
            return "Iotera Inc"


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
