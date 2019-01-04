//
//  ScreenMatchableSpec.swift
//  AdaptationKit_Tests
//
//  Created by CatchZeng on 2019/1/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
import AdaptationKit

class ScreenMatchableSpec: QuickSpec {
    override func spec() {
        describe("ScreenMatchable") {
            context("Int", {
                it("Check phone & pad methods") {
                    let value = 0.phone(1).pad(2)
                    if UI_USER_INTERFACE_IDIOM() == .phone {
                        expect(value == 1).toEventually(beTruthy())
                    } else {
                        expect(value == 2).toEventually(beTruthy())
                    }
                }
                
                it("Check iPhones methods") {
                    let value = 0.i4(1).i8(2).i8P(3).iX(4).iXMAX(5).iXR(6)
                    if Screen.current == .i4 {
                        expect(value == 1).toEventually(beTruthy())
                    } else if Screen.current == .i8 {
                        expect(value == 2).toEventually(beTruthy())
                    } else if Screen.current == .i8P {
                        expect(value == 3).toEventually(beTruthy())
                    } else if Screen.current == .iX {
                        expect(value == 4).toEventually(beTruthy())
                    } else if Screen.current == .iXMAX {
                        expect(value == 5).toEventually(beTruthy())
                    } else if Screen.current == .iXR {
                        expect(value == 6).toEventually(beTruthy())
                    }
                }
                
                it("Check iPads methods") {
                    let value = 0.p97(1).p105(2).p11(3).p129(4)
                    if Screen.current == .p97 {
                        expect(value == 1).toEventually(beTruthy())
                    } else if Screen.current == .p105 {
                        expect(value == 2).toEventually(beTruthy())
                    } else if Screen.current == .p11 {
                        expect(value == 3).toEventually(beTruthy())
                    } else if Screen.current == .p129 {
                        expect(value == 4).toEventually(beTruthy())
                    }
                }
                
                it("Check macth screens method") {
                    let value = 0.match([.p97, .iX], 1)
                    if Screen.current == .p97 || Screen.current == .iX {
                        expect(value == 1).toEventually(beTruthy())
                    } else {
                        expect(value == 0).toEventually(beTruthy())
                    }
                }
            })
            
            
            context("String", {
                it("Check phone & pad methods") {
                    let value = "0".phone("1").pad("2")
                    if UI_USER_INTERFACE_IDIOM() == .phone {
                        expect(value == "1").toEventually(beTruthy())
                    } else {
                        expect(value == "2").toEventually(beTruthy())
                    }
                }
                
                it("Check iPhones methods") {
                    let value = "0".i4("1").i8("2").i8P("3").iX("4").iXMAX("5").iXR("6")
                    if Screen.current == .i4 {
                        expect(value == "1").toEventually(beTruthy())
                    } else if Screen.current == .i8 {
                        expect(value == "2").toEventually(beTruthy())
                    } else if Screen.current == .i8P {
                        expect(value == "3").toEventually(beTruthy())
                    } else if Screen.current == .iX {
                        expect(value == "4").toEventually(beTruthy())
                    } else if Screen.current == .iXMAX {
                        expect(value == "5").toEventually(beTruthy())
                    } else if Screen.current == .iXR {
                        expect(value == "6").toEventually(beTruthy())
                    }
                }
                
                it("Check iPads methods") {
                    let value = "0".p97("1").p105("2").p11("3").p129("4")
                    if Screen.current == .p97 {
                        expect(value == "1").toEventually(beTruthy())
                    } else if Screen.current == .p105 {
                        expect(value == "2").toEventually(beTruthy())
                    } else if Screen.current == .p11 {
                        expect(value == "3").toEventually(beTruthy())
                    } else if Screen.current == .p129 {
                        expect(value == "4").toEventually(beTruthy())
                    }
                }
                
                it("Check macth screens method") {
                    let value = "0".match([.p97, .iX], "1")
                    if Screen.current == .p97 || Screen.current == .iX {
                        expect(value == "1").toEventually(beTruthy())
                    } else {
                        expect(value == "0").toEventually(beTruthy())
                    }
                }
            })
        }
    }
}
