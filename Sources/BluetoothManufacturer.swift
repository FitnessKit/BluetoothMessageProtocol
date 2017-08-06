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


            
        case .reserved:
            return "Unknown"
        }
        
    }
    
}
