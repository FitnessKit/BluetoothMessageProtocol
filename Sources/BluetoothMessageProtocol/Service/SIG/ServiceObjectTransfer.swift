//
//  ServiceObjectTransfer.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 9/2/17.
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

/// BLE Object Transfer Service
///
/// This service provides management and control features supporting bulk data
/// transfers which occur via a separate L2CAP connection oriented channel.
/// The Client is enabled to create and delete objects and to execute an action
/// using the currently selected object. The selected object can be written, updated
/// or read via an Object Transfer Channel opened by the Client. The generation of
/// a checksum covering a part or the whole of the object contents is included as an
/// optional feature. This service provides a general method for a Client to select
/// and initiate the transfer of any type of object.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceObjectTransfer: Service {

    /// Service Name
    public static var name: String {
        return "Object Transfer"
    }

    /// Service UUID
    public static var uuidString: String {
        return "1825"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "org.bluetooth.service.object_transfer"
    }

    /// Creates Object Transfer Service
    public init() {
        super.init(name: ServiceObjectTransfer.name,
                   uuidString: ServiceObjectTransfer.uuidString,
                   uniformIdentifier: ServiceObjectTransfer.uniformIdentifier
        )
    }
}
