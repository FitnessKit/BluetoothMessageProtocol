//
//  CharacteristicBatteryLevelState.swift
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
import DataDecoder
import FitnessUnits

/// BLE Battery Level State Characteristic
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
final public class CharacteristicBatteryLevelState: Characteristic {
    
    /// Characteristic Name
    public static var name: String { "Battery Level State" }
    
    /// Characteristic UUID
    public static var uuidString: String { "2A1B" }
    
    /// Name of the Characteristic
    public var name: String { Self.name }
    
    /// Characteristic UUID String
    public var uuidString: String { Self.uuidString }
    
    /// Battery Level
    ///
    /// The current charge level of a battery. 100% represents fully charged
    /// while 0% represents fully discharged.
    ///
    private(set) public var level: Measurement<UnitPercent>
    
    /// Battery Power State
    private(set) public var state: BatteryPowerState?
    
    /// Creates Battery Level State Characteristic
    ///
    /// - Parameters:
    ///   - level: Percent Battery level
    ///   - state: Battery Power State
    public init(level: Measurement<UnitPercent>, state: BatteryPowerState?) {
        self.level = level
        self.state = state
    }
    
    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    public class func decode<C: Characteristic>(with data: Data) -> Result<C, BluetoothDecodeError> {
        var decoder = DecodeData()
        
        let percent = Double(decoder.decodeUInt8(data))
        
        let level = Measurement(value: percent, unit: UnitPercent.percent)
        
        //Might be better to check the size of data..
        //but if they are all unknown it is the same as not being there..
        var state: BatteryPowerState?
        
        let stateValue = decoder.decodeUInt8(data)
        
        if stateValue > 0 {
            state = BatteryPowerState(stateValue)
        }
        
        let char = CharacteristicBatteryLevelState(level: level,
                                                   state: state)
        return.success(char as! C)
    }
    
    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    public func encode() -> Result<Data, BluetoothEncodeError> {
        
        guard kBatteryBounds.contains(level.value) else {
            return.failure(BluetoothEncodeError.boundsError(title: "Battery level must be between",
                                                            msg: "Percent",
                                                            range: kBatteryBounds))
        }
        
        var msgData = Data()
        
        msgData.append(Data(from: Int8(level.value)))
        
        if let battState = state {
            msgData.append(battState.rawValue)
        }
        
        return.success(msgData)
    }
}

extension CharacteristicBatteryLevelState: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuidString)
        hasher.combine(level)
        hasher.combine(state)
    }
}

extension CharacteristicBatteryLevelState: Equatable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: CharacteristicBatteryLevelState, rhs: CharacteristicBatteryLevelState) -> Bool {
        return (lhs.uuidString == rhs.uuidString)
            && (lhs.level == rhs.level)
            && (lhs.state == rhs.state)
    }
}
