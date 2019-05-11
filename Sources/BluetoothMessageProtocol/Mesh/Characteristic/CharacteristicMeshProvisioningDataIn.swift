//
//  CharacteristicMeshProvisioningDataIn.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/4/18.
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

/// BLE Mesh Provisioning Data In Characteristic
///
/// The Mesh Provisioning Data In characteristic can be written to send a Proxy
/// PDU message containing Provisioning PDU to the Provisioning Server
@available(swift 3.1)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class CharacteristicMeshProvisioningDataIn: Characteristic {

    /// Characteristic Name
    public static var name: String {
        return "Mesh Provisioning Data In"
    }

    /// Characteristic UUID
    public static var uuidString: String {
        return "2ADB"
    }

    /// Protocol Data Unit (PDU) Message
    private(set) public var pduMessage: ProxyDataUnitProvisioning

    /// Creates Characteristic
    ///
    /// - Parameter pduMessage: PDU Message
    public init(pduMessage: ProxyDataUnitProvisioning) {
        self.pduMessage = pduMessage

        super.init(name: CharacteristicMeshProvisioningDataIn.name,
                   uuidString: CharacteristicMeshProvisioningDataIn.uuidString)
    }

    /// Decodes Characteristic Data into Characteristic
    ///
    /// - Parameter data: Characteristic Data
    /// - Returns: Characteristic Result
    open override class func decode<C: CharacteristicMeshProvisioningDataIn>(with data: Data) -> Result<C, BluetoothDecodeError> {
        return.failure(BluetoothDecodeError.notSupported)
    }

    /// Deocdes the BLE Data
    ///
    /// - Parameter data: Data from sensor
    /// - Returns: Characteristic Instance
    /// - Throws: BluetoothDecodeError
    @available(*, deprecated, message: "use results based decoder instead")
    open override class func decode(data: Data) throws -> CharacteristicMeshProvisioningDataIn {
        return try decode(with: data).get()
    }

    /// Encodes the Characteristic into Data
    ///
    /// - Returns: Characteristic Data Result
    open override func encode() -> Result<Data, BluetoothEncodeError> {
        //The characteristic value is 66 octets long to accommodate the longest
        //known Proxy PDU containing Provisioning PDU.
        
        switch pduMessage.encode() {
        case .success(let pduMessage):
            var msgData = Data()
            
            msgData.append(pduMessage)
            
            return.success(msgData)

        case .failure(let error):
            return.failure(error)
        }
    }
}
