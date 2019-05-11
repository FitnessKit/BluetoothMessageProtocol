//
//  GymConnectTests.swift
//  BluetoothMessageProtocolTests
//
//  Created by Kevin Hoogheem on 10/19/18.
//

import XCTest
@testable import BluetoothMessageProtocol

class GymConnectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDecodeCharacteristicGymConnectEquipmentState() {
    
        let data = Data([10])
        
        let state = CharacteristicGymConnectEquipmentState.decode(with: data)

        switch state {
        case .success(let char):
            
            if char.state != .inUse {
                XCTFail()
            }
        case .failure(let error):
            XCTFail(error.localizedDescription)
        }
        
    }
    
    func testEquipmentType() {

        for idx: UInt8 in 128...143 {
            if GymConnectEquipmentType.create(idx) != .treadmill {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 146...159 {
            if GymConnectEquipmentType.create(idx) != .bike {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 160...169 {
            if GymConnectEquipmentType.create(idx) != .stepper {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 170...179 {
            if GymConnectEquipmentType.create(idx) != .elliptical {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 180...189 {
            if GymConnectEquipmentType.create(idx) != .totalBodyTrainer {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 191...199 {
            if GymConnectEquipmentType.create(idx) != .rower {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

    }

    func testEquipmentState() {

        for idx: UInt8 in 15...30 {
            if GymConnectEquipmentState.create(idx) != .inUse {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 34...50 {
            if GymConnectEquipmentState.create(idx) != .inUseWorkoutProgram {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 56...126 {
            if GymConnectEquipmentState.create(idx) != .inUse {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

        for idx: UInt8 in 129...192 {
            if GymConnectEquipmentState.create(idx) != .finished {
                print("Failed on \(idx)")
                XCTFail()
            }
        }

    }



    static var allTests = [
        ("testDecodeCharacteristicGymConnectEquipmentState", testDecodeCharacteristicGymConnectEquipmentState),
        ("testEquipmentType", testEquipmentType),
        ("testEquipmentState", testEquipmentState),

        ]

}
