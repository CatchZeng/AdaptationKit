//
//  Adaptation.swift
//  AdaptationKit
//
//  Created by CatchZeng on 2019/1/4.
//

import Foundation

public class AdaptationKitConfig {
    internal var baseScreen: Screen
    internal var map = [Screen : Double]()
    
    public static let `default` = AdaptationKitConfig(baseScreen: .i8)
    
    public init(baseScreen: Screen) {
        self.baseScreen = baseScreen
    }
    
    @discardableResult
    public func set(screen: Screen, ratio: Double) -> AdaptationKitConfig {
        map[screen] = ratio
        return self
    }
}

public struct AdaptationKit {
    private static var inchConfig = AdaptationKitConfig.default
    private static var fontConfig = AdaptationKitConfig.default
    
    public static func set(inchConfig: AdaptationKitConfig) {
        self.inchConfig = inchConfig
    }
    
    public static func set(fontConfig: AdaptationKitConfig) {
        self.fontConfig = fontConfig
    }
    
    internal static func adaptInch(_ origin: Double) -> Double {
        return adapt(origin, config: inchConfig)
    }
    
    internal static func adaptFont(_ origin: Double) -> Double {
        return adapt(origin, config: fontConfig)
    }
    
    internal static func adaptInch(_ origin: CGFloat) -> CGFloat {
        return origin.adapt()
    }
    
    internal static func adaptFont(_ origin: CGFloat) -> CGFloat {
        return origin.adaptFont()
    }
    
    private static func adapt(_ origin: Double, config: AdaptationKitConfig) -> Double {
        if let ratio = config.map[Screen.current] {
            return origin * ratio
        } else {
            let base = Double(config.baseScreen.size.width)
            let width = Double(min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
            return origin * (width / base)
        }
    }
}

public protocol Adaptable {
    func adapt() -> Self
}

extension Double: Adaptable {
    public func adapt() -> Double {
        return AdaptationKit.adaptInch(self)
    }
    
    public func adaptFont() -> Double {
        return AdaptationKit.adaptFont(self)
    }
}

extension BinaryFloatingPoint {
    public func adapt<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adapt())
    }
    
    public func adaptFont<T>() -> T where T : BinaryFloatingPoint {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptFont())
    }
}

extension BinaryInteger {
    public func adapt<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adapt())
    }
    
    public func adaptFont<T>() -> T where T : BinaryInteger {
        let temp = Double("\(self)") ?? 0
        return T(temp.adaptFont())
    }
}

// MARK: operator

postfix operator ~
public postfix func ~ (value: CGFloat) -> CGFloat {
    return value.adapt()
}

public postfix func ~ (value: Double) -> Double {
    return value.adapt()
}

public postfix func ~ (value: Float) -> Float {
    return value.adapt()
}

public postfix func ~ (value: Int) -> Int {
    return value.adapt()
}

public postfix func ~ (value: UInt) -> UInt {
    return value.adapt()
}


