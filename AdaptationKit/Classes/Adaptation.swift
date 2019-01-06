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
    private static var config = AdaptationKitConfig.default
    
    public static func set(config: AdaptationKitConfig) {
        self.config = config
    }
    
    internal static func adapt(_ origin: Double) -> Double {
        if let ratio = config.map[Screen.current] {
            return origin * ratio
        } else {
            let base = Double(config.baseScreen.size.width)
            let width = Double(min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
            return origin * (width / base)
        }
    }
    
    internal static func adapt(_ origin: CGFloat) -> CGFloat {
        return origin.adapt()
    }
}

public protocol Adaptable {
    func adapt() -> Self
}

extension Double: Adaptable {
    public func adapt() -> Double {
        return AdaptationKit.adapt(self)
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


