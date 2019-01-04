//
//  ScreenMatchable.swift
//  AdaptationKit
//
//  Created by CatchZeng on 2019/1/4.
//

import Foundation

public protocol ScreenMatchable {
    func phone(_ value: Self) -> Self
    func pad(_ value: Self) -> Self
    func i4(_ value: Self) -> Self
    func iSE(_ value: Self) -> Self
    func i8(_ value: Self) -> Self
    func i8P(_ value: Self) -> Self
    func iX(_ value: Self) -> Self
    func iXR(_ value: Self) -> Self
    func iXMAX(_ value: Self) -> Self
    func p97(_ value: Self) -> Self
    func p105(_ value: Self) -> Self
    func p11(_ value: Self) -> Self
    func p129(_ value: Self) -> Self
    func match(_ screen: Screen, _ value: Self) -> Self
    func match(_ screens: [Screen], _ value: Self) -> Self
}

extension ScreenMatchable {
    public func phone(_ value: Self) -> Self {
        return UI_USER_INTERFACE_IDIOM() == .phone ? value : self
    }
    
    public func pad(_ value: Self) -> Self {
        return UI_USER_INTERFACE_IDIOM() == .pad ? value : self
    }
    
    public func i4(_ value: Self) -> Self {
        return match(.i4, value)
    }
    
    public func iSE(_ value: Self) -> Self {
        return match(.iSE, value)
    }
    
    public func i8(_ value: Self) -> Self {
        return match(.i8, value)
    }
    
    public func i8P(_ value: Self) -> Self {
        return match(.i8P, value)
    }
    
    public func iX(_ value: Self) -> Self {
        return match(.iX, value)
    }
    
    public func iXR(_ value: Self) -> Self {
        return match(.iXR, value)
    }
    
    public func iXMAX(_ value: Self) -> Self {
        return match(.iXMAX, value)
    }
    
    public func p97(_ value: Self) -> Self {
        return match(.p97, value)
    }
    
    public func p105(_ value: Self) -> Self {
        return match(.p105, value)
    }
    
    public func p11(_ value: Self) -> Self {
        return match(.p11, value)
    }
    
    public func p129(_ value: Self) -> Self {
        return match(.p129, value)
    }
    
    public func match(_ screen: Screen, _ value: Self) -> Self {
        return Screen.current == screen ? value : self
    }
    
    public func match(_ screens: [Screen], _ value: Self) -> Self {
        return screens.contains(Screen.current) ? value : self
    }
}

extension Int: ScreenMatchable {}
extension Float: ScreenMatchable {}
extension Double: ScreenMatchable {}
extension String: ScreenMatchable {}
extension CGRect: ScreenMatchable {}
extension CGSize: ScreenMatchable {}
extension CGFloat: ScreenMatchable {}
extension CGPoint: ScreenMatchable {}
extension UIEdgeInsets: ScreenMatchable {}
