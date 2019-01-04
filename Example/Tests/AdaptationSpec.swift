//
//  AdaptationSpec.swift
//  AdaptationKit_Tests
//
//  Created by CatchZeng on 2019/1/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import Quick
import Nimble
import AdaptationKit

class AdaptationSpec: QuickSpec {
    override func spec() {
        describe("Adaptation") {
            context("Int", {
                it("Check adapt method") {
                    let value: Int = 12.adapt()
                    switch Screen.current {
                    case .unknown:
                        expect(value).to(equal(12))
                    case .i4:
                        expect(value).to(equal(10))
                    case .iSE:
                        expect(value).to(equal(10))
                    case .i8:
                        expect(value).to(equal(12))
                    case .i8P:
                        expect(value).to(equal(13))
                    case .iX:
                        expect(value).to(equal(12))
                    case .iXR:
                        expect(value).to(equal(13))
                    case .iXMAX:
                        expect(value).to(equal(13))
                    case .p97:
                        expect(value).to(equal(24))
                    case .p105:
                        expect(value).to(equal(26))
                    case .p11:
                        expect(value).to(equal(26))
                    case .p129:
                        expect(value).to(equal(32))
                    }
                }
            })
        }
    }
}
