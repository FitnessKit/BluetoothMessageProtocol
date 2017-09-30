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
    case ericssonTechnology                     = 0
    /// Nokia Mobile Phones
    case nokiaMobilePhone                       = 1
    /// Intel Corp.
    case intel                                  = 2
    /// IBM Corp.
    case ibm                                    = 3
    /// Toshiba Corp.
    case toshibaCorp                            = 4
    /// 3Com
    case threeCom                               = 5
    /// Microsoft
    case microsoft                              = 6
    /// Lucent
    case lucent                                 = 7
    /// Motorola
    case motorola                               = 8
    /// Infineon Technologies AG
    case infineonTechnologies                   = 9
    /// Cambridge Silicon Radio
    case cambridgeSiliconRadio                  = 10
    /// Silicon Wave
    case siliconWave                            = 11
    /// Digianswer A/S
    case digianswer                             = 12
    /// Texas Instruments Inc.
    case texasInstruments                       = 13
    /// Parthus Technologies Inc.
    case parthusTechnologies                    = 14
    /// Broadcom Corporation
    case broadcom                               = 15
    /// Mitel Semiconductor
    case mitelSemiconductor                     = 16
    /// Widcomm, Inc.
    case windcomm                               = 17
    /// Zeevo, Inc.
    case zeevo                                  = 18
    /// Atmel Corporation
    case atmel                                  = 19
    /// Mitsubishi Electric Corporation
    case mitsubishi                             = 20
    /// RTX Telecom A/S
    case rtxTelecom                             = 21
    /// KC Technology Inc.
    case kcTechnology                           = 22
    /// Newlogic
    case newlogic                               = 23
    /// Transilica, Inc.
    case transilica                             = 24
    /// Rohde & Schwarz GmbH & Co. KG
    case rohdeAndSchwarz                        = 25
    /// TTPCom Limited
    case ttpCom                                 = 26
    /// Signia Technologies, Inc.
    case signiaTechnologies                     = 27
    /// Conexant Systems Inc.
    case conexantSystems                        = 28
    /// Qualcomm
    case qualcomm                               = 29
    /// Inventel
    case inventel                               = 30
    /// AVM Berlin
    case avmBerlin                              = 31
    /// BandSpeed, Inc.
    case bandSpeed                              = 32
    /// Mansella Ltd
    case mansella                               = 33
    /// NEC Corporation
    case nec                                    = 34
    /// WavePlus Technology Co., Ltd.
    case wavePlusTechnology                     = 35
    /// Alcatel
    case alcatel                                = 36
    /// NXP Semiconductors (formerly Philips Semiconductors)
    case nxpSemiconductors                      = 37
    /// C Technologies
    case cTechnologies                          = 38
    /// Open Interface
    case openInterface                          = 39
    /// R F Micro Devices
    case rfMicroDevices                         = 40
    /// Hitachi Ltd
    case hitachi                                = 41
    /// Symbol Technologies, Inc.
    case symbolTechnologies                     = 42
    /// Tenovis
    case tenovis                                = 43
    /// Macronix International Co. Ltd..
    case macronix                               = 44
    /// GCT Semiconductor
    case gctSemiconductor                       = 45
    /// Norwood Systems
    case norwoodSystems                         = 46
    /// MewTel Technology Inc.
    case mewTelTechnology                       = 47
    /// ST Microelectronics
    case stMicroelectronics                     = 48
    /// Synopsys, Inc.
    case synopsys                               = 49
    /// Red-M (Communications) Ltd
    case redMCommunications                     = 50
    /// Commil Ltd
    case commil                                 = 51
    /// Computer Access Technology Corporation (CATC)
    case computerAccessTechnology               = 52
    /// Eclipse (HQ Espana) S.L.
    case eclipse                                = 53
    /// Renesas Electronics Corporation
    case renesasElectronics                     = 54
    /// Mobilian Corporation
    case mobilianCorporation                    = 55
    /// Terax
    case terax                                  = 56
    /// Integrated System Solution Corp.
    case integratedSystemSolutionCorp           = 57
    /// Matsushita Electric Industrial Co., Ltd.
    case matsushita                             = 58
    /// Gennum Corporation
    case gennumCorporation                      = 59
    /// BlackBerry Limited (formerly Research In Motion)
    case blackberry                             = 60
    /// IPextreme, Inc.
    case iPextreme                              = 61
    /// Systems and Chips, Inc
    case systemsAndChips                        = 62
    /// Bluetooth SIG, Inc
    case bluetoothSIG                           = 63
    /// Seiko Epson Corporation
    case seikoEpsonCorporation                  = 64
    /// Integrated Silicon Solution Taiwan, Inc.
    case integratedSiliconSolution              = 65
    /// CONWISE Technology Corporation Ltd
    case conwiseTechnology                      = 66
    /// PARROT AUTOMOTIVE SAS
    case parrotAutomotive                       = 67
    /// Socket Mobile
    case socketMobile                           = 68
    /// Atheros Communications, Inc.
    case atherosCommunications                  = 69
    /// MediaTek, Inc.
    case mediaTek                               = 70
    /// Bluegiga
    case bluegiga                               = 71
    /// Marvell Technology Group Ltd.
    case marvellTechnology                      = 72
    /// 3DSP Corporation
    case threeDSPCorporation                    = 73
    /// Accel Semiconductor Ltd.
    case accelSemiconductor                     = 74
    /// Continental Automotive Systems
    case continentalAutomotiveSystems           = 75
    /// Apple, Inc.
    case apple                                  = 76
    /// Staccato Communications, Inc.
    case staccatoCommunications                 = 77
    /// Avago Technologies
    case avagoTechnologies                      = 78
    /// APT Ltd.
    case aptLtd                                 = 79
    /// SiRF Technology, Inc.
    case sirfTechnology                         = 80
    /// Tzero Technologies, Inc.
    case tzeroTechnologies                      = 81
    /// J&M Corporation
    case jAndMCorporation                       = 82
    /// Free2move AB
    case free2Move                              = 83
    /// 3DiJoy Corporation
    case threeDiJoy                             = 84
    /// Plantronics, Inc.
    case plantronics                            = 85
    /// Sony Ericsson Mobile Communications
    case sonyEricassonMobile                    = 86
    /// Harman International Industries, Inc.
    case harmanInternational                    = 87
    /// Vizio, Inc.
    case vizio                                  = 88
    /// Nordic Semiconductor ASA
    case nordicSemiconductor                    = 89
    /// EM Microelectronic-Marin SA
    case emMicroeletronic                       = 90
    /// Ralink Technology Corporation
    case ralinkTechnology                       = 91
    /// Belkin International, Inc.
    case belkin                                 = 92
    /// Realtek Semiconductor Corporation
    case realtekSemiconductor                   = 93
    /// Stonestreet One, LLC
    case stonestreetOne                         = 94
    /// Wicentric, Inc.
    case wicentric                              = 95
    /// RivieraWaves S.A.S
    case rivieraWaves                           = 96
    /// RDA Microelectronics
    case rdaMicroelectronics                    = 97
    /// Gibson Guitars
    case gibsonGuitars                          = 98
    /// MiCommand Inc.
    case miCommand                              = 99
    /// Band XI International, LLC
    case bandXI                                 = 100
    /// Hewlett-Packard Company
    case hewlettPackard                         = 101
    /// 9Solutions Oy
    case nineSolutions                          = 102
    /// GN Netcom A/S
    case gnNetcom                               = 103
    /// General Motors
    case generalMotors                          = 104
    /// A&D Engineering, Inc.
    case adEngineering                          = 105
    /// MindTree Ltd.
    case mindTree                               = 106
    /// Polar Electro OY
    case polar                                  = 107
    /// Beautiful Enterprise Co., Ltd.
    case beautifulEnterprise                    = 108
    /// BriarTek, Inc
    case briarTek                               = 109
    /// Summit Data Communications, Inc.
    case summitDataCommunications               = 110
    /// Sound ID
    case soundID                                = 111
    /// Monster, LLC
    case monster                                = 112
    /// connectBlue AB
    case connectBlue                            = 113
    /// ShangHai Super Smart Electronics Co. Ltd.
    case shangHaiSuperSmart                     = 114
    /// Group Sense Ltd.
    case groupSense                             = 115
    /// Zomm, LLC
    case zomm                                   = 116
    /// Samsung Electronics Co. Ltd.
    case samsungElectronics                     = 117
    /// Creative Technology Ltd.
    case creativeTechnology                     = 118
    /// Laird Technologies
    case lairdTechnologies                      = 119
    /// Nike, Inc.
    case nike                                   = 120
    /// lesswire AG
    case lesswire                               = 121
    /// MStar Semiconductor, Inc.
    case mStarSemiconductor                     = 122
    /// Hanlynn Technologies
    case hanlynnTechnologies                    = 123
    /// A & R Cambridge
    case aAndRCambridge                         = 124
    /// Seers Technology Co., Ltd.
    case seersTechnology                        = 125
    /// Sports Tracking Technologies Ltd.
    case sportsTrackingTechnologies             = 126
    /// Autonet Mobile
    case autonetMobile                          = 127
    /// DeLorme Publishing Company, Inc.
    case deLormePublishing                      = 128
    /// WuXi Vimicro
    case wuXiVimicro                            = 129
    /// Sennheiser Communications A/S
    case sennheiser                             = 130
    /// TimeKeeping Systems, Inc.
    case timeKeepingSystems                     = 131
    /// Ludus Helsinki Ltd.
    case ludusHelsinki                          = 132
    /// BlueRadios, Inc.
    case blueRadios                             = 133
    /// Equinux AG
    case equinux                                = 134
    /// Garmin International, Inc.
    case garmin                                 = 135
    /// Ecotest
    case ecotest                                = 136
    /// GN ReSound A/S
    case gnResound                              = 137
    /// Jawbone
    case jawbone                                = 138
    /// Topcon Positioning Systems, LLC
    case topconPositioningSystems               = 139
    /// Gimbal Inc. (formerly Qualcomm Labs, Inc. and Qualcomm Retail Solutions, Inc.)
    case gimbal                                 = 140
    /// Zscan Software
    case zScanSoftware                          = 141
    /// Quintic Corp
    case quinticCorp                            = 142
    /// Telit Wireless Solutions GmbH (formerly Stollmann E+V GmbH)
    case telitWireless                          = 143
    /// Funai Electric Co., Ltd.
    case funaiElectric                          = 144
    /// Advanced PANMOBIL systems GmbH & Co. KG
    case advancedPanmobil                       = 145
    /// ThinkOptics, Inc.
    case thinkOptics                            = 146
    /// Universal Electronics, Inc.
    case universalElectronics                   = 147
    /// Airoha Technology Corp.
    case airohaTechnology                       = 148
    /// NEC Lighting, Ltd.
    case necLighting                            = 149
    /// ODM Technology, Inc.
    case odmTechnology                          = 150
    /// ConnecteDevice Ltd.
    case connecteDevice                         = 151
    /// zero1.tv GmbH
    case zero1TV                                = 152
    /// i.Tech Dynamic Global Distribution Ltd.
    case iTechDynamic                           = 153
    /// Alpwise
    case alpwise                                = 154
    /// Jiangsu Toppower Automotive Electronics Co., Ltd.
    case jiangsuToppower                        = 155
    /// Colorfy, Inc.
    case colorfy                                = 156
    /// Geoforce Inc.
    case geoforce                               = 157
    /// Bose Corporation
    case bose                                   = 158
    /// Suunto Oy
    case suunto                                 = 159
    /// Kensington Computer Products Group
    case kennsington                            = 160
    /// SR-Medizinelektronik
    case srMedizinelektronik                    = 161
    /// Vertu Corporation Limited
    case vertu                                  = 162
    /// Meta Watch Ltd.
    case metaWatch                              = 163
    /// LINAK A/S
    case linak                                  = 164
    /// OTL Dynamics LLC
    case otlDynamics                            = 165
    /// Panda Ocean Inc.
    case pandaOcean                             = 166
    /// Visteon Corporation
    case visteonCorporation                     = 167
    /// ARP Devices Limited
    case arpDevices                             = 168
    /// Magneti Marelli S.p.A
    case magnetiMarelli                         = 169
    /// CAEN RFID srl
    case caenRfid                               = 170
    /// Ingenieur-Systemgruppe Zahn GmbH
    case ingenieurSystemgruppe                  = 171
    /// Green Throttle Games
    case greenThrottleGames                     = 172
    /// Peter Systemtechnik GmbH
    case peterSystemtechnik                     = 173
    /// Omegawave Oy
    case omegawave                              = 174
    /// Cinetix
    case cinetix                                = 175
    /// Passif Semiconductor Corp
    case passifSemiconductor                    = 176
    /// Saris Cycling Group, Inc
    case sarisCyclingGroup                      = 177
    /// Bekey A/S
    case bekey                                  = 178
    /// Clarinox Technologies Pty. Ltd.
    case clarinoxTechnologies                   = 179
    /// BDE Technology Co., Ltd.
    case bdeTechnology                          = 180
    /// Swirl Networks
    case swirlNetworks                          = 181
    /// Meso international
    case mesoInternational                      = 182
    /// TreLab Ltd
    case treLab                                 = 183
    /// Qualcomm Innovation Center, Inc. (QuIC)
    case qualcommInnovation                     = 184
    /// Johnson Controls, Inc.
    case johnsonControls                        = 185
    /// Starkey Laboratories Inc.
    case starkeyLaboratories                    = 186
    /// S-Power Electronics Limited
    case sPowerElectronics                      = 187
    /// Ace Sensor Inc
    case aceSensor                              = 188
    /// Aplix Corporation
    case aplixCorporation                       = 189
    /// AAMP of America
    case aampOfAmerica                          = 190
    /// Stalmart Technology Limited
    case stalmartTechnology                     = 191
    /// AMICCOM Electronics Corporation
    case amiccomElectronics                     = 192
    /// Shenzhen Excelsecu Data Technology Co.,Ltd
    case shenzhenExcelsecuData                  = 193
    /// Geneq Inc.
    case geneqInc                               = 194
    /// adidas AG
    case adidas                                 = 195
    /// LG Electronics
    case lgElectronics                          = 196
    /// Onset Computer Corporation
    case onsetComputerCorporation               = 197
    /// Selfly BV
    case selfly                                 = 198
    /// Quuppa Oy.
    case quuppa                                 = 199
    /// GeLo Inc
    case geLo                                   = 200
    /// Evluma
    case evluma                                 = 201
    /// MC10
    case mc10                                   = 202
    /// Binauric SE
    case binauric                               = 203
    /// Beats Electronics
    case beatsElectronics                       = 204
    /// Microchip Technology Inc.
    case microchip                              = 205
    /// Elgato Systems GmbH
    case elgato                                 = 206
    /// ARCHOS SA
    case archos                                 = 207
    /// Dexcom, Inc.
    case dexcom                                 = 208
    /// Polar Electro Europe B.V.
    case polarElectroEurope                     = 209
    /// Dialog Semiconductor B.V.
    case dialogSemiconductor                    = 210
    /// Taixingbang Technology (HK) Co,. LTD.
    case taixingbangTechnology                  = 211
    /// Kawantech
    case kawantech                              = 212
    /// Austco Communication Systems
    case austcoCommunication                    = 213
    /// Timex Group USA, Inc.
    case timex                                  = 214
    /// Qualcomm Technologies, Inc.
    case qualcommTechnologies                   = 215
    /// Qualcomm Connected Experiences, Inc.
    case qualcommConnectedExperiences           = 216
    /// Voyetra Turtle Beach
    case voyetra                                = 217
    /// txtr GmbH
    case txtr                                   = 218
    /// Biosentronics
    case biosentronics                          = 219
    /// Procter & Gamble
    case procterGamble                          = 220
    /// Hosiden Corporation
    case hosiden                                = 221
    /// Muzik LLC
    case muzik                                  = 222
    /// Misfit Wearables Corp
    case misfit                                 = 223
    /// Google
    case google                                 = 224
    /// Danlers Ltd
    case danlers                                = 225
    /// Semilink Inc
    case semilink                               = 226
    /// inMusic Brands, Inc
    case inMusicBrands                          = 227
    /// L.S. Research Inc.
    case lsResearch                             = 228
    /// Eden Software Consultants Ltd.
    case edenSoftwareConsultants                = 229
    /// Freshtemp
    case freshtemp                              = 230
    /// KS Technologies
    case ksTechnologies                         = 231
    /// ACTS Technologies
    case actsTechologies                        = 232
    /// Vtrack Systems
    case vtrackSystems                          = 233
    /// Nielsen-Kellerman Company
    case nielsenKellerman                       = 234
    /// Server Technology Inc.
    case serverTechnology                       = 235
    /// BioResearch Associates
    case bioResearchAssociates                  = 236
    /// Jolly Logic, LLC
    case jollyLogic                             = 237
    /// Above Average Outcomes, Inc.
    case aboveAverageOutcomes                   = 238
    /// Bitsplitters GmbH
    case bitsplitters                           = 239
    /// PayPal, Inc.
    case payPal                                 = 240
    /// Witron Technology Limited
    case witronTechnology                       = 241
    /// Morse Project Inc
    case morseProject                           = 242
    /// Kent Displays Inc.
    case kentDisplays                           = 243
    /// Nautilus Inc.
    case nautilus                               = 244
    /// Smartifier Oy
    case smartifier                             = 245
    /// Elcometer Limited
    case elcometer                              = 246
    /// VSN Technologies, Inc.
    case vsnTechnologies                        = 247
    /// AceUni Corp., Ltd.
    case aceUniCorp                             = 248
    /// StickNFind
    case stickNFind                             = 249
    /// Crystal Code AB
    case crystalCode                            = 250
    /// KOUKAAM a.s.
    case koukaam                                = 251
    /// Delphi Corporation
    case delphi                                 = 252
    /// ValenceTech Limited
    case valenceTech                            = 253
    /// Stanley Black and Decker
    case stanleyBlackAndDecker                  = 254
    /// Typo Products, LLC
    case typoProducts                           = 255
    /// TomTom International BV
    case tomTom                                 = 256
    /// Fugoo, Inc.
    case fugoo                                  = 257
    /// Keiser Corporation
    case keiser                                 = 258
    /// Bang & Olufsen A/S
    case bangOlufsen                            = 259
    /// PLUS Location Systems Pty Ltd
    case plusLocationSystems                    = 260
    /// Ubiquitous Computing Technology Corporation
    case ubiquitousComputing                    = 261
    /// Innovative Yachtter Solutions
    case innovativeYachtter                     = 262
    /// William Demant Holding A/S
    case williamDemantHolding                   = 263
    /// Chicony Electronics Co., Ltd.
    case chiconyElectronics                     = 264
    /// Atus BV
    case atus                                   = 265
    /// Codegate Ltd
    case codegate                               = 266
    /// ERi, Inc
    case eri                                    = 267
    /// Transducers Direct, LLC
    case transducersDirect                      = 268
    /// Fujitsu Ten LImited
    case fujitsuTen                             = 269
    /// Audi AG
    case audi                                   = 270
    /// HiSilicon Technologies Col, Ltd
    case hiSiliconTechnologies                  = 271
    /// Nippon Seiki Co., Ltd.
    case nipponSeiki                            = 272
    /// Steelseries ApS
    case steelseries                            = 273
    /// Visybl Inc.
    case visybl                                 = 274
    /// Openbrain Technologies, Co., Ltd.
    case openbrainTechnologies                  = 275
    /// Xensr
    case xensr                                  = 276
    /// e.solutions
    case eSolutions                             = 277
    /// 10AK Technologies
    case tenAKTechnologies                      = 278
    /// Wimoto Technologies Inc
    case wimotoTechnologies                     = 279
    /// Radius Networks, Inc.
    case radiusNetworks                         = 280
    /// Wize Technology Co., Ltd.
    case wizeTechnology                         = 281
    /// Qualcomm Labs, Inc.
    case qualcommLabs                           = 282
    /// Aruba Networks
    case arubaNetworks                          = 283
    /// Baidu
    case baidu                                  = 284
    /// Arendi AG
    case arendi                                 = 285
    /// Skoda Auto a.s.
    case skoda                                  = 286
    /// Volkswagen AG
    case volkswagen                             = 287
    /// Porsche AG
    case porsche                                = 288
    /// Sino Wealth Electronic Ltd.
    case sinoWealthElectronic                   = 289
    /// AirTurn, Inc
    case airTurn                                = 290
    /// Kinsa, Inc
    case kinsa                                  = 291
    /// HID Global
    case hidGlobal                              = 292
    /// SEAT es
    case seat                                   = 293
    /// Promethean Ltd.
    case promethean                             = 294
    /// Salutica Allied Solutions
    case saluticaAllied                         = 295
    /// GPSI Group Pty Ltd
    case gpsiGroup                              = 296
    /// Nimble Devices Oy
    case nimbleDevices                          = 297
    /// Changzhou Yongse Infotech Co., Ltd.
    case changzhouYongseInfotech                = 298
    /// SportIQ
    case sportIq                                = 299
    /// TEMEC Instruments B.V.
    case temecInstruments                       = 300
    /// Sony Corporation
    case sony                                   = 301
    /// ASSA ABLOY
    case assaAbloy                              = 302
    /// Clarion Co. Inc.
    case clarion                                = 303
    /// Warehouse Innovations
    case warehouseInnovations                   = 304
    /// Cypress Semiconductor
    case cypressSemiconductor                   = 305
    /// MADS Inc
    case madsInc                                = 306
    /// Blue Maestro Limited
    case blueMaestro                            = 307
    /// Resolution Products, Ltd.
    case resolutionProducts                     = 308
    /// Aireware LLC
    case aireware                               = 309
    /// Silvair, Inc.
    case silvair                                = 310
    /// Prestigio Plaza Ltd.
    case prestigioPlaza                         = 311
    /// NTEO Inc.
    case nteoInc                                = 312
    /// Focus Systems Corporation
    case focusSystems                           = 313
    /// Tencent Holdings Ltd.
    case tencent                                = 314
    /// Allegion
    case allegion                               = 315
    /// Murata Manufacturing Co., Ltd.
    case murataManufacturing                    = 316
    /// WirelessWERX
    case wirelessWerx                           = 317
    /// Nod, Inc.
    case nodInc                                 = 318
    /// B&B Manufacturing Company
    case bbManufacturing                        = 319
    /// Alpine Electronics (China) Co., Ltd
    case alpineElectronicsChina                 = 320
    /// FedEx Services
    case fedEx                                  = 321
    /// Grape Systems Inc.
    case grapeSystems                           = 322
    /// Bkon Connect
    case bkonConnect                            = 323
    /// Lintech GmbH
    case lintech                                = 324
    /// Novatel Wireless
    case novatelWireless                        = 325
    /// Ciright
    case cirlight                               = 326
    /// Mighty Cast, Inc.
    case mightyCast                             = 327
    /// Ambimat Electronics
    case ambimatElectronics                     = 328
    /// Perytons Ltd.
    case perytons                               = 329
    /// Tivoli Audio, LLC
    case tivoliAudio                            = 330
    /// Master Lock
    case masterLock                             = 331
    /// Mesh-Net Ltd
    case meshNet                                = 332
    /// HUIZHOU DESAY SV AUTOMOTIVE CO., LTD.
    case huizhouDesay                           = 333
    /// Tangerine, Inc.
    case tangerine                              = 334
    /// B&W Group Ltd.
    case bwGroup                                = 335
    /// Pioneer Corporation
    case pioneer                                = 336
    /// OnBeep
    case onBeep                                 = 337
    /// Vernier Software & Technology
    case vernierSoftware                        = 338
    /// ROL Ergo
    case rolErgo                                = 339
    /// Pebble Technology
    case pebble                                 = 340
    /// NETATMO
    case netamo                                 = 341
    /// Accumulate AB
    case accumulate                             = 342
    /// Anhui Huami Information Technology Co., Ltd.
    case anhuiHuami                             = 343
    /// Inmite s.r.o.
    case inmite                                 = 344
    /// ChefSteps, Inc.
    case chefSteps                              = 345
    /// micas AG
    case micas                                  = 346
    /// Biomedical Research Ltd.
    case biomedicalResearch                     = 347
    /// Pitius Tec S.L.
    case pitiusTec                              = 348
    /// Estimote, Inc.
    case estimote                               = 349
    /// Unikey Technologies, Inc.
    case unikeyTechnologies                     = 350
    /// Timer Cap Co.
    case timerCap                               = 351
    /// AwoX
    case awoX                                   = 352
    /// yikes
    case yikes                                  = 353
    /// MADSGlobalNZ Ltd.
    case madsGlobal                             = 354
    /// PCH International
    case pchInternational                       = 355
    /// Qingdao Yeelink Information Technology Co., Ltd.
    case qingdaoYeelinkInformation              = 356
    /// Milwaukee Tool (Formally Milwaukee Electric Tools)
    case milwaukeeTool                          = 357
    /// MISHIK Pte Ltd
    case mishikPte                              = 358
    /// Bayer HealthCare
    case bayerHealthCare                        = 359
    /// Spicebox LLC
    case spicebox                               = 360
    /// emberlight
    case emberlight                             = 361
    /// Cooper-Atkins Corporation
    case cooperAtkins                           = 362
    /// Qblinks
    case qblinks                                = 363
    /// MYSPHERA
    case mysphera                               = 364
    /// LifeScan Inc
    case lifeScan                               = 365
    /// Volantic AB
    case volantic                               = 366
    /// Podo Labs, Inc
    case podoLabs                               = 367
    /// Roche Diabetes Care AG
    case rocheDiabetesCare                      = 368
    /// Amazon Fulfillment Service
    case amazonFulfilmentService                = 369
    /// Connovate Technology Private Limited
    case connovateTechnology                    = 370
    /// Kocomojo, LLC
    case kocomojo                               = 371
    /// Everykey Inc.
    case everykey                               = 372
    /// Dynamic Controls
    case dynamicControls                        = 373
    /// SentriLock
    case sentriLock                             = 374
    /// I-SYST inc.
    case iSyst                                  = 375
    /// CASIO COMPUTER CO., LTD.
    case casioComputer                          = 376
    /// LAPIS Semiconductor Co., Ltd.
    case lapisSemiconductor                     = 377
    /// Telemonitor, Inc.
    case telemonitor                            = 378
    /// taskit GmbH
    case taskit                                 = 379
    /// Daimler AG
    case daimler                                = 380
    /// BatAndCat
    case batAndCat                              = 381
    /// BluDotz Ltd
    case bluDotz                                = 382
    /// XTel Wireless ApS
    case xTelWireless                           = 383
    /// Gigaset Communications GmbH
    case gigasetCommunications                  = 384
    /// Gecko Health Innovations, Inc.
    case geckoHealthInnovations                 = 385
    /// HOP Ubiquitous
    case hopUbiquitous                          = 386
    /// Walt Disney
    case waltDisney                             = 387
    /// Nectar
    case nectar                                 = 388
    /// bel'apps LLC
    case belApps                                = 389
    /// CORE Lighting Ltd
    case coreLighting                           = 390
    /// Seraphim Sense Ltd
    case seraphimSense                          = 391
    /// Unico RBC
    case unicoRBC                               = 392
    /// Physical Enterprises Inc.
    case physicalEnterprises                    = 393
    /// Able Trend Technology Limited
    case ableTrendTechnology                    = 394
    /// Konica Minolta, Inc.
    case konicaMinolta                          = 395
    /// Wilo SE
    case wilo                                   = 396
    /// Extron Design Services
    case extronDesignServices                   = 397
    /// Fitbit, Inc.
    case fitbit                                 = 398
    /// Fireflies Systems
    case firefliesSystems                       = 399
    /// Intelletto Technologies Inc.
    case intellettoTechnologies                 = 400
    /// FDK CORPORATION
    case fdkCorporation                         = 401
    /// Cloudleaf, Inc
    case cloudleaf                              = 402
    /// Maveric Automation LLC
    case mavericAutomation                      = 403
    /// Acoustic Stream Corporation
    case acousticStream                         = 404
    /// Zuli
    case zuli                                   = 405
    /// Paxton Access Ltd
    case paxtonAccess                           = 406
    /// WiSilica Inc.
    case wiSilica                               = 407
    /// VENGIT Korlatolt Felelossegu Tarsasag
    case vengitKorlatolt                        = 408
    /// SALTO SYSTEMS S.L.
    case saltoSystems                           = 409
    /// TRON Forum (formerly T-Engine Forum)
    case tronForum                              = 410
    /// CUBETECH s.r.o.
    case cubetech                               = 411
    /// Cokiya Incorporated
    case cokiya                                 = 412
    /// CVS Health
    case cvsHealth                              = 413
    /// Ceruus
    case ceruus                                 = 414
    /// Strainstall Ltd
    case strainstall                            = 415
    /// Channel Enterprises (HK) Ltd.
    case channelEnterprises                     = 416
    /// FIAMM
    case fiaam                                  = 417
    /// GIGALANE.CO.,LTD
    case gigalane                               = 418
    /// EROAD
    case eroad                                  = 419
    /// Mine Safety Appliances
    case mineSafeyAppliances                    = 420
    /// Icon Health and Fitness
    case iconHealth                             = 421
    /// Asandoo GmbH
    case asandoo                                = 422
    /// ENERGOUS CORPORATION
    case energous                               = 423
    /// Taobao
    case taobao                                 = 424
    /// Canon Inc.
    case canon                                  = 425
    /// Geophysical Technology Inc.
    case geophysicalTechnology                  = 426
    /// Facebook, Inc
    case facebook                               = 427
    /// Nipro Diagnostics, Inc.
    case niproDiagnostics                       = 428
    /// FlightSafety International
    case flightSafety                           = 429
    /// Earlens Corporation
    case earlens                                = 430
    /// Sunrise Micro Devices, Inc.
    case sunriseMicroDevices                    = 431
    /// Star Micronics Co., Ltd.
    case starMicronics                          = 432
    /// Netizens Sp. z o.o.
    case netizens                               = 433
    /// Nymi Inc.
    case nymi                                   = 434
    /// Nytec, Inc.
    case nytec                                  = 435
    /// Trineo Sp. z o.o.
    case trineo                                 = 436
    /// Nest Labs Inc.
    case nestLabs                               = 437
    /// LM Technologies Ltd
    case lmTechnologies                         = 438
    /// General Electric Company
    case generalElectric                        = 439
    /// i+D3 S.L.
    case id3                                    = 440
    /// HANA Micron
    case hanaMicron                             = 441
    /// Stages Cycling LLC
    case stagesCycling                          = 442
    /// Cochlear Bone Anchored Solutions AB
    case cochlearBone                           = 443
    /// SenionLab AB
    case senionLab                              = 444
    /// Syszone Co., Ltd
    case syszone                                = 445
    /// Pulsate Mobile Ltd.
    case pulsateMobile                          = 446
    /// Hong Kong HunterSun Electronic Limited
    case hongKongHunterSun                      = 447
    /// pironex GmbH
    case pironex                                = 448
    /// BRADATECH Corp.
    case bradtech                               = 449
    /// Transenergooil AG
    case transenergooil                         = 450
    /// Bunch
    case bunch                                  = 451
    /// DME Microelectronics
    case dmeMicroelectronics                    = 452
    /// Bitcraze AB
    case bitcraze                               = 453
    /// HASWARE Inc.
    case hasware                                = 454
    /// Abiogenix Inc.
    case abiogenix                              = 455
    /// Poly-Control ApS
    case polyControl                            = 456
    /// Avi-on
    case aviOn                                  = 457
    /// Laerdal Medical AS
    case laerdalMedical                         = 458
    /// Fetch My Pet
    case fetchMyPet                             = 459
    /// Sam Labs Ltd.
    case samLabs                                = 460
    /// Chengdu Synwing Technology Ltd
    case chendguSynwing                         = 461
    /// HOUWA SYSTEM DESIGN, k.k.
    case houwaSystemDesign                      = 462
    /// BSH
    case bsh                                    = 463
    /// Primus Inter Pares Ltd
    case primusInterPares                       = 464
    /// August Home, Inc
    case augustHome                             = 465
    /// Gill Electronics
    case gillElectronics                        = 466
    /// Sky Wave Design
    case skyWaveDesign                          = 467
    /// Newlab S.r.l.
    case newlab                                 = 468
    /// ELAD srl
    case elad                                   = 469
    /// G-wearables inc.
    case gWearables                             = 470
    /// Squadrone Systems Inc
    case squadroneSystems                       = 471
    /// Code Corporation
    case codeCorporation                        = 472
    /// Savant Systems LLC
    case savantSystems                          = 473
    /// Logitech International SA
    case logitech                               = 474
    /// Innblue Consulting
    case innblueConsulting                      = 475
    /// iParking Ltd.
    case iParking                               = 476
    /// Koninklijke Philips Electronics N.V.
    case philips                                = 477
    /// Minelab Electronics Pty Limited
    case minelabElectronics                     = 478
    /// Bison Group Ltd.
    case bisonGroup                             = 479
    /// Widex A/S
    case widex                                  = 480
    /// Jolla Ltd
    case jolla                                  = 481
    /// Lectronix, Inc.
    case lectronix                              = 482
    /// Caterpillar Inc
    case caterpillar                            = 483
    /// Freedom Innovations
    case freedomInnovations                     = 484
    /// Dynamic Devices Ltd
    case dynamicDevices                         = 485
    /// Technology Solutions (UK) Ltd
    case technologySolutions                    = 486
    /// IPS Group Inc.
    case ipsGroup                               = 487
    /// STIR
    case stir                                   = 488
    /// Sano, Inc.
    case sano                                   = 489
    /// Advanced Application Design, Inc.
    case advancedApplicationDesign              = 490
    /// AutoMap LLC
    case autoMap                                = 491
    /// Spreadtrum Communications Shanghai Ltd
    case spreadtrumCommunications               = 492
    /// CuteCircuit LTD
    case cuteCircuit                            = 493
    /// Valeo Service
    case valeoService                           = 494
    /// Fullpower Technologies, Inc.
    case fullpowerTechnologies                  = 495
    /// KloudNation
    case kloudNation                            = 496
    /// Zebra Technologies Corporation
    case zebraTechnologies                      = 497
    /// Itron, Inc.
    case itron                                  = 498
    /// The University of Tokyo
    case tokyoUniversity                        = 499
    /// UTC Fire and Security
    case utcFireAndSecurity                     = 500
    /// Cool Webthings Limited
    case coolWebthings                          = 501
    /// DJO Global
    case djoGlobal                              = 502
    /// Gelliner Limited
    case gellier                                = 503
    /// Anyka (Guangzhou) Microelectronics Technology Co, LTD
    case anykaMicroelectronics                  = 504
    /// Medtronic Inc.
    case medtronic                              = 505
    /// Gozio Inc.
    case gozio                                  = 506
    /// Form Lifting, LLC
    case formLifting                            = 507
    /// Wahoo Fitness, LLC
    case wahooFitness                           = 508
    /// Kontakt Micro-Location Sp. z o.o.
    case knotaktMicroLocation                   = 509
    /// Radio Systems Corporation
    case radioSystems                           = 510
    /// Freescale Semiconductor, Inc.
    case freescaleSemiconductor                 = 511
    /// Verifone Systems Pte Ltd. Taiwan Branch
    case verifone                               = 512
    /// AR Timing
    case arTiming                               = 513
    /// Rigado LLC
    case rigado                                 = 514
    /// Kemppi Oy
    case kemppi                                 = 515
    /// Tapcentive Inc.
    case tapcentive                             = 516
    /// Smartbotics Inc.
    case smartbotics                            = 517
    /// Otter Products, LLC
    case otterProducts                          = 518
    /// STEMP Inc
    case stemp                                  = 519
    /// LumiGeek LLC
    case lumiGeek                               = 520
    /// InvisionHeart Inc.
    case invisionHeart                          = 521
    /// Macnica Inc.
    case macnica                                = 522
    /// Jaguar Land Rover Limited
    case jaguarLandRover                        = 523
    /// CoroWare Technologies, Inc
    case coroWareTechnologies                   = 524
    /// Simplo Technology Co., LTD
    case simploTechnology                       = 525
    /// Omron Healthcare Co., LTD
    case omronHealthcare                        = 526
    /// Comodule GMBH
    case comodule                               = 527
    /// ikeGPS
    case ikeGPS                                 = 528
    /// Telink Semiconductor Co. Ltd
    case telinkSemiconductor                    = 529
    /// Interplan Co., Ltd
    case interplan                              = 530
    /// Wyler AG
    case wyler                                  = 531
    /// IK Multimedia Production srl
    case ikMultimedia                           = 532
    /// Lukoton Experience Oy
    case lukotonExperience                      = 533
    /// MTI Ltd
    case mti                                    = 534
    /// Tech4home, Lda
    case tech4Home                              = 535
    /// Hiotech AB
    case hiotech                                = 536
    /// DOTT Limited
    case dott                                   = 537
    /// Blue Speck Labs, LLC
    case blueSpeckLabs                          = 538
    /// Cisco Systems, Inc
    case cisco                                  = 539
    /// Mobicomm Inc
    case mobicomm                               = 540
    /// Edamic
    case edamic                                 = 541
    /// Goodnet, Ltd
    case goodnet                                = 542
    /// Luster Leaf Products Inc
    case lusterLeafProducts                     = 543
    /// Manus Machina BV
    case manusMachina                           = 544
    /// Mobiquity Networks Inc
    case mobiquityNetworks                      = 545
    /// Praxis Dynamics
    case praxisDynamics                         = 546
    /// Philip Morris Products S.A.
    case philipMorrisProducts                   = 547
    /// Comarch SA
    case comarch                                = 548
    /// Nestl Nespresso S.A.
    case nestlNespresso                         = 549
    /// Merlinia A/S
    case merlinia                               = 550
    /// LifeBEAM Technologies
    case lifeBeamTechnologies                   = 551
    /// Twocanoes Labs, LLC
    case twocanoesLabs                          = 552
    /// Muoverti Limited
    case muoverti                               = 553
    /// Stamer Musikanlagen GMBH
    case stamerMusikanlagen                     = 554
    /// Tesla Motors
    case teslaMotors                            = 555
    /// Pharynks Corporation
    case pharynks                               = 556
    /// Lupine
    case lupine                                 = 557
    /// Siemens AG
    case siemens                                = 558
    /// Huami (Shanghai) Culture Communication CO., LTD
    case huamiCultureCommunications             = 559
    /// Foster Electric Company, Ltd
    case fosterElectric                         = 560
    /// ETA SA
    case eta                                    = 561
    /// x-Senso Solutions Kft
    case xSensoSolutions                        = 562
    /// Shenzhen SuLong Communication Ltd
    case shenzhenSuLongSommunication            = 563
    /// FengFan (BeiJing) Technology Co, Ltd
    case fengFanTechnology                      = 564
    /// Qrio Inc
    case qrio                                   = 565
    /// Pitpatpet Ltd
    case pitpatpet                              = 566
    /// MSHeli s.r.l.
    case msHeli                                 = 567
    /// Trakm8 Ltd
    case trakm8                                 = 568
    /// JIN CO, Ltd
    case jinCo                                  = 569
    /// Alatech Tehnology
    case alatech                                = 570
    /// Beijing CarePulse Electronic Technology Co, Ltd
    case beijingCarePulseElectronic             = 571
    /// Awarepoint
    case awarepoint                             = 572
    /// ViCentra B.V.
    case viCentra                               = 573
    /// Raven Industries
    case ravenIndustries                        = 574
    /// WaveWare Technologies Inc.
    case waveWareTechnologies                   = 575
    /// Argenox Technologies
    case argenox                                = 576
    /// Bragi GmbH
    case bragi                                  = 577
    /// 16Lab Inc
    case sixteenLab                             = 578
    /// Masimo Corp
    case masimo                                 = 579
    /// Iotera Inc
    case iotera                                 = 580
    /// Endress+Hauser
    case endressHauser                          = 581
    /// ACKme Networks, Inc.
    case ackmeNetworks                          = 582
    /// FiftyThree Inc.
    case fiftyThree                             = 583
    /// Parker Hannifin Corp
    case parkerHennifin                         = 584
    /// Transcranial Ltd
    case transcranial                           = 585
    /// Uwatec AG
    case uwatec                                 = 586
    /// Orlan LLC
    case orlan                                  = 587
    /// Blue Clover Devices
    case blueCloverDevices                      = 588
    /// M-Way Solutions GmbH
    case mWaySolutions                          = 589
    /// Microtronics Engineering GmbH
    case microtronicsEngineering                = 590
    /// Schneider Schreibgerte GmbH
    case schneiderSchreibgerte                  = 591
    /// Sapphire Circuits LLC
    case sapphireCircuits                       = 592
    /// Lumo Bodytech Inc
    case lumoBodytech                           = 593
    /// UKC Technosolution
    case ukcTechnosolution                      = 594
    /// Xicato Inc
    case xicato                                 = 595
    /// Playbrush
    case playbrush                              = 596
    /// Dai Nippon Printing Co., Ltd.
    case daiNipponPrinting                      = 597
    /// G24 Power Limited
    case g24Power                               = 598
    /// AdBabble Local Commerce Inc.
    case adBabbleLocalCommerce                  = 599
    /// Devialet SA
    case devialet                               = 600
    /// ALTYOR
    case altyor                                 = 601
    /// University of Applied Sciences Valais/Haute Ecole Valaisanne
    case universityAppliedSciencesValaisanne    = 602
    /// Five Interactive, LLC dba Zendo
    case fiveInteractive                        = 603
    /// NetEaseHangzhouNetwork co.Ltd
    case netEaseHangzhouNetwork                 = 604
    /// Lexmark International Inc.
    case lexmark                                = 605
    /// Fluke Corporation
    case fluke                                  = 606
    /// Yardarm Technologies
    case yardarmTechnologies                    = 607
    /// SensaRx
    case sensaRx                                = 608
    /// SECVRE GmbH
    case secvre                                 = 609
    /// Glacial Ridge Technologies
    case glacialRidgeTechnologies               = 610
    /// Identiv, Inc.
    case identiv                                = 611
    /// DDS Inc.
    case ddsInc                                 = 612
    /// SMK Corporation
    case smkCorporation                         = 613
    /// Schawbel Technologies LLC
    case schawbelTechnologies                   = 614
    /// XMI Systems SA
    case xmiSystems                             = 615
    /// Cerevo
    case cerevo                                 = 616
    /// Torrox GmbH & Co KG
    case torrox                                 = 617
    /// Gemalto
    case gemalto                                = 618
    /// DEKA Research & Development Corp
    case dekkaResearch                          = 619
    /// Domster Tadeusz Szydlowski
    case domsterTadeuszSzydlowski               = 620
    /// Technogym SPA
    case technogym                              = 621
    /// FLEURBAEY BVBA
    case fleurbaey                              = 622
    /// Aptcode Solutions
    case aptcodeSolutions                       = 623
    /// LSI ADL Technology
    case lsiAdlTechnology                       = 624
    /// Animas Corp
    case animasCorp                             = 625
    /// Alps Electric Co., Ltd
    case alpsElectric                           = 626
    /// OCEASOFT
    case oceasoft                               = 627
    /// Motsai Research
    case motsaiResearch                         = 628
    /// Geotab
    case geotab                                 = 629
    /// E.G.O. Elektro-Gertebau GmbH
    case egoElektroGertebau                     = 630
    /// bewhere inc
    case bhwhere                                = 631
    /// Johnson Outdoors Inc
    case johnsonOutdoors                        = 632
    /// steute Schaltgerate GmbH & Co. KG
    case steuteSchaltgerate                     = 633
    /// Ekomini inc.
    case ekomini                                = 634
    /// DEFA AS
    case defa                                   = 635
    /// Aseptika Ltd
    case aseptika                               = 636
    // HUAWEI Technologies Co., Ltd
    case huawei                                 = 637
    /// HabitAware, LLC
    case habitAware                             = 638
    /// ruwido austria gmbh
    case ruwidoAustria                          = 639
    /// ITEC corporation
    case itecCorporation                        = 640
    /// StoneL
    case stoneL                                 = 641
    /// Sonova AG
    case sonova                                 = 642
    /// Maven Machines, Inc.
    case mavenMachines                          = 643
    /// Synapse Electronics
    case synapseElectronics                     = 644
    /// Standard Innovation Inc.
    case standardInnovation                     = 645
    /// RF Code, Inc.
    case rfCode                                 = 646
    /// Wally Ventures S.L.
    case wallyVentures                          = 647
    /// Willowbank Electronics Ltd
    case willowbankElectronics                  = 648
    /// SK Telecom
    case skTelecom                              = 649
    /// Jetro AS
    case jetro                                  = 650
    /// Code Gears LTD
    case codeGears                              = 651
    /// NANOLINK APS
    case nanolink                               = 652
    /// IF, LLC
    case ifLlc                                  = 653
    /// RF Digital Corp
    case rfDigital                              = 654
    /// Church & Dwight Co., Inc
    case churchDwight                           = 655
    /// Multibit Oy
    case multibit                               = 656
    /// CliniCloud Inc
    case cliniCloud                             = 657
    /// SwiftSensors
    case swiftSensors                           = 658
    /// Blue Bite
    case blueBite                               = 659
    /// ELIAS GmbH
    case elias                                  = 660
    /// Sivantos GmbH
    case sivantos                               = 661
    /// Petzl
    case petzl                                  = 662
    /// storm power ltd
    case stormPower                             = 663
    /// EISST Ltd
    case eisst                                  = 664
    /// Inexess Technology Simma KG
    case inexessTechnology                      = 665
    /// Currant, Inc
    case currantInc                             = 666
    /// C2 Development, Inc.
    case c2Development                          = 667
    /// Blue Sky Scientific, LLC
    case blueSkyScientific                      = 668
    /// ALOTTAZS LABS, LLC
    case alottazsLabs                           = 669
    /// Kupson spol. s r.o.
    case kupsonSpol                             = 670
    /// Areus Engineering GmbH
    case areusEngineering                       = 671
    /// Impossible Camera GmbH
    case impossibleCamera                       = 672
    /// InventureTrack Systems
    case inventureTrackSystems                  = 673
    /// LockedUp
    case lockedUp                               = 674
    /// Itude
    case iTude                                  = 675
    /// Pacific Lock Company
    case pacificLock                            = 676
    /// Tendyron Corporation
    case tendyron                               = 677
    /// Robert Bosch GmbH
    case robertBosch                            = 678
    /// Illuxtron international B.V.
    case illuxtronInternational                 = 679
    /// miSport Ltd.
    case miSport                                = 680
    /// Chargelib
    case chargeLib                              = 681
    /// Doppler Lab
    case dopperLab                              = 682
    /// BBPOS Limited
    case bbposLimited                           = 683
    /// RTB Elektronik GmbH & Co. KG
    case rtbElektronik                          = 684
    /// Rx Networks, Inc.
    case rxNetworks                             = 685
    /// WeatherFlow, Inc.
    case weatherFlow                            = 686
    /// Technicolor USA Inc.
    case technicolor                            = 687
    /// Bestechnic(Shanghai),Ltd
    case bestechnic                             = 688
    /// Raden Inc
    case radenInc                               = 689
    /// JouZen Oy
    case jouZen                                 = 690
    /// CLABER S.P.A.
    case claber                                 = 691
    /// Hyginex, Inc.
    case hyginex                                = 692
    /// HANSHIN ELECTRIC RAILWAY CO.,LTD.
    case hanshinElectricRailway                 = 693
    /// Schneider Electric
    case schneiderElectric                      = 694
    /// Oort Technologies LLC
    case oortTechnologies                       = 695
    /// Chrono Therapeutics
    case chronoTherapeutics                     = 696
    /// Rinnai Corporation
    case rinnaiCorporation                      = 697
    /// Swissprime Technologies AG
    case swissprimeTechnologies                 = 698
    /// Koha.,Co.Ltd
    case kohaCo                                 = 699
    /// Genevac Ltd
    case gennevac                               = 700
    /// Chemtronics
    case chemtronics                            = 701
    /// Seguro Technology Sp. z o.o.
    case seguroTechnology                       = 702
    /// Redbird Flight Simulations
    case redbirdFlightSimulations               = 703
    /// Dash Robotics
    case dashRobotics                           = 704
    /// LINE Corporation
    case lineCorporation                        = 705
    /// Guillemot Corporation
    case guillemot                              = 706
    /// Techtronic Power Tools Technology Limited
    case techtronicPowerTools                   = 707
    /// Wilson Sporting Goods
    case wilsonSportingGoods                    = 708
    /// Lenovo (Singapore) Pte Ltd.
    case lenovo                                 = 709
    /// Ayatan Sensors
    case ayatanSensors                          = 710
    /// Electronics Tomorrow Limited
    case electronicsTomorrow                    = 711
    /// VASCO Data Security International, Inc.
    case vascoDataSecurity                      = 712
    /// PayRange Inc.
    case payRangeInc                            = 713
    /// ABOV Semiconductor
    case abovSemiconductor                      = 714
    /// AINA-Wireless Inc.
    case ainaWireless                           = 715
    /// Eijkelkamp Soil & Water
    case eijkelkampSoilWater                    = 716
    /// BMA ergonomics b.v.
    case bmaErgonomics                          = 717
    /// Teva Branded Pharmaceutical Products R&D, Inc
    case tevaBrandedPharmaceutical              = 718
    /// Anima
    case anima                                  = 719
    /// 3M
    case threeM                                 = 720
    /// Empatica Srl
    case empatica                               = 721
    /// Afero, Inc
    case aferoInc                               = 722
    /// Powercast Corporation
    case powercastCorporation                   = 723
    /// Secuyou ApS
    case secuyou                                = 724
    /// OMRON Corporation
    case omronCorporation                       = 725
    /// Send Solutions
    case sendSolutions                          = 726
    /// NIPPON SYSTEMWARE CO.,LTD.
    case nipponSystemware                       = 727
    /// Neosfar
    case neosfar                                = 728
    /// Fliegl Agrartechnik GmbH
    case flieglAgrartechnik                     = 729
    /// Gilvader
    case gilvader                               = 730
    /// Digi International Inc (R)
    case digiInternational                      = 731
    /// DeWalch Technologies, Inc.
    case deWalchTechnologies                    = 732
    /// Flint Rehabilitation Devices, LLC
    case flintRehabilitationDevices             = 733
    /// Samsung SDS Co., Ltd.
    case samsungSds                             = 734
    /// Blur Product Development
    case blurProductDevelopment                 = 735
    /// University of Michigan
    case universityOfMichigan                   = 736
    /// Victron Energy BV
    case victronEnergy                          = 737
    /// NTT docomo
    case nttDocomo                              = 738
    /// Carmanah Technologies Corp.
    case carmanahTechnologies                   = 739
    /// Bytestorm Ltd.
    case bytestorm                              = 740
    /// Espressif Incorporated
    case espressif                              = 741
    /// Unwire
    case unwire                                 = 742
    /// Connected Yard, Inc.
    case connectedYard                          = 743
    /// American Music Environments
    case americanMusicEnvironments              = 744
    /// Sensogram Technologies, Inc.
    case sensogramTechnologies                  = 745
    /// Fujitsu Limited
    case fujitsuLimited                         = 746
    /// Ardic Technology
    case ardicTechnology                        = 747
    /// Delta Systems, Inc
    case deltaSystems                           = 748
    /// HTC Corporation
    case htcCorporation                         = 749
    /// Citizen Holdings Co., Ltd.
    case citizenHoldings                        = 750
    /// SMART-INNOVATION.inc
    case smartInnovation                        = 751
    /// Blackrat Software
    case blackratSoftware                       = 752
    /// The Idea Cave, LLC
    case theIdeaCave                            = 753
    /// GoPro, Inc.
    case goPro                                  = 754
    /// AuthAir, Inc
    case authAir                                = 755
    /// Vensi, Inc.
    case vensi                                  = 756
    /// Indagem Tech LLC
    case indagemTech                            = 757
    /// Intemo Technologies
    case intemoTechnologies                     = 758
    /// DreamVisions co., Ltd.
    case dreamVisions                           = 759
    /// Runteq Oy Ltd
    case runteq                                 = 760
    /// IMAGINATION TECHNOLOGIES LTD
    case imaginationTechnologies                = 761
    /// CoSTAR TEchnologies
    case coStarTechnologies                     = 762
    /// Clarius Mobile Health Corp
    case clariusMobileHeatlthCorp               = 763
    /// Shanghai Frequen Microelectronics Co., Ltd.
    case shanghaiFrequenMicroelectronics        = 764
    /// Uwanna, Inc.
    case uwanna                                 = 765
    /// Lierda Science & Technology Group Co., Ltd.
    case lierdaScienceTechnology                = 766
    /// Silicon Laboratories
    case siliconLaboratories                    = 767
    /// World Moto Inc.
    case worldMoto                              = 768
    /// Giatec Scientific Inc.
    case giatecScientific                       = 769
    /// Loop Devices, Inc
    case loopDevices                            = 770
    /// IACA electronique
    case iacaElectronique                       = 771
    /// Martians Inc
    case martians                               = 772
    /// Swipp ApS
    case swipp                                  = 773
    /// Life Laboratory Inc.
    case lifeLaboratory                         = 774
    /// FUJI INDUSTRIAL CO.,LTD.
    case fujiIndustrial                         = 775
    /// Surefire, LLC
    case surefire                               = 776
    /// Dolby Labs
    case dolbyLabs                              = 777
    /// Ellisys
    case ellisys                                = 778
    /// Magnitude Lighting Converters
    case magnitudeLightingConverters            = 779
    /// Hilti AG
    case hilti                                  = 780
    /// Devdata S.r.l.
    case davdata                                = 781
    /// Deviceworx
    case deviceworx                             = 782
    /// Shortcut Labs
    case shortcutLabs                           = 783
    /// SGL Italia S.r.l.
    case sglItalia                              = 784
    /// PEEQ DATA
    case peeqData                               = 785
    /// Ducere Technologies Pvt Ltd
    case ducereTechnologies                     = 786
    /// DiveNav, Inc.
    case diveNav                                = 787
    /// RIIG AI Sp. z o.o.
    case riigAi                                 = 788
    /// Thermo Fisher Scientific
    case thermoFisher                           = 789
    /// AG Measurematics Pvt. Ltd.
    case agMeasurematics                        = 790
    /// CHUO Electronics CO., LTD.
    case chuoElectronics                        = 791
    /// Aspenta International
    case aspentaInternational                   = 792
    /// Eugster Frismag AG
    case eugsterFrismag                         = 793
    /// Amber wireless GmbH
    case amberWireless                          = 794
    /// HQ Inc
    case hqInc                                  = 795
    /// Lab Sensor Solutions
    case labSensorSolutions                     = 796
    /// Enterlab ApS
    case enterlab                               = 797
    /// Eyefi, Inc.
    case eyeFi                                  = 798
    /// MetaSystem S.p.A.
    case metaSystems                            = 799
    /// SONO ELECTRONICS. CO., LTD
    case sonoElectronics                        = 800
    /// Jewelbots
    case jewelbots                              = 801
    /// Compumedics Limited
    case compumedics                            = 802
    /// Rotor Bike Components
    case rotorBikeComponents                    = 803
    /// Astro, Inc.
    case astroInc                               = 804
    /// Amotus Solutions
    case amotusSolutions                        = 805
    /// Healthwear Technologies (Changzhou)Ltd
    case healthwearTechnologies                 = 806
    /// Essex Electronics
    case essexElectronics                       = 807
    /// Grundfos A/S
    case grundfos                               = 808
    /// Eargo, Inc
    case eargoInc                               = 809
    /// Electronic Design Lab
    case electronicDesignLab                    = 810
    /// ESYLUX
    case esylux                                 = 811
    /// NIPPON SMT.CO.,Ltd
    case nipponSmt                              = 812
    /// BM innovations GmbH
    case bmInnovations                          = 813
    /// indoormap
    case indoormap                              = 814
    /// OttoQ Inc
    case ottoQ                                  = 815
    /// North Pole Engineering
    case northPoleEngineering                   = 816
    /// 3flares Technologies Inc.
    case threeFlaresTechnologies                = 817
    /// Electrocompaniet A.S.
    case electrocompaniet                       = 818
    /// Mul-T-Lock
    case mulTLock                               = 819
    /// Corentium AS
    case corentium                              = 820
    /// Enlighted Inc
    case enlightedInc                           = 821
    /// GISTIC
    case gistic                                 = 822
    /// AJP2 Holdings, LLC
    case ajp2Holdings                           = 823
    /// COBI GmbH
    case cobi                                   = 824
    /// Blue Sky Scientific, LLC
    case blueSkyScientificLlc                   = 825
    /// Appception, Inc.
    case appception                             = 826
    /// Courtney Thorne Limited
    case courtneyThorne                         = 827
    /// Virtuosys
    case virtuosys                              = 828
    /// TPV Technology Limited
    case tpvTechnologyLimited                   = 829
    /// Monitra SA
    case monitra                                = 830
    /// Automation Components, Inc.
    case automationComponents                   = 831
    /// Letsense s.r.l.
    case letsense                               = 832
    /// Etesian Technologies LLC
    case etesianTechnologies                    = 833
    /// GERTEC BRASIL LTDA
    case gertecBrasil                           = 834
    /// Drekker Development Pty. Ltd.
    case drekkerDevelopment                     = 835
    /// Whirl Inc.
    case whirl                                  = 836
    /// Locus Positioning
    case locusPositioning                       = 837
    /// Acuity Brands Lighting, Inc
    case acuityBrandsLighting                   = 838
    /// Prevent Biometrics
    case preventBiometrics                      = 839
    /// Arioneo
    case arioneo                                = 840
    /// VersaMe
    case versaMe                                = 841
    /// Vaddio
    case vaddio                                 = 842
    /// Libratone A/S
    case libratone                              = 843
    /// HM Electronics, Inc.
    case hmElectronics                          = 844
    /// TASER International, Inc.
    case taserInternational                     = 845
    /// SafeTrust Inc.
    case safeTrust                              = 846
    /// Heartland Payment Systems
    case heartlandPaymentSystems                = 847
    /// Bitstrata Systems Inc.
    case bitstrataSystems                       = 848
    /// Pieps GmbH
    case pieps                                  = 849
    /// iRiding(Xiamen)Technology Co.,Ltd.
    case iRidingTechnology                      = 850
    /// Alpha Audiotronics, Inc.
    case alphaAudiotronics                      = 851
    /// TOPPAN FORMS CO.,LTD.
    case toppanForms                            = 852
    /// Sigma Designs, Inc.
    case sigmaDesigns                           = 853
    /// Spectrum Brands, Inc.
    case spectrumBrands                         = 854
    /// Polymap Wireless
    case polymapWiress                          = 855
    /// MagniWare Ltd.
    case magniWare                              = 856
    /// Novotec Medical GmbH
    case novotecMedical                         = 857
    /// Medicom Innovation Partner a/s
    case medicomInnovationPartner               = 858
    /// Matrix Inc.
    case matrix                                 = 859
    /// Eaton Corporation
    case eaton                                  = 860
    /// KYS
    case kys                                    = 861
    /// Naya Health, Inc.
    case nayaHealth                             = 862
    /// Acromag
    case acromag                                = 863
    /// Insulet Corporation
    case insulet                                = 864
    /// Wellinks Inc.
    case welllinks                              = 865
    /// ON Semiconductor
    case onSemiconductor                        = 866
    /// FREELAP SA
    case freelap                                = 867
    /// Favero Electronics Srl
    case faveroElectronics                      = 868
    /// BioMech Sensor LLC
    case bioMechSensor                          = 869
    /// BOLTT Sports technologies Private limited
    case bolttSportsTechnologies                = 870
    /// Saphe International
    case sapheInternational                     = 871
    /// Metormote AB
    case metromote                              = 872
    /// littleBits
    case littleBits                             = 873
    /// SetPoint Medical
    case setPointMedical                        = 874
    /// BRControls Products BV
    case brControlsProducts                     = 875
    /// Zipcar
    case zipcar                                 = 876
    /// AirBolt Pty Ltd
    case airBolt                                = 877
    /// KeepTruckin Inc
    case KeepTruckin                            = 878
    /// Motiv, Inc.
    case motiv                                  = 879
    /// Wazombi Labs O
    case wazombiLabs                            = 880
    /// ORBCOMM
    case orbcomm                                = 881
    /// Nixie Labs, Inc.
    case nixieLabs                              = 882
    /// AppNearMe Ltd
    case appNearMe                              = 883
    /// Holman Industries
    case holmanIndustries                       = 884
    /// Expain AS
    case expain                                 = 885
    /// Electronic Temperature Instruments Ltd
    case electronicTemperatureInstruments       = 886
    /// Plejd AB
    case plejd                                  = 887
    /// Propeller Health
    case propellerHealth                        = 888
    /// Shenzhen iMCO Electronic Technology Co.,Ltd
    case shenzhenImcoElectronicTechnology       = 889
    /// Algoria
    case algoria                                = 890
    /// Apption Labs Inc.
    case apptionLabs                            = 891
    /// Cronologics Corporation
    case chronologicsCorporation                = 892
    /// MICRODIA Ltd.
    case microdia                               = 893
    /// lulabytes S.L.
    case lulabytes                              = 894
    /// Nestec S.A.
    case nestec                                 = 895
    /// MEGA-F service LLC
    case megaFService                           = 896
    /// Sharp Corporation
    case sharp                                  = 897
    /// Precision Outcomes Ltd
    case percisionOutcomes                      = 898
    /// Kronos Incorporated
    case kronosIncorporated                     = 899
    /// OCOSMOS Co., Ltd.
    case ocosmos                                = 900
    /// Embedded Electronic Solutions Ltd. dba e2Solutions
    case embeddedElectronicSolutions            = 901
    /// Aterica Inc.
    case aterica                                = 902
    /// BluStor PMC, Inc.
    case blueStore                              = 903
    /// Kapsch TrafficCom AB
    case kapschTrafficCom                       = 904
    /// ActiveBlu Corporation
    case activeBlu                              = 905
    /// Kohler Mira Limited
    case kohlerMira                             = 906
    /// Noke
    case noke                                   = 907
    /// Appion Inc.
    case appionInc                              = 908
    /// Resmed Ltd
    case resmed                                 = 909
    /// Crownstone B.V.
    case crownstone                             = 910
    /// Xiaomi Inc.
    case xiaomi                                 = 911
    /// INFOTECH s.r.o.
    case infotech                               = 912
    /// Thingsquare AB
    case thingsquare                            = 913
    /// T&D
    case tAndD                                  = 914
    /// LAVAZZA S.p.A. 
    case lavazza                                = 915
    /// Netclearance Systems, Inc.
    case netclearanceSystems                    = 916
    /// SDATAWAY
    case sdataway                               = 917
    /// BLOKS GmbH
    case bloks                                  = 918
    /// LEGO System A/S
    case legoSystem                             = 919
    /// Thetatronics Ltd
    case thetatronics                           = 920
    /// Nikon Corporation
    case nikon                                  = 921
    /// NeST
    case nest                                   = 922
    /// South Silicon Valley Microelectronics
    case southSiliconVallyMicroelectronics      = 923
    /// ALE International
    case aleInternational                       = 924
    /// CareView Communications, Inc.
    case careViewCommunications                 = 925
    /// SchoolBoard Limited
    case schooBoardLimited                      = 926
    /// Molex Corporation
    case molex                                  = 927
    /// IVT Wireless Limited
    case ivtWireless                            = 928
    /// Alpine Labs LLC
    case alpineLabs                             = 929
    /// Candura Instruments
    case canduraInstruments                     = 930
    /// SmartMovt Technology Co., Ltd
    case smartMovtTechnology                    = 931
    /// Token Zero Ltd
    case tokenZero                              = 932
    /// ACE CAD Enterprise Co., Ltd. (ACECAD)
    case aceCadEnterprise                       = 933
    /// Medela, Inc
    case medelaInc                              = 934
    /// AeroScout
    case aeroScout                              = 935
    /// Esrille Inc.
    case esrille                                = 936
    /// THINKERLY SRL
    case thinkerly                              = 937
    /// Exon Sp. z o.o
    case exonSp                                 = 938
    /// Meizu Technology Co., Ltd.
    case meizuTechnology                        = 939
    /// Smablo LTD
    case smablo                                 = 940
    /// XiQ
    case xiQ                                    = 941
    /// Allswell Inc.
    case allswell                               = 942
    /// Comm-N-Sense Corp DBA Verigo
    case verigo                                 = 943
    /// VIBRADORM GmbH
    case virbradorm                             = 944
    /// Otodata Wireless Network Inc.
    case otodataWirelessNetwork                 = 945
    /// Propagation Systems Limited
    case propagationSystems                     = 946
    /// Midwest Instruments & Controls
    case midwestInstrumentsControls             = 947
    /// Alpha Nodus, inc.
    case alphaNodus                             = 948
    /// petPOMM, Inc
    case petPomm                                = 949
    /// Mattel
    case mattel                                 = 950
    /// Airbly Inc.
    case airblyInc                              = 951
    /// A-Safe Limited
    case aSafe                                  = 952
    /// FREDERIQUE CONSTANT SA
    case frederiqueConstant                     = 953
    /// Maxscend Microelectronics Company Limited
    case maxscendMicroelectronics               = 954
    /// Abbott Diabetes Care
    case abbottDiabetesCare                     = 955
    /// ASB Bank Ltd
    case asbBank                                = 956
    /// amadas
    case amadas                                 = 957
    /// Applied Science, Inc.
    case appliedScience                         = 958
    /// iLumi Solutions Inc.
    case iLumiSolutions                         = 959
    /// Arch Systems Inc
    case archSystems                            = 960
    /// Ember Technologies, Inc.
    case emberTechnologies                      = 961
    /// Snapchat Inc
    case snapchat                               = 962
    /// Casambi Technologies Oy
    case casambiTechnologies                    = 963
    /// Pico Technology Inc.
    case picoTechnoloy                          = 964
    /// St. Jude Medical, Inc.
    case stJudeMedical                          = 965
    /// Intricon
    case intricon                               = 966
    /// Structural Health Systems, Inc.
    case structuralHealthSystems                = 967
    /// Avvel International
    case avvelInternational                     = 968
    /// Gallagher Group
    case gallagherGroup                         = 969
    /// In2things Automation Pvt. Ltd.
    case in2thingsAutomation                    = 970
    ///  SYSDEV Srl
    case sysdev                                 = 971
    /// Vonkil Technologies Ltd
    case vonkilTechnologies                     = 972
    /// Wynd Technologies, Inc.
    case wyndTechnologies                       = 973
    /// CONTRINEX S.A.
    case contrinex                              = 974
    /// MIRA, Inc
    case miraInc                                = 975
    /// Watteam Ltd
    case watteam                                = 976
    /// Density Inc.
    case densityInc                             = 977
    /// IOT Pot India Private Limited
    case iotPotIndia                            = 978
    /// Sigma Connectivity AB
    case sigmaConnectivity                      = 979
    /// PEG PEREGO SPA
    case pegPerego                              = 980
    /// Wyzelink Systems Inc.
    case wyzelinkSystems                        = 981
    /// Yota Devices LTD
    case yotaDevices                            = 982
    /// FINSECUR
    case finsecur                               = 983
    /// Zen-Me Labs Ltd
    case zenMeLabs                              = 984
    /// 3IWare Co., Ltd
    case threeIWare                             = 985
    /// EnOcean GmbH
    case enOcean                                = 986
    /// Instabeat, Inc
    case instabeat                              = 987
    /// Nima Labs
    case nimaLabs                               = 988
    /// Andreas Stihl AG & Co. KG
    case andreasStihl                           = 989
    /// Nathan Rhoades LLC
    case nathanRhoades                          = 990
    /// Grob Technologies, LLC
    case grobTechnologies                       = 991
    /// Actions (Zhuhai) Technology Co., Limited
    case actionsZhuhaiTechnology                = 992
    /// SPD Development Company Ltd
    case spdDevelopmentCompany                  = 993
    /// Sensoan Oy
    case sensoan                                = 994
    /// Qualcomm Life Inc
    case qualcommLife                           = 995
    /// Chip-ing AG
    case chiping                                = 996
    /// ffly4u
    case ffly4u                                 = 997
    /// IoT Instruments Oy
    case iotInstruments                         = 998
    /// TRUE Fitness Technology
    case trueFitnessTechnology                  = 999
    /// Reiner Kartengeraete GmbH & Co. KG.
    case reinerKartengeraete                    = 1000
    /// SHENZHEN LEMONJOY TECHNOLOGY CO., LTD.
    case shenzhenLemonJoyTechnology             = 1001
    /// Hello Inc.
    case helloInc                               = 1002
    /// Evollve Inc.
    case evollveInc                             = 1003
    /// Jigowatts Inc.
    case jigowatts                              = 1004
    /// BASIC MICRO.COM,INC.
    case basicMicro                             = 1005
    /// CUBE TECHNOLOGIES
    case cubeTechnologies                       = 1006
    /// foolography GmbH
    case foolography                            = 1007
    /// CLINK
    case cLink                                  = 1008
    /// Hestan Smart Cooking Inc.
    case hestanSmartCooking                     = 1009
    /// WindowMaster A/S
    case windowMaster                           = 1010
    /// Flowscape AB
    case flowscape                              = 1011
    /// PAL Technologies Ltd
    case palTechnologies                        = 1012
    /// WHERE, Inc.
    case whereInc                               = 1013
    /// Iton Technology Corp.
    case itonTechnology                         = 1014
    /// Owl Labs Inc.
    case owlLabs                                = 1015
    /// Rockford Corp.
    case rockford                               = 1016
    /// Becon Technologies Co.,Ltd.
    case beconTechnologies                      = 1017
    /// Vyassoft Technologies Inc
    case vyassoftTechnologies                   = 1018
    /// Nox Medical
    case noxMedical                             = 1019
    /// Kimberly-Clark
    case kimberlyClark                          = 1020
    /// Trimble Navigation Ltd.
    case trimbleNavigation                      = 1021
    /// Littelfuse
    case littleFuse                             = 1022
    /// Withings
    case withings                               = 1023
    /// i-developer IT Beratung UG
    case iDeveloperIT                           = 1024
    /// Sears Holdings Corporation
    case searsHoldings                          = 1026
    /// Gantner Electronic GmbH
    case gantnerElectronic                      = 1027
    /// Authomate Inc
    case authomate                              = 1028
    /// Vertex International, Inc.
    case vertexInternational                    = 1029
    /// Airtago
    case airtago                                = 1030
    /// Swiss Audio SA
    case swissAudio                             = 1031
    /// ToGetHome Inc.
    case toGetHome                              = 1032
    /// AXIS
    case axis                                   = 1033
    /// Openmatics
    case openmatics                             = 1034
    /// Jana Care Inc.
    case janaCare                               = 1035
    /// Senix Corporation
    case senixCorporation                       = 1036
    /// NorthStar Battery Company, LLC
    case northStarBatteryCompany                = 1037
    /// SKF (U.K.) Limited
    case skfUK                                  = 1038
    /// CO-AX Technology, Inc.
    case coAxTechnology                         = 1039
    /// Fender Musical Instruments
    case fenderMusicalInstruments               = 1040
    /// Luidia Inc
    case luidiaInc                              = 1041
    /// SEFAM
    case sefam                                  = 1042
    /// Wireless Cables Inc.
    case wirelessCables                         = 1043
    /// Lightning Protection International Pty Ltd
    case lightningProtectionInternational       = 1044
    /// Uber Technologies Inc
    case uberTechnologies                       = 1045
    /// SODA GmbH
    case soda                                   = 1046
    /// Fatigue Science
    case fatigueScience                         = 1047
    /// Alpine Electronics Inc.
    case alpineElectronics                      = 1048
    /// Novalogy LTD
    case novalogy                               = 1049
    /// Friday Labs Limited
    case fridayLabs                             = 1050
    /// OrthoAccel Technologies
    case orthoAccelTechnologies                 = 1051
    /// WaterGuru, Inc.
    case waterGuru                              = 1052
    /// Benning Elektrotechnik und Elektronik GmbH & Co. KG
    case benningElektrotechnik                  = 1053
    /// Dell Computer Corporation
    case dellComputer                           = 1054
    /// Kopin Corporation
    case kopinCorporation                       = 1055
    /// TecBakery GmbH
    case tecBakery                              = 1056
    /// Backbone Labs, Inc.
    case backboneLabs                           = 1057
    /// DELSEY SA
    case delsey                                 = 1058
    /// Chargifi Limited
    case chargifi                               = 1059
    /// Trainesense Ltd.
    case trainesense                            = 1060
    /// Unify Software and Solutions GmbH & Co. KG
    case unifySoftwareAndSolutions              = 1061
    /// Husqvarna AB
    case husqvarna                              = 1062
    /// Focus fleet and fuel management inc
    case focusFleetFuelMangement                = 1063
    /// SmallLoop, LLC
    case smallLoop                              = 1064
    /// Prolon Inc.
    case prolonInc                              = 1065
    /// BD Medical
    case bdMedical                              = 1066
    /// iMicroMed Incorporated
    case iMicroMed                              = 1067
    /// Ticto N.V.
    case ticto                                  = 1068
    /// Meshtech AS
    case meshtech                               = 1069
    /// MemCachier Inc.
    case memCachier                             = 1070
    /// Danfoss A/S
    case danfoss                                = 1071
    /// SnapStyk Inc.
    case snapStyk                               = 1072
    /// Amway Corporation
    case amwayCorporation                       = 1073
    /// Silk Labs, Inc.
    case silkLabs                               = 1074
    /// Pillsy Inc.
    case pillsyInc                              = 1075
    /// Hatch Baby, Inc.
    case hatchBaby                              = 1076
    /// Blocks Wearables Ltd.
    case blocksWearables                        = 1077
    /// Drayson Technologies (Europe) Limited
    case draysonTechnologies                    = 1078
    /// eBest IOT Inc.
    case eBestIot                               = 1079
    /// Helvar Ltd
    case helvar                                 = 1080
    /// Radiance Technologies
    case radienceTechnologies                   = 1081
    /// Nuheara Limited
    case nuheara                                = 1082
    /// Appside co., ltd.
    case appside                                = 1083
    /// DeLaval
    case deLaval                                = 1084
    /// Coiler Corporation
    case colierCorporation                      = 1085
    /// Thermomedics, Inc.
    case thermomedics                           = 1086
    /// Tentacle Sync GmbH
    case tentacleSync                           = 1087
    /// Valencell, Inc.
    case valencell                              = 1088
    /// iProtoXi Oy
    case iProtoXi                               = 1089
    /// SECOM CO., LTD.
    case secomCo                                = 1090
    /// Tucker International LLC
    case tuckerInternational                    = 1091
    /// Metanate Limited
    case metanateLimited                        = 1092
    /// Kobian Canada Inc.
    case kobainCanada                           = 1093
    /// NETGEAR, Inc.
    case netgear                                = 1094
    /// Fabtronics Australia Pty Ltd
    case fabtronics                             = 1095
    /// Grand Centrix GmbH
    case grandCentrix                           = 1096
    /// 1UP USA.com llc
    case oneUpUsa                               = 1097
    /// SHIMANO INC.
    case shimano                                = 1098
    /// Nain Inc.
    case nainInc                                = 1099
    /// LifeStyle Lock, LLC
    case lifeStyleLock                          = 1100
    /// VEGA Grieshaber KG
    case vegaGrieshaber                         = 1101
    /// Xtrava Inc.
    case xtravaInc                              = 1102
    /// TTS Tooltechnic Systems AG & Co. KG
    case ttsTooltechnicSystems                  = 1103
    /// Teenage Engineering AB
    case teenageEngineering                     = 1104
    /// Tunstall Nordic AB
    case tunstallNordic                         = 1105
    /// Svep Design Center AB
    case svepDesignCenter                       = 1106
    /// GreenPeak Technologies BV
    case greenPeakTechnologies                  = 1107
    /// Sphinx Electronics GmbH & Co KG
    case sphinxElectronics                      = 1108
    /// Atomation
    case atomation                              = 1109
    /// Nemik Consulting Inc
    case nemikConsulting                        = 1110
    /// RF INNOVATION
    case rfInnovation                           = 1111
    /// Mini Solution Co., Ltd.
    case miniSolution                           = 1112
    /// Lumenetix, Inc
    case lumenetix                              = 1113
    /// 2048450 Ontario Inc
    case two048450Ontario                       = 1114
    /// SPACEEK LTD
    case spaceek                                = 1115
    /// Delta T Corporation
    case deltaT                                 = 1116
    /// Boston Scientific Corporation
    case bostonScientific                       = 1117
    /// Nuviz, Inc.
    case nuvizInc                               = 1118
    /// Real Time Automation, Inc.
    case realTimeAutomation                     = 1119
    /// Kolibree
    case kolibree                               = 1120
    /// vhf elektronik GmbH
    case vhfElektronik                          = 1121
    /// Bonsai Systems GmbH
    case bonsaiSystems                          = 1122
    /// Fathom Systems Inc.
    case fathomSystems                          = 1123
    /// Bellman & Symfon
    case bellmanSymfon                          = 1124
    /// International Forte Group LLC
    case internationalForteGroup                = 1125
    /// CycleLabs Solutions inc.
    case cycleLabsSolutions                     = 1126
    /// Codenex Oy
    case codenex                                = 1127
    /// Kynesim Ltd
    case kynesim                                = 1128
    /// Palago AB
    case palago                                 = 1129
    /// INSIGMA INC.
    case insigmaInc                             = 1130
    /// PMD Solutions
    case pmdSolutions                           = 1131
    /// Qingdao Realtime Technology Co., Ltd.
    case qingdaoRealtimeTechnology              = 1132
    /// BEGA Gantenbrink-Leuchten KG
    case begaGantenbrinkLeuchten                = 1133
    /// Pambor Ltd
    case pamborLtd                              = 1134
    /// Develco Products A/S
    case develcoProducts                        = 1135
    /// iDesign s.r.l.
    case iDesign                                = 1136
    /// TiVo Corp
    case tiVo                                   = 1137
    /// Control-J Pty Ltd
    case controlJ                               = 1138
    /// Steelcase, Inc.
    case stealcase                              = 1139
    /// iApartment co., ltd.
    case iApartment                             = 1140
    /// Icom inc.
    case icomInc                                = 1141
    /// Oxstren Wearable Technologies Private Limited
    case oxstrenWearableTechnologies            = 1142
    /// Blue Spark Technologies
    case blueSparkTechnologies                  = 1143
    /// FarSite Communications Limited
    case farSiteCommunications                  = 1144
    /// mywerk system GmbH
    case mywerkSystem                           = 1145
    /// Sinosun Technology Co., Ltd.
    case sinosunTechnology                      = 1146
    /// MIYOSHI ELECTRONICS CORPORATION
    case miyoshiElectronics                     = 1147
    /// POWERMAT LTD
    case powermat                               = 1148
    /// Occly LLC
    case occly                                  = 1149
    /// OurHub Dev IvS
    case ourHubDev                              = 1150
    /// Pro-Mark, Inc.
    case proMark                                = 1151
    /// Dynometrics Inc.
    case dynometrics                            = 1152
    /// Quintrax Limited
    case quintrax                               = 1153
    /// POS Tuning Udo Vosshenrich GmbH & Co. KG
    case posTuningUdoVosshenrich                = 1154
    /// Multi Care Systems B.V.
    case multiCareSystems                       = 1155
    /// Revol Technologies Inc
    case revolTechnologies                      = 1156
    /// SKIDATA AG
    case skidata                                = 1157
    /// DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME
    case devTecnologiaIndustria                 = 1158
    /// Centrica Connected Home
    case centricaConnectedHome                  = 1159
    /// Automotive Data Solutions Inc
    case automotiveDataSolutions                = 1160
    /// Igarashi Engineering
    case igarashiEngineering                    = 1161
    /// Taelek Oy
    case taelek                                 = 1162
    /// CP Electronics Limited
    case cpElectronics                          = 1163
    /// Vectronix AG
    case vectronix                              = 1164
    /// S-Labs Sp. z o.o.
    case sLabs                                  = 1165
    /// Companion Medical, Inc.
    case companionMedical                       = 1166
    /// BlueKitchen GmbH
    case blueKitchen                            = 1167
    /// Matting AB
    case matting                                = 1168
    /// SOREX - Wireless Solutions GmbH
    case sorexWirelessSolutions                 = 1169
    /// ADC Technology, Inc.
    case adcTechnology                          = 1170
    /// Lynxemi Pte Ltd
    case lynxemi                                = 1171
    /// SENNHEISER electronic GmbH & Co. KG
    case sennheiserElectronic                   = 1172
    /// LMT Mercer Group, Inc
    case lmtMercerGroup                         = 1173
    /// Polymorphic Labs LLC
    case polymorphicLabs                        = 1174
    /// Cochlear Limited
    case cochlearLimited                        = 1175
    /// METER Group, Inc. USA
    case meterGroup                             = 1176
    /// Ruuvi Innovations Ltd.
    case ruuviInnovations                       = 1177
    /// Situne AS
    case situne                                 = 1178
    /// nVisti, LLC
    case nVisti                                 = 1179
    /// DyOcean
    case dyOcean                                = 1180
    /// Uhlmann & Zacher GmbH
    case uhlmannZacher                          = 1181
    /// AND!XOR LLC
    case andNotXor                              = 1182
    /// tictote AB
    case tictote                                = 1183
    /// Vypin, LLC
    case vypin                                  = 1184
    /// PNI Sensor Corporation
    case pniSensorCorporation                   = 1185
    /// ovrEngineered, LLC
    case ovrEngineered                          = 1186
    /// GT-tronics HK Ltd
    case gtTronics                              = 1187
    /// Herbert Waldmann GmbH & Co. KG
    case herbertWaldmann                        = 1188
    /// Guangzhou FiiO Electronics Technology Co.,Ltd
    case guangzhouFiiOElectronics               = 1189
    /// Vinetech Co., Ltd
    case vinetech                               = 1190
    /// Dallas Logic Corporation
    case dallasLogic                            = 1191
    /// BioTex, Inc.
    case bioTex                                 = 1192
    /// DISCOVERY SOUND TECHNOLOGY, LLC
    case discoverySoundTechnology               = 1193
    /// LINKIO SAS
    case linkio                                 = 1194
    /// Harbortronics, Inc.
    case harbortonics                           = 1195
    /// Undagrid B.V.
    case undagrid                               = 1196
    /// Shure Inc
    case shureInc                               = 1197
    /// ERM Electronic Systems LTD
    case ermElectronicSystems                   = 1198
    /// BIOROWER Handelsagentur GmbH
    case biorowerHandelsagentur                 = 1199
    /// Weba Sport und Med. Artikel GmbH
    case webaSportMed                           = 1200
    /// Kartographers Technologies Pvt. Ltd.
    case kartographersTechnologies              = 1201
    /// The Shadow on the Moon
    case theShadowOnTheMoon                     = 1202
    /// mobike (Hong Kong) Limited
    case mobike                                 = 1203
    /// Inuheat Group AB
    case inuheatGroup                           = 1204
    /// Swiftronix AB
    case swiftronix                             = 1205
    /// Diagnoptics Technologies
    case diagnopticsTechnologies                = 1206
    /// Analog Devices, Inc.
    case analogDevices                          = 1207
    /// Soraa Inc.
    case soraaInc                               = 1208
    /// CSR Building Products Limited
    case csrBuildingProducts                    = 1209
    /// Crestron Electronics, Inc.
    case crestronElectronics                    = 1210
    /// Neatebox Ltd
    case neatebox                               = 1211
    /// Draegerwerk AG & Co. KGaA
    case draegerwerk                            = 1212
    /// AlbynMedical
    case albynMedical                           = 1213
    /// Averos FZCO
    case averosFzco                             = 1214
    /// VIT Initiative, LLC
    case vitInitiative                          = 1215
    /// Statsports International
    case statsportsInternational                = 1216
    /// Sospitas, s.r.o.
    case sospitas                               = 1217
    /// Dmet Products Corp.
    case dmetProducts                           = 1218
    /// Mantracourt Electronics Limited
    case mantracourtElectronics                 = 1219
    /// TeAM Hutchins AB
    case teAMHutchins                           = 1220
    /// Seibert Williams Glass, LLC
    case seibertWilliamsGlass                   = 1221
    /// Insta GmbH
    case insta                                  = 1222
    /// Svantek Sp. z o.o.
    case svantek                                = 1223
    /// Shanghai Flyco Electrical Appliance Co., Ltd.
    case shanghaiFlycoElectricalAppliance       = 1224
    /// Thornwave Labs Inc
    case thornwaveLabs                          = 1225
    /// Steiner-Optik GmbH
    case steinerOptik                           = 1226
    /// Novo Nordisk A/S
    case novoNordisk                            = 1227
    /// Enflux Inc.
    case enfluxInc                              = 1228
    /// Safetech Products LLC
    case safetechProducts                       = 1229
    /// GOOOLED S.R.L.
    case goooled                                = 1230
    /// DOM Sicherheitstechnik GmbH & Co. KG
    case domSicherheitstechnik                  = 1231
    /// Olympus Corporation
    case olympus                                = 1232
    /// KTS GmbH
    case ktsGermany                             = 1233
    /// Anloq Technologies Inc.
    case anloqTechnologies                      = 1234
    /// Queercon, Inc
    case queercon                               = 1235
    /// 5th Element Ltd
    case fifthElement                           = 1236
    /// Gooee Limited
    case gooeeLimited                           = 1237
    /// LUGLOC LLC
    case lugloc                                 = 1238
    /// Blincam, Inc.
    case blincam                                = 1239
    /// FUJIFILM Corporation
    case fujiFilm                               = 1240
    /// RandMcNally
    case randMcNally                            = 1241
    /// Franceschi Marina snc
    case franceschiMarina                       = 1242
    /// Engineered Audio, LLC.
    case engineeredAudio                        = 1243
    /// IOTTIVE (OPC) PRIVATE LIMITED
    case iottive                                = 1244
    /// 4MOD Technology
    case fourModTechnology                      = 1245
    /// Lutron Electronics Co., Inc.
    case lutronElectronics                      = 1246
    /// Emerson
    case emerson                                = 1247
    /// Guardtec, Inc.
    case guardtec                               = 1248
    /// REACTEC LIMITED
    case reactecLimited                         = 1249
    /// EllieGrid
    case ellieGrid                              = 1250
    /// Under Armour
    case underArmour                            = 1251
    /// Woodenshark
    case woodenshark                            = 1252
    /// Avack Oy
    case avack                                  = 1253
    /// Smart Solution Technology, Inc.
    case smartSolutionTechnology                = 1254
    /// REHABTRONICS INC.
    case rehabronics                            = 1255
    /// STABILO International
    case stabiloInternational                   = 1256
    /// Busch Jaeger Elektro GmbH
    case buschJaegerElektro                     = 1257
    /// Pacific Bioscience Laboratories, Inc
    case pacificBioscienceLaboratories          = 1258
    /// Bird Home Automation GmbH
    case birdHomeAutomation                     = 1259
    /// Motorola Solutions
    case motorolaSolutions                      = 1260
    /// R9 Technology, Inc.
    case r9technology                           = 1261
    /// Auxivia
    case auxivia                                = 1262
    /// DaisyWorks, Inc
    case daisyWorks                             = 1263
    /// Kosi Limited
    case kosiLimited                            = 1264
    /// Theben AG
    case theben                                 = 1265
    /// InDreamer Techsol Private Limited
    case inDreamerTechsol                       = 1266
    /// Cerevast Medical
    case cerevastMedical                        = 1267
    /// ZanCompute Inc.
    case zanCompute                             = 1268
    /// Pirelli Tyre S.P.A.
    case pirelliTyre                            = 1269
    /// McLear Limited
    case mcLearLimited                          = 1270
    /// Shenzhen Huiding Technology Co.,Ltd.
    case shenzhenHuidingTechnology              = 1271
    /// Convergence Systems Limited
    case convergenceSystems                     = 1272
    /// Interactio
    case interactio                             = 1273
    /// Androtec GmbH
    case androtec                               = 1274
    /// Benchmark Drives GmbH & Co. KG
    case benchmarkDrives                        = 1275
    /// SwingLync L. L. C.
    case swingLync                              = 1276
    /// Tapkey GmbH
    case tapkey                                 = 1277
    /// Woosim Systems Inc.
    case woosimSystems                          = 1278
    /// Microsemi Corporation
    case microsemiCorporation                   = 1279
    /// Wiliot LTD.
    case wiliot                                 = 1280
    /// Polaris IND
    case polarisInd                             = 1281
    /// Specifi-Kali LLC
    case specifiKali                            = 1282
    /// Locoroll, Inc
    case locoroll                               = 1283
    /// PHYPLUS Inc
    case phyplus                                = 1284
    /// Inplay Technologies LLC
    case inplayTechnologies                     = 1285
    /// Hager
    case hager                                  = 1286
    /// Yellowcog
    case yellowcog                              = 1287
    /// Axes System sp. z o. o.
    case axesSystems                            = 1288
    /// myLIFTER Inc.
    case myLifter                               = 1289
    /// Shake-on B.V.
    case shakeOn                                = 1290
    /// Vibrissa Inc.
    case vibrissa                               = 1291
    /// OSRAM GmbH
    case osramGermany                           = 1292
    /// TRSystems GmbH
    case trSystems                              = 1293
    /// Yichip Microelectronics (Hangzhou) Co.,Ltd.
    case yichipMicroelectronics                 = 1294
    /// Foundation Engineering LLC
    case foundationEngineering                  = 1295
    /// UNI-ELECTRONICS, INC.
    case uniElectronics                         = 1296
    /// Brookfield Equinox LLC
    case brookfieldEquinox                      = 1297
    /// Soprod SA
    case soprod                                 = 1298
    /// 9974091 Canada Inc.
    case nine974091Canada                       = 1299
    /// FIBRO GmbH
    case fibroGermany                           = 1300
    /// RB Controls Co., Ltd.
    case rbControls                             = 1301
    /// Footmarks
    case footmarks                              = 1302
    /// Amcore AB
    case amcore                                 = 1303
    /// MAMORIO.inc
    case mamorioInc                             = 1304
    /// Tyto Life LLC
    case tytoLife                               = 1305
    /// Leica Camera AG
    case leicaCamera                            = 1306
    /// Angee Technologies Ltd.
    case angeeTechnologies                      = 1307
    /// EDPS
    case edps                                   = 1308
    /// OFF Line Co., Ltd.
    case offLineCo                              = 1309
    /// Detect Blue Limited
    case detectBlueLimited                      = 1310
    /// Setec Pty Ltd
    case setecPty                               = 1311
    /// Target Corporation
    case targetCorporation                      = 1312
    /// IAI Corporation
    case iaiCorporation                         = 1313
    /// NS Tech, Inc.
    case nsTechInc                              = 1314
    /// MTG Co., Ltd.
    case mtgCo                                  = 1315
    /// Hangzhou iMagic Technology Co., Ltd
    case hangzhouiMagicTechnology               = 1316
    /// HONGKONG NANO IC TECHNOLOGIES CO., LIMITED
    case hongKongNanoIcTechnologies             = 1317
    /// Honeywell International Inc.
    case honeywellInternational                 = 1318
    /// Albrecht JUNG
    case albrechtJung                           = 1319
    /// Lunera Lighting Inc.
    case luneraLighting                         = 1320
    /// Lumen UAB
    case lumenUAB                               = 1321
    /// Keynes Controls Ltd
    case keynesControls                         = 1322
    /// Novartis AG
    case novartis                               = 1323
    /// Geosatis SA
    case geosatis                               = 1324
    /// EXFO, Inc.
    case exfoInc                                = 1325
    /// LEDVANCE GmbH
    case ledvance                               = 1326
    /// Center ID Corp.
    case centerIdCorp                           = 1327
    /// Adolene, Inc.
    case adoleneInc                             = 1328
    /// D+M Holdings Inc.
    case dmHoldings                             = 1329
    /// CRESCO Wireless, Inc.
    case crescoWireless                         = 1330
    /// Nura Operations Pty Ltd
    case nuraOperations                         = 1331
    /// Frontiergadget, Inc.
    case frontiergadget                         = 1332
    /// Smart Component Technologies Limited
    case smartCompnentTechnologies              = 1333
    /// ZTR Control Systems LLC
    case ztrControlSystems                      = 1334
    /// MetaLogics Corporation
    case metaLogicsCorporation                  = 1335
    /// Medela AG
    case medelaAg                               = 1336
    /// OPPLE Lighting Co., Ltd
    case oppleLightingCo                        = 1337
    /// Savitech Corp.
    case savitechCorp                           = 1338
    /// prodigy
    case prodigy                                = 1339
    /// Screenovate Technologies Ltd
    case screenovateTechnologies                = 1340
    /// TESA SA
    case tesa                                   = 1341
    /// CLIM8 LIMITED
    case clim8Limited                           = 1342
    /// Silergy Corp
    case silergyCorp                            = 1343
    /// SilverPlus, Inc
    case silverPlusInc                          = 1344
    /// Sharknet srl
    case sharknet                               = 1345
    /// Mist Systems, Inc.
    case mistSystems                            = 1346
    /// MIWA LOCK CO.,Ltd
    case miwaLock                               = 1347
    /// OrthoSensor, Inc.
    case orthoSensor                            = 1348
    /// Candy Hoover Group s.r.l
    case candyHooverGroup                       = 1349
    /// Apexar Technologies S.A.
    case apexarTechnologies                     = 1350
    /// LOGICDATA d.o.o.
    case logicdata                              = 1351
    /// Knick Elektronische Messgerte GmbH & Co.KG
    case knickElektronischeMessgerte            = 1352
    /// Smart Technologies and Investment Limited
    case smartTechnologiesInvestment            = 1353
    /// Linough Inc
    case linoughInc                             = 1354
    /// Advanced Electronic Designs, Inc.
    case advancedElectronicDesigns              = 1355


    //Non offical IDs
    //
    /// Four Eyes Viiiiva
    ///
    /// - note: Non assigned Number
    case viiiiva                                = 16657
    /// Exogal
    ///
    /// - note: Non assigned Number
    case exogal                                 = 17752
    /// Unikey Technologies, Inc.
    ///
    /// Some of the devices have the Manufacturer in Big Endian
    ///
    /// - note: Non assigned Number
    /// - SeeAlso: unikeyTechnologies
    case uniKey                                 = 24065
    /// Dropcam
    ///
    /// - note: Non assigned Number
    case dropcam                                = 35888
    /// Reserved
    ///
    /// This value has special meaning depending on the context in which it used.
    /// - Link Manager Protocol (LMP): This value may be used in the internal and interoperability tests before a Company ID has been assigned. This value shall not be used in shipping end products.
    /// - Device ID Profile: This value is reserved as the default vendor ID when no Device ID service record is present in a remote device
    case reserved                               = 65535
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
        case .alpineElectronicsChina:
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
        case .endressHauser:
            return "Endress+Hauser"
        case .ackmeNetworks:
            return "ACKme Networks, Inc."
        case .fiftyThree:
            return "FiftyThree Inc."
        case .parkerHennifin:
            return "Parker Hannifin Corp"
        case .transcranial:
            return "Transcranial Ltd"
        case .uwatec:
            return "Uwatec AG"
        case .orlan:
            return "Orlan LLC"
        case .blueCloverDevices:
            return "Blue Clover Devices"
        case .mWaySolutions:
            return "M-Way Solutions GmbH"
        case .microtronicsEngineering:
            return "Microtronics Engineering GmbH"
        case .schneiderSchreibgerte:
            return "Schneider Schreibgerte GmbH"
        case .sapphireCircuits:
            return "Sapphire Circuits LLC"
        case .lumoBodytech:
            return "Lumo Bodytech Inc"
        case .ukcTechnosolution:
            return "UKC Technosolution"
        case .xicato:
            return "Xicato Inc"
        case .playbrush:
            return "Playbrush"
        case .daiNipponPrinting:
            return "Dai Nippon Printing Co., Ltd."
        case .g24Power:
            return "G24 Power Limited"
        case .adBabbleLocalCommerce:
            return "AdBabble Local Commerce Inc."
        case .devialet:
            return "Devialet SA"
        case .altyor:
            return "ALTYOR"
        case .universityAppliedSciencesValaisanne:
            return "University of Applied Sciences Valais/Haute Ecole Valaisanne"
        case .fiveInteractive:
            return "Five Interactive, LLC"
        case .netEaseHangzhouNetwork:
            return "NetEaseHangzhouNetwork co.Ltd"
        case .lexmark:
            return "Lexmark International Inc."
        case .fluke:
            return "Fluke Corporation"
        case .yardarmTechnologies:
            return "Yardarm Technologies"
        case .sensaRx:
            return "SensaRx"
        case .secvre:
            return "SECVRE GmbH"
        case .glacialRidgeTechnologies:
            return "Glacial Ridge Technologies"
        case .identiv:
            return "Identiv, Inc."
        case .ddsInc:
            return "DDS Inc."
        case .smkCorporation:
            return "SMK Corporation"
        case .schawbelTechnologies:
            return "Schawbel Technologies LLC"
        case .xmiSystems:
            return "XMI Systems SA"
        case .cerevo:
            return "Cerevo"
        case .torrox:
            return "Torrox GmbH & Co KG"
        case .gemalto:
            return "Gemalto"
        case .dekkaResearch:
            return "DEKA Research & Development Corp"
        case .domsterTadeuszSzydlowski:
            return "Domster Tadeusz Szydlowski"
        case .technogym:
            return "Technogym SPA"
        case .fleurbaey:
            return "FLEURBAEY BVBA"
        case .aptcodeSolutions:
            return "Aptcode Solutions"
        case .lsiAdlTechnology:
            return "LSI ADL Technology"
        case .animasCorp:
            return "Animas Corp"
        case .alpsElectric:
            return "Alps Electric Co., Ltd"
        case .oceasoft:
            return "OCEASOFT"
        case .motsaiResearch:
            return "Motsai Research"
        case .geotab:
            return "Geotab"
        case .egoElektroGertebau:
            return "E.G.O. Elektro-Gertebau GmbH"
        case .bhwhere:
            return "bewhere inc"
        case .johnsonOutdoors:
            return "Johnson Outdoors Inc"
        case .steuteSchaltgerate:
            return "Steute Schaltgerate GmbH & Co. KG"
        case .ekomini:
            return "Ekomini inc."
        case .defa:
            return "DEFA AS"
        case .aseptika:
            return "Aseptika Ltd"
        case .huawei:
            return "HUAWEI Technologies Co., Ltd"
        case .habitAware:
            return "HabitAware, LLC"
        case .ruwidoAustria:
            return "ruwido austria gmbh"
        case .itecCorporation:
            return "ITEC corporation"
        case .stoneL:
            return "StoneL"
        case .sonova:
            return "Sonova AG"
        case .mavenMachines:
            return "Maven Machines, Inc."
        case .synapseElectronics:
            return "Synapse Electronics"
        case .standardInnovation:
            return "Standard Innovation Inc."
        case .rfCode:
            return "RF Code, Inc."
        case .wallyVentures:
            return "Wally Ventures S.L."
        case .willowbankElectronics:
            return "Willowbank Electronics Ltd"
        case .skTelecom:
            return "SK Telecom"
        case .jetro:
            return "Jetro AS"
        case .codeGears:
            return "Code Gears LTD"
        case .nanolink:
            return "NANOLINK APS"
        case .ifLlc:
            return "IF, LLC"
        case .rfDigital:
            return "RF Digital Corp"
        case .churchDwight:
            return "Church & Dwight Co., Inc"
        case .multibit:
            return "Multibit Oy"
        case .cliniCloud:
            return "CliniCloud Inc"
        case .swiftSensors:
            return "SwiftSensors"
        case .blueBite:
            return "Blue Bite"
        case .elias:
            return "ELIAS GmbH"
        case .sivantos:
            return "Sivantos GmbH"
        case .petzl:
            return "Petzl"
        case .stormPower:
            return "storm power ltd"
        case .eisst:
            return "EISST Ltd"
        case .inexessTechnology:
            return "Inexess Technology Simma KG"
        case .currantInc:
            return "Currant, Inc"
        case .c2Development:
            return "C2 Development, Inc."
        case .blueSkyScientific:
            return "Blue Sky Scientific, LLC"
        case .alottazsLabs:
            return "ALOTTAZS LABS, LLC"
        case .kupsonSpol:
            return "Kupson spol. s r.o."
        case .areusEngineering:
            return "Areus Engineering GmbH"
        case .impossibleCamera:
            return "Impossible Camera GmbH"
        case .inventureTrackSystems:
            return "InventureTrack Systems"
        case .lockedUp:
            return "LockedUp"
        case .iTude:
            return "Itude"
        case .pacificLock:
            return "Pacific Lock Company"
        case .tendyron:
            return "Tendyron Corporation"
        case .robertBosch:
            return "Robert Bosch GmbH"
        case .illuxtronInternational:
            return "Illuxtron international B.V."
        case .miSport:
            return "miSport Ltd."
        case .chargeLib:
            return "Chargelib"
        case .dopperLab:
            return "Doppler Lab"
        case .bbposLimited:
            return "BBPOS Limited"
        case .rtbElektronik:
            return "RTB Elektronik GmbH & Co. KG"
        case .rxNetworks:
            return "Rx Networks, Inc"
        case .weatherFlow:
            return "WeatherFlow, Inc."
        case .technicolor:
            return "Technicolor USA Inc."
        case .bestechnic:
            return "Bestechnic(Shanghai),Ltd"
        case .radenInc:
            return "Raden Inc"
        case .jouZen:
            return "JouZen Oy"
        case .claber:
            return "CLABER S.P.A."
        case .hyginex:
            return "Hyginex, Inc."
        case .hanshinElectricRailway:
            return "HANSHIN ELECTRIC RAILWAY CO.,LTD."
        case .schneiderElectric:
            return "Schneider Electric"
        case .oortTechnologies:
            return "Oort Technologies LLC"
        case .chronoTherapeutics:
            return "Chrono Therapeutics"
        case .rinnaiCorporation:
            return "Rinnai Corporation"
        case .swissprimeTechnologies:
            return "Swissprime Technologies AG"
        case .kohaCo:
            return "Koha.,Co.Ltd"
        case .gennevac:
            return "Genevac Ltd"
        case .chemtronics:
            return "Chemtronics"
        case .seguroTechnology:
            return "Seguro Technology Sp. z o.o."
        case .redbirdFlightSimulations:
            return "Redbird Flight Simulations"
        case .dashRobotics:
            return "Dash Robotics"
        case .lineCorporation:
            return "LINE Corporation"
        case .guillemot:
            return "Guillemot Corporation"
        case .techtronicPowerTools:
            return "Techtronic Power Tools Technology Limited"
        case .wilsonSportingGoods:
            return "Wilson Sporting Goods"
        case .lenovo:
            return "Lenovo (Singapore) Pte Ltd."
        case .ayatanSensors:
            return "Ayatan Sensors"
        case .electronicsTomorrow:
            return "Electronics Tomorrow Limited"
        case .vascoDataSecurity:
            return "VASCO Data Security International, Inc."
        case .payRangeInc:
            return "PayRange Inc."
        case .abovSemiconductor:
            return "ABOV Semiconductor"
        case .ainaWireless:
            return "AINA-Wireless Inc."
        case .eijkelkampSoilWater:
            return "Eijkelkamp Soil & Water"
        case .bmaErgonomics:
            return "BMA ergonomics b.v."
        case .tevaBrandedPharmaceutical:
            return "Teva Branded Pharmaceutical Products R&D, Inc"
        case .anima:
            return "Anima"
        case .threeM:
            return "3M"
        case .empatica:
            return "Empatica Srl"
        case .aferoInc:
            return "Afero, Inc"
        case .powercastCorporation:
            return "Powercast Corporation"
        case .secuyou:
            return "Secuyou ApS"
        case .omronCorporation:
            return "OMRON Corporation"
        case .sendSolutions:
            return "Send Solutions"
        case .nipponSystemware:
            return "NIPPON SYSTEMWARE CO.,LTD."
        case .neosfar:
            return "Neosfar"
        case .flieglAgrartechnik:
            return "Fliegl Agrartechnik GmbH"
        case .gilvader:
            return "Gilvader"
        case .digiInternational:
            return "Digi International Inc (R)"
        case .deWalchTechnologies:
            return "DeWalch Technologies, Inc."
        case .flintRehabilitationDevices:
            return "Flint Rehabilitation Devices, LLC"
        case .samsungSds:
            return "Samsung SDS Co., Ltd"
        case .blurProductDevelopment:
            return "Blur Product Development"
        case .universityOfMichigan:
            return "University of Michigan"
        case .victronEnergy:
            return "Victron Energy BV"
        case .nttDocomo:
            return "NTT docomo"
        case .carmanahTechnologies:
            return "Carmanah Technologies Corp"
        case .bytestorm:
            return "Bytestorm Ltd."
        case .espressif:
            return "Espressif Incorporated"
        case .unwire:
            return "Unwire"
        case .connectedYard:
            return "Connected Yard, Inc."
        case .americanMusicEnvironments:
            return "American Music Environments"
        case .sensogramTechnologies:
            return "Sensogram Technologies, Inc."
        case .fujitsuLimited:
            return "Fujitsu Limited"
        case .ardicTechnology:
            return "Ardic Technology"
        case .deltaSystems:
            return "Delta Systems, Inc"
        case .htcCorporation:
            return "HTC Corporation"
        case .citizenHoldings:
            return "Citizen Holdings Co., Ltd."
        case .smartInnovation:
            return "SMART-INNOVATION.inc"
        case .blackratSoftware:
            return "Blackrat Software"
        case .theIdeaCave:
            return "The Idea Cave, LLC"
        case .goPro:
            return "GoPro, Inc."
        case .authAir:
            return "AuthAir, Inc"
        case .vensi:
            return "Vensi, Inc."
        case .indagemTech:
            return "Indagem Tech LLC"
        case .intemoTechnologies:
            return "Intemo Technologies"
        case .dreamVisions:
            return "DreamVisions co., Ltd."
        case .runteq:
            return "Runteq Oy Ltd"
        case .imaginationTechnologies:
            return "IMAGINATION TECHNOLOGIES LTD"
        case .coStarTechnologies:
            return "CoSTAR TEchnologies"
        case .clariusMobileHeatlthCorp:
            return "Clarius Mobile Health Corp"
        case .shanghaiFrequenMicroelectronics:
            return "Shanghai Frequen Microelectronics Co., Ltd."
        case .uwanna:
            return "Uwanna, Inc."
        case .lierdaScienceTechnology:
            return "Lierda Science & Technology Group Co., Ltd."
        case .siliconLaboratories:
            return "Silicon Laboratories"
        case .worldMoto:
            return "World Moto Inc."
        case .giatecScientific:
            return "Giatec Scientific Inc."
        case .loopDevices:
            return "Loop Devices, Inc"
        case .iacaElectronique:
            return "IACA electronique"
        case .martians:
            return "Martians Inc"
        case .swipp:
            return "Swipp ApS"
        case .lifeLaboratory:
            return "Life Laboratory Inc."
        case .fujiIndustrial:
            return "FUJI INDUSTRIAL CO.,LTD"
        case .surefire:
            return "Surefire, LLC"
        case .dolbyLabs:
            return "Dolby Labs"
        case .ellisys:
            return "Ellisys"
        case .magnitudeLightingConverters:
            return "Magnitude Lighting Converters"
        case .hilti:
            return "Hilti AG"
        case .davdata:
            return "Devdata S.r.l."
        case .deviceworx:
            return "Deviceworx"
        case .shortcutLabs:
            return "Shortcut Labs"
        case .sglItalia:
            return "SGL Italia S.r.l/"
        case .peeqData:
            return "PEEQ DATA"
        case .ducereTechnologies:
            return "Ducere Technologies Pvt Ltd"
        case .diveNav:
            return "DiveNav, Inc."
        case .riigAi:
            return "RIIG AI Sp. z o.o."
        case .thermoFisher:
            return "Thermo Fisher Scientific"
        case .agMeasurematics:
            return "AG Measurematics Pvt. Ltd."
        case .chuoElectronics:
            return "CHUO Electronics CO., LTD."
        case .aspentaInternational:
            return "Aspenta International"
        case .eugsterFrismag:
            return "Eugster Frismag AG"
        case .amberWireless:
            return "Amber wireless GmbH"
        case .hqInc:
            return "HQ Inc"
        case .labSensorSolutions:
            return "Lab Sensor Solutions"
        case .enterlab:
            return "Enterlab ApS"
        case .eyeFi:
            return "Eyefi, Inc."
        case .metaSystems:
            return "MetaSystem S.p.A."
        case .sonoElectronics:
            return "SONO ELECTRONICS. CO., LTD"
        case .jewelbots:
            return "Jewelbots"
        case .compumedics:
            return "Compumedics Limited"
        case .rotorBikeComponents:
            return "Rotor Bike Components"
        case .astroInc:
            return "Astro, Inc."
        case .amotusSolutions:
            return "Amotus Solutions"
        case .healthwearTechnologies:
            return "Healthwear Technologies (Changzhou)Ltd"
        case .essexElectronics:
            return "Essex Electronics"
        case .grundfos:
            return "Grundfos A/S"
        case .eargoInc:
            return "Eargo, Inc"
        case .electronicDesignLab:
            return "Electronic Design Lab"
        case .esylux:
            return "ESYLUX"
        case .nipponSmt:
            return "NIPPON SMT.CO.,Ltd"
        case .bmInnovations:
            return "BM innovations GmbH"
        case .indoormap:
            return "indoormap"
        case .ottoQ:
            return "OttoQ Inc"
        case .northPoleEngineering:
            return "North Pole Engineering"
        case .threeFlaresTechnologies:
            return "3flares Technologies Inc."
        case .electrocompaniet:
            return "Electrocompaniet A.S."
        case .mulTLock:
            return "Mul-T-Lock"
        case .corentium:
            return "Corentium AS"
        case .enlightedInc:
            return "Enlighted Inc"
        case .gistic:
            return "GISTIC"
        case .ajp2Holdings:
            return "AJP2 Holdings, LLC"
        case .cobi:
            return "COBI GmbH"
        case .blueSkyScientificLlc:
            return "Blue Sky Scientific, LLC"
        case .appception:
            return "Appception, Inc."
        case .courtneyThorne:
            return "Courtney Thorne Limited"
        case .virtuosys:
            return "Virtuosys"
        case .tpvTechnologyLimited:
            return "TPV Technology Limited"
        case .monitra:
            return "Monitra SA"
        case .automationComponents:
            return "Automation Components, Inc."
        case .letsense:
            return "Letsense s.r.l."
        case .etesianTechnologies:
            return "Etesian Technologies LLC"
        case .gertecBrasil:
            return "GERTEC BRASIL LTDA"
        case .drekkerDevelopment:
            return "Drekker Development Pty. Ltd."
        case .whirl:
            return "Whirl Inc"
        case .locusPositioning:
            return "Locus Positioning"
        case .acuityBrandsLighting:
            return "Acuity Brands Lighting, Inc"
        case .preventBiometrics:
            return "Prevent Biometrics"
        case .arioneo:
            return "Arioneo"
        case .versaMe:
            return "VersaMe"
        case .vaddio:
            return "Vaddio"
        case .libratone:
            return "Libratone A/S"
        case .hmElectronics:
            return "HM Electronics, Inc."
        case .taserInternational:
            return "TASER International, Inc."
        case .safeTrust:
            return "SafeTrust Inc."
        case .heartlandPaymentSystems:
            return "Heartland Payment Systems"
        case .bitstrataSystems:
            return "Bitstrata Systems Inc."
        case .pieps:
            return "Pieps GmbH"
        case .iRidingTechnology:
            return "iRiding(Xiamen)Technology Co.,Ltd."
        case .alphaAudiotronics:
            return "Alpha Audiotronics, Inc."
        case .toppanForms:
            return "TOPPAN FORMS CO.,LTD."
        case .sigmaDesigns:
            return "Sigma Designs, Inc."
        case .spectrumBrands:
            return "Spectrum Brands, Inc."
        case .polymapWiress:
            return "Polymap Wireless"
        case .magniWare:
            return "MagniWare Ltd."
        case .novotecMedical:
            return "Novotec Medical GmbH"
        case .medicomInnovationPartner:
            return "Medicom Innovation Partner a/s"
        case .matrix:
            return "Matrix Inc."
        case .eaton:
            return "Eaton Corporation"
        case .kys:
            return "KYS"
        case .nayaHealth:
            return "Naya Health, Inc."
        case .acromag:
            return "Acromag"
        case .insulet:
            return "Insulet Corporation"
        case .welllinks:
            return "Wellinks Inc."
        case .onSemiconductor:
            return "ON Semiconductor"
        case .freelap:
            return "FREELAP SA"
        case .faveroElectronics:
            return "Favero Electronics Srl"
        case .bioMechSensor:
            return "BioMech Sensor LLC"
        case .bolttSportsTechnologies:
            return "BOLTT Sports technologies Private limited"
        case .sapheInternational:
            return "Saphe International"
        case .metromote:
            return "Metormote AB"
        case .littleBits:
            return "littleBits"
        case .setPointMedical:
            return "SetPoint Medical"
        case .brControlsProducts:
            return "BRControls Products BV"
        case .zipcar:
            return "Zipcar"
        case .airBolt:
            return "AirBolt Pty Ltd"
        case .KeepTruckin:
            return "KeepTruckin Inc"
        case .motiv:
            return "Motiv, Inc."
        case .wazombiLabs:
            return "Wazombi Labs O"
        case .orbcomm:
            return "ORBCOMM"
        case .nixieLabs:
            return "Nixie Labs, Inc."
        case .appNearMe:
            return "AppNearMe Ltd"
        case .holmanIndustries:
            return "Holman Industries"
        case .expain:
            return "Expain AS"
        case .electronicTemperatureInstruments:
            return "Electronic Temperature Instruments Ltd"
        case .plejd:
            return "Plejd AB"
        case .propellerHealth:
            return "Propeller Health"
        case .shenzhenImcoElectronicTechnology:
            return "Shenzhen iMCO Electronic Technology Co.,Ltd"
        case .algoria:
            return "Algoria"
        case .apptionLabs:
            return "Apption Labs Inc"
        case .chronologicsCorporation:
            return "Cronologics Corporation"
        case .microdia:
            return "MICRODIA Ltd."
        case .lulabytes:
            return "lulabytes S.L."
        case .nestec:
            return "Nestec S.A."
        case .megaFService:
            return "MEGA-F service LLC"
        case .sharp:
            return "Sharp Corporation"
        case .percisionOutcomes:
            return "Precision Outcomes Ltd"
        case .kronosIncorporated:
            return "Kronos Incorporated"
        case .ocosmos:
            return "OCOSMOS Co., Ltd."
        case .embeddedElectronicSolutions:
            return "Embedded Electronic Solutions Ltd. dba e2Solutions"
        case .aterica:
            return "Aterica Inc."
        case .blueStore:
            return "BluStor PMC, Inc."
        case .kapschTrafficCom:
            return "Kapsch TrafficCom AB"
        case .activeBlu:
            return "ActiveBlu Corporation"
        case .kohlerMira:
            return "Kohler Mira Limited"
        case .noke:
            return "Noke"
        case .appionInc:
            return "Appion Inc."
        case .resmed:
            return "Resmed Ltd"
        case .crownstone:
            return "Crownstone B.V."
        case .xiaomi:
            return "Xiaomi Inc."
        case .infotech:
            return "INFOTECH s.r.o."
        case .thingsquare:
            return "Thingsquare AB"
        case .tAndD:
            return "T&D"
        case .lavazza:
            return "LAVAZZA S.p.A."
        case .netclearanceSystems:
            return "Netclearance Systems, Inc."
        case .sdataway:
            return "SDATAWAY"
        case .bloks:
            return "BLOKS GmbH"
        case .legoSystem:
            return "LEGO System A/S"
        case .thetatronics:
            return "Thetatronics Ltd"
        case .nikon:
            return "Nikon Corporation"
        case .nest:
            return "NeST"
        case .southSiliconVallyMicroelectronics:
            return "South Silicon Valley Microelectronics"
        case .aleInternational:
            return "ALE International"
        case .careViewCommunications:
            return "CareView Communications, Inc."
        case .schooBoardLimited:
            return "SchoolBoard Limited"
        case .molex:
            return "Molex Corporation"
        case .ivtWireless:
            return "IVT Wireless Limited"
        case .alpineLabs:
            return "Alpine Labs LLC"
        case .canduraInstruments:
            return "Candura Instruments"
        case .smartMovtTechnology:
            return "SmartMovt Technology Co., Ltd"
        case .tokenZero:
            return "Token Zero Ltd"
        case .aceCadEnterprise:
            return "ACE CAD Enterprise Co., Ltd."
        case .medelaInc:
            return "Medela, Inc"
        case .aeroScout:
            return "AeroScout"
        case .esrille:
            return "Esrille Inc."
        case .thinkerly:
            return "THINKERLY SRL"
        case .exonSp:
            return "Exon Sp. z o.o"
        case .meizuTechnology:
            return "Meizu Technology Co., Ltd."
        case .smablo:
            return "Smablo LTD"
        case .xiQ:
            return "XiQ"
        case .allswell:
            return "Allswell Inc."
        case .verigo:
            return "Comm-N-Sense Corp DBA Verigo"
        case .virbradorm:
            return "VIBRADORM GmbH"
        case .otodataWirelessNetwork:
            return "Otodata Wireless Network Inc."
        case .propagationSystems:
            return "Propagation Systems Limited"
        case .midwestInstrumentsControls:
            return "Midwest Instruments & Controls"
        case .alphaNodus:
            return "Alpha Nodus, inc."
        case .petPomm:
            return "petPOMM, Inc"
        case .mattel:
            return "Mattel"
        case .airblyInc:
            return "Airbly Inc."
        case .aSafe:
            return "A-Safe Limited"
        case .frederiqueConstant:
            return "FREDERIQUE CONSTANT SA"
        case .maxscendMicroelectronics:
            return "Maxscend Microelectronics Company Limited"
        case .abbottDiabetesCare:
            return "Abbott Diabetes Care"
        case .asbBank:
            return "ASB Bank Ltd"
        case .amadas:
            return "amadas"
        case .appliedScience:
            return "Applied Science, Inc."
        case .iLumiSolutions:
            return "iLumi Solutions Inc."
        case .archSystems:
            return "Arch Systems Inc"
        case .emberTechnologies:
            return "Ember Technologies, Inc."
        case .snapchat:
            return "Snapchat Inc"
        case .casambiTechnologies:
            return "Casambi Technologies Oy"
        case .picoTechnoloy:
            return "Pico Technology Inc"
        case .stJudeMedical:
            return "St. Jude Medical, Inc."
        case .intricon:
            return "Intricon"
        case .structuralHealthSystems:
            return "Structural Health Systems, Inc."
        case .avvelInternational:
            return "Avvel International"
        case .gallagherGroup:
            return "Gallagher Group"
        case .in2thingsAutomation:
            return "In2things Automation Pvt. Ltd"
        case .sysdev:
            return "SYSDEV Srl"
        case .vonkilTechnologies:
            return "Vonkil Technologies Ltd"
        case .wyndTechnologies:
            return "Wynd Technologies, Inc."
        case .contrinex:
            return "CONTRINEX S.A."
        case .miraInc:
            return "MIRA, Inc"
        case .watteam:
            return "Watteam Ltd"
        case .densityInc:
            return "Density Inc."
        case .iotPotIndia:
            return "IOT Pot India Private Limited"
        case .sigmaConnectivity:
            return "Sigma Connectivity AB"
        case .pegPerego:
            return "PEG PEREGO SPA"
        case .wyzelinkSystems:
            return "Wyzelink Systems Inc."
        case .yotaDevices:
            return "Yota Devices LTD"
        case .finsecur:
            return "FINSECUR"
        case .zenMeLabs:
            return "Zen-Me Labs Ltd"
        case .threeIWare:
            return "3IWare Co., Ltd"
        case .enOcean:
            return "EnOcean GmbH"
        case .instabeat:
            return "Instabeat, Inc"
        case .nimaLabs:
            return "Nima Labs"
        case .andreasStihl:
            return "Andreas Stihl AG & Co. KG"
        case .nathanRhoades:
            return "Nathan Rhoades LLC"
        case .grobTechnologies:
            return "Grob Technologies, LLC"
        case .actionsZhuhaiTechnology:
            return "Actions (Zhuhai) Technology Co., Limited"
        case .spdDevelopmentCompany:
            return "SPD Development Company Ltd"
        case .sensoan:
            return "Sensoan Oy"
        case .qualcommLife:
            return "Qualcomm Life Inc"
        case .chiping:
            return "Chip-ing AG"
        case .ffly4u:
            return "ffly4u"
        case .iotInstruments:
            return "IoT Instruments Oy"
        case .trueFitnessTechnology:
            return "TRUE Fitness Technology"
        case .reinerKartengeraete:
            return "Reiner Kartengeraete GmbH & Co. KG."
        case .shenzhenLemonJoyTechnology:
            return "SHENZHEN LEMONJOY TECHNOLOGY CO., LTD."
        case .helloInc:
            return "Hello Inc."
        case .evollveInc:
            return "Evollve Inc."
        case .jigowatts:
            return "Jigowatts Inc."
        case .basicMicro:
            return "BASIC MICRO.COM,INC"
        case .cubeTechnologies:
            return "CUBE TECHNOLOGIES"
        case .foolography:
            return "foolography GmbH"
        case .cLink:
            return "CLINK"
        case .hestanSmartCooking:
            return "Hestan Smart Cooking Inc."
        case .windowMaster:
            return "WindowMaster A/S"
        case .flowscape:
            return "Flowscape AB"
        case .palTechnologies:
            return "PAL Technologies Ltd"
        case .whereInc:
            return "WHERE, Inc."
        case .itonTechnology:
            return "Iton Technology Corp."
        case .owlLabs:
            return "Owl Labs Inc."
        case .rockford:
            return "Rockford Corp."
        case .beconTechnologies:
            return "Becon Technologies Co.,Ltd."
        case .vyassoftTechnologies:
            return "Vyassoft Technologies Inc."
        case .noxMedical:
            return "Nox Medical"
        case .kimberlyClark:
            return "Kimberly-Clark"
        case .trimbleNavigation:
            return "Trimble Navigation Ltd."
        case .littleFuse:
            return "Littelfuse"
        case .withings:
            return "Withings"
        case .iDeveloperIT:
            return "i-developer IT Beratung UG"
        case .searsHoldings:
            return "Sears Holdings Corporation"
        case .gantnerElectronic:
            return "Gantner Electronic GmbH"
        case .authomate:
            return "Authomate Inc"
        case .vertexInternational:
            return "Vertex International, Inc."
        case .airtago:
            return "Airtago"
        case .swissAudio:
            return "Rockfo."
        case .toGetHome:
            return "ToGetHome Inc."
        case .axis:
            return "AXIS"
        case .openmatics:
            return "Openmatics"
        case .janaCare:
            return "Jana Care Inc."
        case .senixCorporation:
            return "Senix Corporation"
        case .northStarBatteryCompany:
            return "NorthStar Battery Company, LLC"
        case .skfUK:
            return "SKF (U.K.) Limited"
        case .coAxTechnology:
            return "CO-AX Technology, Inc."
        case .fenderMusicalInstruments:
            return "Fender Musical Instruments"
        case .luidiaInc:
            return "Luidia Inc"
        case .sefam:
            return "SEFAM"
        case .wirelessCables:
            return "Wireless Cables Inc."
        case .lightningProtectionInternational:
            return "Lightning Protection International Pty Ltd"
        case .uberTechnologies:
            return "Uber Technologies Inc"
        case .soda:
            return "SODA GmbH"
        case .fatigueScience:
            return "Fatigue Science"
        case .alpineElectronics:
            return "Alpine Electronics Inc."
        case .novalogy:
            return "Novalogy LTD"
        case .fridayLabs:
            return "Friday Labs Limited"
        case .orthoAccelTechnologies:
            return "OrthoAccel Technologies"
        case .waterGuru:
            return "WaterGuru, Inc."
        case .benningElektrotechnik:
            return "Benning Elektrotechnik und Elektronik GmbH & Co. KG"
        case .dellComputer:
            return "Dell Computer Corporation"
        case .kopinCorporation:
            return "Kopin Corporation"
        case .tecBakery:
            return "TecBakery GmbH"
        case .backboneLabs:
            return "Backbone Labs, Inc."
        case .delsey:
            return "DELSEY SA"
        case .chargifi:
            return "Chargifi Limited"
        case .trainesense:
            return "Trainesense Ltd."
        case .unifySoftwareAndSolutions:
            return "Unify Software and Solutions GmbH & Co. KG"
        case .husqvarna:
            return "Husqvarna AB"
        case .focusFleetFuelMangement:
            return "Focus fleet and fuel management inc"
        case .smallLoop:
            return "SmallLoop, LLC"
        case .prolonInc:
            return "Prolon Inc."
        case .bdMedical:
            return "BD Medical"
        case .iMicroMed:
            return "iMicroMed Incorporated"
        case .ticto:
            return "Ticto N.V."
        case .meshtech:
            return "Meshtech AS"
        case .memCachier:
            return "MemCachier Inc."
        case .danfoss:
            return "Danfoss A/S"
        case .snapStyk:
            return "SnapStyk Inc."
        case .amwayCorporation:
            return "Amway Corporation"
        case .silkLabs:
            return "Silk Labs, Inc."
        case .pillsyInc:
            return "Pillsy Inc."
        case .hatchBaby:
            return "Hatch Baby, Inc."
        case .blocksWearables:
            return "Blocks Wearables Ltd."
        case .draysonTechnologies:
            return "Drayson Technologies (Europe) Limited"
        case .eBestIot:
            return "eBest IOT Inc."
        case .helvar:
            return "Helvar Ltd"
        case .radienceTechnologies:
            return "Radiance Technologies"
        case .nuheara:
            return "Nuheara Limited"
        case .appside:
            return "Appside co., ltd."
        case .deLaval:
            return "DeLaval"
        case .colierCorporation:
            return "Coiler Corporation"
        case .thermomedics:
            return "Thermomedics, Inc."
        case .tentacleSync:
            return "Tentacle Sync GmbH"
        case .valencell:
            return "Valencell, Inc."
        case .iProtoXi:
            return "iProtoXi Oy"
        case .secomCo:
            return "SECOM CO., LTD."
        case .tuckerInternational:
            return "Tucker International LLC"
        case .metanateLimited:
            return "Metanate Limited"
        case .kobainCanada:
            return "Kobian Canada Inc."
        case .netgear:
            return "NETGEAR, Inc."
        case .fabtronics:
            return "Fabtronics Australia Pty Ltd"
        case .grandCentrix:
            return "Grand Centrix GmbH"
        case .oneUpUsa:
            return "1UP USA.com llc"
        case .shimano:
            return "SHIMANO INC."
        case .nainInc:
            return "Nain Inc."
        case .lifeStyleLock:
            return "LifeStyle Lock, LLC"
        case .vegaGrieshaber:
            return "VEGA Grieshaber KG"
        case .xtravaInc:
            return "Xtrava Inc."
        case .ttsTooltechnicSystems:
            return "TTS Tooltechnic Systems AG & Co. KG"
        case .teenageEngineering:
            return "Teenage Engineering AB"
        case .tunstallNordic:
            return "Tunstall Nordic AB"
        case .svepDesignCenter:
            return "Svep Design Center AB"
        case .greenPeakTechnologies:
            return "GreenPeak Technologies BV"
        case .sphinxElectronics:
            return "Sphinx Electronics GmbH & Co KG"
        case .atomation:
            return "Atomation"
        case .nemikConsulting:
            return "Nemik Consulting Inc"
        case .rfInnovation:
            return "RF INNOVATION"
        case .miniSolution:
            return "Mini Solution Co., Ltd."
        case .lumenetix:
            return "Lumenetix, Inc"
        case .two048450Ontario:
            return "2048450 Ontario Inc"
        case .spaceek:
            return "SPACEEK LTD"
        case .deltaT:
            return "Delta T Corporation"
        case .bostonScientific:
            return "Boston Scientific Corporation"
        case .nuvizInc:
            return "Nuviz, Inc."
        case .realTimeAutomation:
            return "Real Time Automation, Inc."
        case .kolibree:
            return "Kolibree"
        case .vhfElektronik:
            return "vhf elektronik GmbH"
        case .bonsaiSystems:
            return "Bonsai Systems GmbH"
        case .fathomSystems:
            return "Fathom Systems Inc."
        case .bellmanSymfon:
            return "Bellman & Symfon"
        case .internationalForteGroup:
            return "International Forte Group LLC"
        case .cycleLabsSolutions:
            return "CycleLabs Solutions inc."
        case .codenex:
            return "Codenex Oy"
        case .kynesim:
            return "Kynesim Ltd"
        case .palago:
            return "Palago AB"
        case .insigmaInc:
            return "INSIGMA INC."
        case .pmdSolutions:
            return "PMD Solutions"
        case .qingdaoRealtimeTechnology:
            return "Qingdao Realtime Technology Co., Ltd."
        case .begaGantenbrinkLeuchten:
            return "BEGA Gantenbrink-Leuchten KG"
        case .pamborLtd:
            return "Pambor Ltd"
        case .develcoProducts:
            return "Develco Products A/S"
        case .iDesign:
            return "iDesign s.r.l."
        case .tiVo:
            return "TiVo Corp"
        case .controlJ:
            return "Control-J Pty Ltd"
        case .stealcase:
            return "Steelcase, Inc."
        case .iApartment:
            return "iApartment co., ltd."
        case .icomInc:
            return "Icom inc."
        case .oxstrenWearableTechnologies:
            return "Oxstren Wearable Technologies Private Limited"
        case .blueSparkTechnologies:
            return "Blue Spark Technologies"
        case .farSiteCommunications:
            return "FarSite Communications Limited"
        case .mywerkSystem:
            return "mywerk system GmbH"
        case .sinosunTechnology:
            return "Sinosun Technology Co., Ltd."
        case .miyoshiElectronics:
            return "MIYOSHI ELECTRONICS CORPORATION"
        case .powermat:
            return "POWERMAT LTD"
        case .occly:
            return "Occly LLC"
        case .ourHubDev:
            return "OurHub Dev IvS"
        case .proMark:
            return "Pro-Mark, Inc."
        case .dynometrics:
            return "Dynometrics Inc."
        case .quintrax:
            return "Quintrax Limited"
        case .posTuningUdoVosshenrich:
            return "POS Tuning Udo Vosshenrich GmbH &. Co. KG"
        case .multiCareSystems:
            return "Multi Care Systems B.V."
        case .revolTechnologies:
            return "Revol Technologies Inc"
        case .skidata:
            return "SKIDATA AG"
        case .devTecnologiaIndustria:
            return "DEV TECNOLOGIA INDUSTRIA, COMERCIO E MANUTENCAO DE EQUIPAMENTOS LTDA. - ME"
        case .centricaConnectedHome:
            return "Centrica Connected Home"
        case .automotiveDataSolutions:
            return "Automotive Data Solutions Inc"
        case .igarashiEngineering:
            return "Igarashi Engineering"
        case .taelek:
            return "Taelek Oy"
        case .cpElectronics:
            return "CP Electronics Limited"
        case .vectronix:
            return "Vectronix AG"
        case .sLabs:
            return "S-Labs Sp. z o.o."
        case .companionMedical:
            return "Companion Medical, Inc."
        case .blueKitchen:
            return "BlueKitchen GmbH"
        case .matting:
            return "Matting AB"
        case .sorexWirelessSolutions:
            return "SOREX - Wireless Solutions GmbH"
        case .adcTechnology:
            return "ADC Technology, Inc."
        case .lynxemi:
            return "Lynxemi Pte Ltd"
        case .sennheiserElectronic:
            return "SENNHEISER electronic GmbH & Co. KG"
        case .lmtMercerGroup:
            return "LMT Mercer Group, Inc"
        case .polymorphicLabs:
            return "Polymorphic Labs LLC"
        case .cochlearLimited:
            return "Cochlear Limited"
        case .meterGroup:
            return "METER Group, Inc. USA"
        case .ruuviInnovations:
            return "Ruuvi Innovations Ltd."
        case .situne:
            return "Situne AS"
        case .nVisti:
            return "nVisti, LLC"
        case .dyOcean:
            return "DyOcean"
        case .uhlmannZacher:
            return "Uhlmann & Zacher GmbH"
        case .andNotXor:
            return "AND!XOR LLC"
        case .tictote:
            return "tictote AB"
        case .vypin:
            return "Vypin, LLC"
        case .pniSensorCorporation:
            return "PNI Sensor Corporation"
        case .ovrEngineered:
            return "ovrEngineered, LLC"
        case .gtTronics:
            return "GT-tronics HK Ltd"
        case .herbertWaldmann:
            return "Herbert Waldmann GmbH & Co. KG"
        case .guangzhouFiiOElectronics:
            return "Guangzhou FiiO Electronics Technology Co.,Ltd"
        case .vinetech:
            return "Vinetech Co., Ltd"
        case .dallasLogic:
            return "Dallas Logic Corporation"
        case .bioTex:
            return "BioTex, Inc."
        case .discoverySoundTechnology:
            return "DISCOVERY SOUND TECHNOLOGY, LLC"
        case .linkio:
            return "LINKIO SAS"
        case .harbortonics:
            return "Harbortronics, Inc."
        case .undagrid:
            return "Undagrid B.V."
        case .shureInc:
            return "Shure Inc"
        case .ermElectronicSystems:
            return "ERM Electronic Systems LTD"
        case .biorowerHandelsagentur:
            return "BIOROWER Handelsagentur GmbH"
        case .webaSportMed:
            return "Weba Sport und Med. Artikel GmbH"
        case .kartographersTechnologies:
            return "Kartographers Technologies Pvt. Ltd."
        case .theShadowOnTheMoon:
            return "The Shadow on the Moon"
        case .mobike:
            return "mobike (Hong Kong) Limited"
        case .inuheatGroup:
            return "Inuheat Group AB"
        case .swiftronix:
            return "Swiftronix AB"
        case .diagnopticsTechnologies:
            return "Diagnoptics Technologies"
        case .analogDevices:
            return "Analog Devices, Inc."
        case .soraaInc:
            return "Soraa Inc."
        case .csrBuildingProducts:
            return "CSR Building Products Limited"
        case .crestronElectronics:
            return "Crestron Electronics, Inc."
        case .neatebox:
            return "Neatebox Ltd"
        case .draegerwerk:
            return "Draegerwerk AG & Co. KGaA"
        case .albynMedical:
            return "AlbynMedical"
        case .averosFzco:
            return "Averos FZCO"
        case .vitInitiative:
            return "VIT Initiative, LLC"
        case .statsportsInternational:
            return "Statsports International"
        case .sospitas:
            return "Sospitas, s.r.o."
        case .dmetProducts:
            return "Dmet Products Corp."
        case .mantracourtElectronics:
            return "Mantracourt Electronics Limited"
        case .teAMHutchins:
            return "TeAM Hutchins AB"
        case .seibertWilliamsGlass:
            return "Seibert Williams Glass, LLC"
        case .insta:
            return "Insta GmbH"
        case .svantek:
            return "Svantek Sp. z o.o."
        case .shanghaiFlycoElectricalAppliance:
            return "Shanghai Flyco Electrical Appliance Co., Ltd."
        case .thornwaveLabs:
            return "Thornwave Labs Inc"
        case .steinerOptik:
            return "Steiner-Optik GmbH"
        case .novoNordisk:
            return "Novo Nordisk A/S"
        case .enfluxInc:
            return "Enflux Inc."
        case .safetechProducts:
            return "Safetech Products LLC"
        case .goooled:
            return "GOOOLED S.R.L."
        case .domSicherheitstechnik:
            return "DOM Sicherheitstechnik GmbH & Co. KG"
        case .olympus:
            return "Olympus Corporation"
        case .ktsGermany:
            return "KTS GmbH"
        case .anloqTechnologies:
            return "Anloq Technologies Inc."
        case .queercon:
            return "Queercon, Inc"
        case .fifthElement:
            return "5th Element Ltd"
        case .gooeeLimited:
            return "Gooee Limited"
        case .lugloc:
            return "LUGLOC LLC"
        case .blincam:
            return "Blincam, Inc."
        case .fujiFilm:
            return "FUJIFILM Corporation"
        case .randMcNally:
            return "RandMcNally"
        case .franceschiMarina:
            return "Franceschi Marina snc"
        case .engineeredAudio:
            return "Engineered Audio, LLC."
        case .iottive:
            return "IOTTIVE (OPC) PRIVATE LIMITED"
        case .fourModTechnology:
            return "4MOD Technology"
        case .lutronElectronics:
            return "Lutron Electronics Co., Inc."
        case .emerson:
            return "Emerson"
        case .guardtec:
            return "Guardtec, Inc."
        case .reactecLimited:
            return "REACTEC LIMITED"
        case .ellieGrid:
            return "EllieGrid"
        case .underArmour:
            return "Under Armour"
        case .woodenshark:
            return "Woodenshark"
        case .avack:
            return "Avack Oy"
        case .smartSolutionTechnology:
            return "Smart Solution Technology, Inc."
        case .rehabronics:
            return "REHABTRONICS INC."
        case .stabiloInternational:
            return "STABILO International"
        case .buschJaegerElektro:
            return "Busch Jaeger Elektro GmbH"
        case .pacificBioscienceLaboratories:
            return "Pacific Bioscience Laboratories, Inc"
        case .birdHomeAutomation:
            return "Bird Home Automation GmbH"
        case .motorolaSolutions:
            return "Motorola Solutions"
        case .r9technology:
            return "R9 Technology, Inc."
        case .auxivia:
            return "Auxivia"
        case .daisyWorks:
            return "DaisyWorks, Inc"
        case .kosiLimited:
            return "Kosi Limited"
        case .theben:
            return "Theben AG"
        case .inDreamerTechsol:
            return "InDreamer Techsol Private Limited"
        case .cerevastMedical:
            return "Cerevast Medical"
        case .zanCompute:
            return "ZanCompute Inc."
        case .pirelliTyre:
            return "Pirelli Tyre S.P.A."
        case .mcLearLimited:
            return "McLear Limited"
        case .shenzhenHuidingTechnology:
            return "Shenzhen Huiding Technology Co.,Ltd."
        case .convergenceSystems:
            return "Convergence Systems Limited"
        case .interactio:
            return "Interactio"
        case .androtec:
            return "Androtec GmbH"
        case .benchmarkDrives:
            return "Benchmark Drives GmbH & Co. KG"
        case .swingLync:
            return "SwingLync L. L. C."
        case .tapkey:
            return "Tapkey GmbH"
        case .woosimSystems:
            return "Woosim Systems Inc."
        case .microsemiCorporation:
            return "Microsemi Corporation"
        case .wiliot:
            return "Wiliot LTD."
        case .polarisInd:
            return "Polaris IND"
        case .specifiKali:
            return "Specifi-Kali LLC"
        case .locoroll:
            return "Locoroll, Inc"
        case .phyplus:
            return "PHYPLUS Inc"
        case .inplayTechnologies:
            return "Inplay Technologies LLC"
        case .hager:
            return "Hager"
        case .yellowcog:
            return "Yellowcog"
        case .axesSystems:
            return "Axes System sp. z o. o."
        case .myLifter:
            return "myLIFTER Inc."
        case .shakeOn:
            return "Shake-on B.V."
        case .vibrissa:
            return "Vibrissa Inc."
        case .osramGermany:
            return "OSRAM GmbH"
        case .trSystems:
            return "TRSystems GmbH"
        case .yichipMicroelectronics:
            return "Yichip Microelectronics (Hangzhou) Co.,Ltd."
        case .foundationEngineering:
            return "Foundation Engineering LLC"
        case .uniElectronics:
            return "UNI-ELECTRONICS, INC."
        case .brookfieldEquinox:
            return "Brookfield Equinox LLC"
        case .soprod:
            return "Soprod SA"
        case .nine974091Canada:
            return "9974091 Canada Inc."
        case .fibroGermany:
            return "FIBRO GmbH"
        case .rbControls:
            return "RB Controls Co., Ltd."
        case .footmarks:
            return "Footmarks"
        case .amcore:
            return "Amcore AB"
        case .mamorioInc:
            return "MAMORIO.inc"
        case .tytoLife:
            return "Tyto Life LLC"
        case .leicaCamera:
            return "Leica Camera AG"
        case .angeeTechnologies:
            return "Angee Technologies Ltd."
        case .edps:
            return "EDPS"
        case .offLineCo:
            return "OFF Line Co., Ltd."
        case .detectBlueLimited:
            return "Detect Blue Limited"
        case .setecPty:
            return "Setec Pty Ltd"
        case .targetCorporation:
            return "Target Corporation"
        case .iaiCorporation:
            return "IAI Corporation"
        case .nsTechInc:
            return "NS Tech, Inc."
        case .mtgCo:
            return "MTG Co., Ltd."
        case .hangzhouiMagicTechnology:
            return "Hangzhou iMagic Technology Co., Ltd"
        case .hongKongNanoIcTechnologies:
            return "HONGKONG NANO IC TECHNOLOGIES CO., LIMITED"
        case .honeywellInternational:
            return "Honeywell International Inc."
        case .albrechtJung:
            return "Albrecht JUNG"
        case .luneraLighting:
            return "Lunera Lighting Inc."
        case .lumenUAB:
            return "Lumen UAB"
        case .keynesControls:
            return "Keynes Controls Ltd"
        case .novartis:
            return "Novartis AG"
        case .geosatis:
            return "Geosatis SA"
        case .exfoInc:
            return "EXFO, Inc."
        case .ledvance:
            return "LEDVANCE GmbH"
        case .centerIdCorp:
            return "Center ID Corp."
        case .adoleneInc:
            return "Adolene, Inc."
        case .dmHoldings:
            return "D+M Holdings Inc."
        case .crescoWireless:
            return "CRESCO Wireless, Inc."
        case .nuraOperations:
            return "Nura Operations Pty Ltd"
        case .frontiergadget:
            return "Frontiergadget, Inc."
        case .smartCompnentTechnologies:
            return "Smart Component Technologies Limited"
        case .ztrControlSystems:
            return "ZTR Control Systems LLC"
        case .metaLogicsCorporation:
            return "MetaLogics Corporation"
        case .medelaAg:
            return "Medela AG"
        case .oppleLightingCo:
            return "OPPLE Lighting Co., Ltd"
        case .savitechCorp:
            return "Savitech Corp."
        case .prodigy:
            return "prodigy"
        case .screenovateTechnologies:
            return "Screenovate Technologies Ltd"
        case .tesa:
            return "TESA SA"
        case .clim8Limited:
            return "CLIM8 LIMITED"
        case .silergyCorp:
            return "Silergy Corp"
        case .silverPlusInc:
            return "SilverPlus, Inc"
        case .sharknet:
            return "Sharknet srl"
        case .mistSystems:
            return "Mist Systems, Inc."
        case .miwaLock:
            return "MIWA LOCK CO.,Ltd"
        case .orthoSensor:
            return "OrthoSensor, Inc."
        case .candyHooverGroup:
            return "Candy Hoover Group s.r.l"
        case .apexarTechnologies:
            return "Apexar Technologies S.A."
        case .logicdata:
            return "LOGICDATA d.o.o."
        case .knickElektronischeMessgerte:
            return "Knick Elektronische Messgerte GmbH & Co.KG"
        case .smartTechnologiesInvestment:
            return "Smart Technologies and Investment Limited"
        case .linoughInc:
            return "Linough Inc"
        case .advancedElectronicDesigns:
            return "Advanced Electronic Designs, Inc."

            

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
