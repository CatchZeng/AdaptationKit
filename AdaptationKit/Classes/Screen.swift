//
//  Screen.swift
//  AdaptationKit
//
//  Created by CatchZeng on 2019/1/4.
//

import Foundation
import UIKit

/// Screen
///
/// - i4: iPhone 4s
/// - iSE: iPhone SE
/// - i8: iPhone 8
/// - i8P: iPhone 8 Plus
/// - iX: iPhone X
/// - iXR: iPhone XR
/// - iXMAX: iPhone XS Max
/// - p97: iPad 9.7 inch
/// - p105: iPad 10.5 inch
/// - p11: iPad 11 inch
/// - p129: iPad 12.9 inch
public enum Screen {
    case unknown
    case i4
    case iSE
    case i8
    case i8P
    case iX
    case iXR
    case iXMAX
    case p97
    case p105
    case p11
    case p129
}

extension Screen {
    public static let current: Screen = {
        let width = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        let height = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        let scale = UIScreen.main.scale
        
        let nativeSize = CGSize(width: width*scale, height: height*scale)
        
        switch nativeSize {
        case Screen.i4.nativeSize:
            return .i4
        case Screen.iSE.nativeSize:
            return .iSE
        case Screen.i8.nativeSize:
            return .i8
        case Screen.i8P.nativeSize:
            return .i8P
        case Screen.iX.nativeSize:
            return .iX
        case Screen.iXR.nativeSize:
            return .iXR
        case Screen.iXMAX.nativeSize:
            return .iXMAX
        case Screen.p97.nativeSize:
            return .p97
        case Screen.p105.nativeSize:
            return .p105
        case Screen.p11.nativeSize:
            return .p11
        case Screen.p129.nativeSize:
            return .p129
        default :
            return .unknown
        }
    }()
}

// MARK: - @see https://developer.apple.com/library/archive/documentation/DeviceInformation/Reference/iOSDeviceCompatibility/Displays/Displays.html#//apple_ref/doc/uid/TP40013599-CH108-SW1
extension Screen {
    var size: CGSize {
        switch self {
        case .unknown:
            return CGSize(width: 320, height: 480)
        case .i4:
            return CGSize(width: 320, height: 480)
        case .iSE:
            return CGSize(width: 320, height: 568)
        case .i8:
            return CGSize(width: 375, height: 667)
        case .i8P:
            return CGSize(width: 414, height: 736)
        case .iX:
            return CGSize(width: 375, height: 812)
        case .iXR:
            return CGSize(width: 414, height: 896)
        case .iXMAX:
            return CGSize(width: 414, height: 896)
        case .p97:
            return CGSize(width: 768, height: 1024)
        case .p105:
            return CGSize(width: 834, height: 1112)
        case .p11:
            return CGSize(width: 834, height: 1194)
        case .p129:
            return CGSize(width: 1024, height: 1366)
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .unknown:
            return 2
        case .i4:
            return 2
        case .iSE:
            return 2
        case .i8:
            return 2
        case .i8P:
            return 3
        case .iX:
            return 3
        case .iXR:
            return 2
        case .iXMAX:
            return 3
        case .p97:
            return 2
        case .p105:
            return 2
        case .p11:
            return 2
        case .p129:
            return 2
        }
    }
    
    var nativeSize: CGSize {
        return CGSize(width: size.width*scale, height: size.height*scale)
    }
}
