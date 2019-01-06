//
//  Adaptation.swift
//  AdaptationKit
//
//  Created by CatchZeng on 2019/1/4.
//

import Foundation

public class AdaptationRule {
    internal var baseScreen: Screen
    internal var map = [Screen : Double]()
    
    public static let `default` = AdaptationRule(baseScreen: .i8)
    
    public init(baseScreen: Screen) {
        self.baseScreen = baseScreen
    }
    
    @discardableResult
    public func set(screen: Screen, ratio: Double) -> AdaptationRule {
        map[screen] = ratio
        return self
    }
}

public struct AdaptationKit {
    private static var inchRule = AdaptationRule.default
    private static var fontRule = AdaptationRule.default
    
    public static func set(inchRule: AdaptationRule) {
        self.inchRule = inchRule
    }
    
    public static func set(fontRule: AdaptationRule) {
        self.fontRule = fontRule
    }
    
    internal static func adaptInch(_ origin: Double) -> Double {
        return adapt(origin, rule: inchRule)
    }
    
    internal static func adaptFont(_ origin: Double) -> Double {
        return adapt(origin, rule: fontRule)
    }
    
    internal static func adaptInch(_ origin: CGFloat) -> CGFloat {
        return origin.adaptInch()
    }
    
    internal static func adaptFont(_ origin: CGFloat) -> CGFloat {
        return origin.adaptFont()
    }
    
    private static func adapt(_ origin: Double, rule: AdaptationRule) -> Double {
        if let ratio = rule.map[Screen.current] {
            return origin * ratio
        } else {
            let base = Double(rule.baseScreen.size.width)
            let width = Double(min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
            return origin * (width / base)
        }
    }
}

public protocol Adaptable {
    func adaptInch() -> Self
    func adaptFont() -> Self
}

extension Double: Adaptable {
    public func adaptInch() -> Double {
        return AdaptationKit.adaptInch(self)
    }
    
    public func adaptFont() -> Double {
        return AdaptationKit.adaptFont(self)
    }
}

extension BinaryFloatingPoint {
    public func adaptInch<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptInch())
    }
    
    public func adaptFont<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptFont())
    }
}

extension BinaryInteger {
    public func adaptInch<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptInch())
    }
    
    public func adaptFont<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptFont())
    }
}

// MARK: operator

postfix operator ~
public postfix func ~ (value: CGFloat) -> CGFloat {
    return value.adaptInch()
}

public postfix func ~ (value: Double) -> Double {
    return value.adaptInch()
}

public postfix func ~ (value: Float) -> Float {
    return value.adaptInch()
}

public postfix func ~ (value: Int) -> Int {
    return value.adaptInch()
}

public postfix func ~ (value: UInt) -> UInt {
    return value.adaptInch()
}

postfix operator ≈
public postfix func ≈ (value: CGFloat) -> CGFloat {
    return value.adaptFont()
}

public postfix func ≈ (value: Double) -> Double {
    return value.adaptFont()
}

public postfix func ≈ (value: Float) -> Float {
    return value.adaptFont()
}

public postfix func ≈ (value: Int) -> Int {
    return value.adaptFont()
}

public postfix func ≈ (value: UInt) -> UInt {
    return value.adaptFont()
}


