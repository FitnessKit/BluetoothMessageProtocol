//
//  Resolutionable.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 6/3/18.
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

/// Struct to Hold Resolution Scale and Offset
internal struct Resolution {

    /// Resolution of 1
    static var one = Resolution(scale: 1, offset: 0)

    /// Resoluton of 2 (0.5)
    static var two = Resolution(scale: 2, offset: 0)

    /// 1 / 10 Resolution (0.1)
    static var oneTenth = Resolution(scale: 10, offset: 0)

    /// 1 / 100 Resolution (0.01)
    static var oneHundredth = Resolution(scale: 100, offset: 0)

    /// 1 / 1000 Resolution (0.001)
    static var oneThousandth = Resolution(scale: 1000, offset: 0)

    /// 1 / 5000 Resolution (0.005)
    static var oneFiveThousandth = Resolution(scale: 5000, offset: 0)

    /// 1 / 10000 Resolution (0.0001)
    static var oneTenThousandth = Resolution(scale: 10000, offset: 0)

    /// Scale
    var scale: Double

    // Offset
    var offset: Double
}

internal enum ResolutionDirection {
    /// Adds Resolution
    case adding
    /// Removes Resolution
    case removing
}

protocol Resolutionable {
    
    /// Apply Resolution with Direction
    ///
    /// - Parameters:
    ///   - direction: Type of Resolution Direction
    ///   - resolution: Resolution
    /// - Returns: Number with Resolution applied
    func resolution(_ direction: ResolutionDirection, resolution: Resolution) -> Double

}

extension Double: Resolutionable {

    /// Apply Resolution with Direction
    ///
    /// - Parameters:
    ///   - direction: Type of Resolution Direction
    ///   - resolution: Resolution
    /// - Returns: Number with Resolution applied
    func resolution(_ direction: ResolutionDirection, resolution: Resolution) -> Double {
        switch direction {
        case .adding:
            return (Double(self) + resolution.offset) * resolution.scale
        case .removing:
            return (Double(self) * (1 / resolution.scale)) - resolution.offset
        }
    }
}

extension UInt8: Resolutionable {

    /// Apply Resolution with Direction
    ///
    /// - Parameters:
    ///   - direction: Type of Resolution Direction
    ///   - resolution: Resolution
    /// - Returns: Number with Resolution applied
    func resolution(_ direction: ResolutionDirection, resolution: Resolution) -> Double {
        switch direction {
        case .adding:
            return (Double(self) + resolution.offset) * resolution.scale
        case .removing:
            return (Double(self) * (1 / resolution.scale)) - resolution.offset
        }
    }
}

extension UInt16: Resolutionable {

    /// Apply Resolution with Direction
    ///
    /// - Parameters:
    ///   - direction: Type of Resolution Direction
    ///   - resolution: Resolution
    /// - Returns: Number with Resolution applied
    func resolution(_ direction: ResolutionDirection, resolution: Resolution) -> Double {
        switch direction {
        case .adding:
            return (Double(self) + resolution.offset) * resolution.scale
        case .removing:
            return (Double(self) * (1 / resolution.scale)) - resolution.offset
        }
    }
}

extension Int16: Resolutionable {

    /// Apply Resolution with Direction
    ///
    /// - Parameters:
    ///   - direction: Type of Resolution Direction
    ///   - resolution: Resolution
    /// - Returns: Number with Resolution applied
    func resolution(_ direction: ResolutionDirection, resolution: Resolution) -> Double {
        switch direction {
        case .adding:
            return (Double(self) + resolution.offset) * resolution.scale
        case .removing:
            return (Double(self) * (1 / resolution.scale)) - resolution.offset
        }
    }
}

extension UInt32: Resolutionable {

    /// Apply Resolution with Direction
    ///
    /// - Parameters:
    ///   - direction: Type of Resolution Direction
    ///   - resolution: Resolution
    /// - Returns: Number with Resolution applied
    func resolution(_ direction: ResolutionDirection, resolution: Resolution) -> Double {
        switch direction {
        case .adding:
            return (Double(self) + resolution.offset) * resolution.scale
        case .removing:
            return (Double(self) * (1 / resolution.scale)) - resolution.offset
        }
    }
}
