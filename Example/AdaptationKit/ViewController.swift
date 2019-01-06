//
//  ViewController.swift
//  AdaptationKit
//
//  Created by catchzeng on 01/04/2019.
//  Copyright (c) 2019 catchzeng. All rights reserved.
//

import UIKit
import AdaptationKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        label.text = "I am " +
//            "unkown screen"
//                .i4("iPhone 4 like screen.")
//                .i8("iPhone 8 like screen.")
//                .i8P("iPhone 8Plus like screen.")
//                .iX("iPhone X like screen.")
//                .iXR("iPhone XR like screen.")
//                .iXMAX("iPhone XMAX like screen.")
//                .p97("iPad 9.7 like screen.")
//                .p105("iPad 10.5 like screen.")
//                .p11("iPad 11 like screen.")
//                .p129("iPad 12.9 like screen.")
        
        /*
         * default numberOfLines = 0
         * iPad numberOfLines = 1
         * iPhone(In addition to iPhone XS Max) numberOfLines = 2
         * iPhone XS Max numberOfLines = 3
         */
//        let numberOfLines = 0.pad(1).phone(2).iXMAX(3)
//        label.numberOfLines = numberOfLines
        
        /*
         * default(iPhone 8) size = 12.0
         * iPhone 4 size = 10.24
         * iPhone X MAX  size = 13.248
         * ...
         */
//        label.font = UIFont(name: label.font.fontName, size: 12.0.adaptFont())
        
        /*
         * default(iPhone 8) testInch = 12.0
         * iPhone 4 testInch = 10.24
         * iPhone X MAX  testInch = 13.248
         * ...
         */
//        let testInch = 12.0.adaptInch()
//        print(testInch)
        
//        label.adaptFont = true
        
//        let inchRule = AdaptationRule(baseScreen: .i8)
//        inchRule.set(screen: .i4, ratio: 0.5)
//        inchRule.set(screen: .iXMAX, ratio: 1.3)
//        AdaptationKit.set(inchRule: inchRule)
//
//        let fontRule = AdaptationRule(baseScreen: .i8)
//        fontRule.set(screen: .i4, ratio: 0.6)
//        fontRule.set(screen: .iXMAX, ratio: 1.5)
//        AdaptationKit.set(inchRule: fontRule)
    }
}

