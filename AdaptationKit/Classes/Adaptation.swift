//
//  Adaptation.swift
//  AdaptationKit
//
//  Created by CatchZeng on 2019/1/4.
//

import Foundation

public struct Calculator {
    public static func adapt(_ origin: Double) -> Double {
        let base = Double(Screen.i8.size.width)
        let width = Double(min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
        return origin * (width / base)
    }
}

public protocol Adaptable {
    func adapt() -> Self
}

extension Double: Adaptable {
    public func adapt() -> Double {
        return Calculator.adapt(self)
    }
}

extension BinaryFloatingPoint {
    public func adapt<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adapt())
    }
}

extension BinaryInteger {
    public func adapt<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adapt())
    }
}
