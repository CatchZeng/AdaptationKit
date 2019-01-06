# AdaptationKit

[![Version](https://img.shields.io/cocoapods/v/AdaptationKit.svg?style=flat)](https://cocoapods.org/pods/AdaptationKit)
[![License](https://img.shields.io/cocoapods/l/AdaptationKit.svg?style=flat)](https://cocoapods.org/pods/AdaptationKit)
[![Platform](https://img.shields.io/cocoapods/p/AdaptationKit.svg?style=flat)](https://cocoapods.org/pods/AdaptationKit)

📱 screen auto adaptation solution.


## Usage

Import the framework firstly.

```swift
import AdaptationKit
```

### ScreenMatchable

Quickly adapt to various screens. Support Int,Float,Double,String,CGRect,CGSize,CGFloat,CGPoint,UIEdgeInsets.

```swift
label.text = "I am " +
"unkown screen"
.i4("iPhone 4 like screen.")
.i8("iPhone 8 like screen.")
.i8P("iPhone 8Plus like screen.")
.iX("iPhone X like screen.")
.iXR("iPhone XR like screen.")
.iXMAX("iPhone XMAX like screen.")
.p97("iPad 9.7 like screen.")
.p105("iPad 10.5 like screen.")
.p11("iPad 11 like screen.")
.p129("iPad 12.9 like screen.")

/*
* default numberOfLines = 0
* iPad numberOfLines = 1
* iPhone(In addition to iPhone XS Max) numberOfLines = 2
* iPhone XS Max numberOfLines = 3
*/
label.numberOfLines = 0.pad(1).phone(2).iXMAX(3)

/*
* default value = "0"
* iPad 9.7 & iPhone X value = "1"
*/
let value = "0".match([.p97, .iX], "1")
```

Extend other types you need.

```swift
extension YouType: ScreenMatchable {}
```

### Adaptable

Calculate inch & font  automatically.

```swift
/*
* default(iPhone 8) width = 12.0
* iPhone 4 width = 10.24
* iPhone X MAX  width = 13.248
* ...
*/
testView.snp.makeConstraints { (make) in
    make.width.equalTo(12.adaptInch())
}

/*
* default(iPhone 8) size = 12.0
* iPhone 4 size = 10.24
* iPhone X MAX  size = 13.248
* ...
*/
label.font = UIFont(name: label.font.fontName, size: 12.0.adaptFont())


// operator
// ~ means adaptInch()
// ≈ means adaptFont()

testView.snp.makeConstraints { (make) in
    make.width.equalTo(12~)
}

label.font = UIFont(name: label.font.fontName, size: 12.0≈) 
```

### UI

#### adaptFont

Support  UILabel,UITextView,UITextField.

```swift
label.adaptFont = true // equal to  label.font = UIFont(name: label.font.fontName, size: font.pointSize.adaptFont())
```
![IBInspectable](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptFont.jpg)

![Effect](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptFontEffect.jpg)

#### adaptConstant

Calculate NSLayoutConstraint's constant automatically.

```swift
constraint.adaptConstant = true
```
![IBInspectable](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptConstant.jpg)

![Effect](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptConstantEffect.jpg)

### AdaptationRule

All of the above automatic calculations are based on the default rules(AdaptationRule.default). 
If you want to customize the rules of the calculation, you can call the set method.

```
let inchRule = AdaptationRule(baseScreen: .i8)
inchRule.set(screen: .i4, ratio: 0.5)
inchRule.set(screen: .iXMAX, ratio: 1.3)
AdaptationKit.set(inchRule: inchRule)

let fontRule = AdaptationRule(baseScreen: .i8)
fontRule.set(screen: .i4, ratio: 0.6)
fontRule.set(screen: .iXMAX, ratio: 1.5)
AdaptationKit.set(inchRule: fontRule)
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

AdaptationKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AdaptationKit'
```

## Author

catchzeng, 891793848@qq.com

## License

AdaptationKit is available under the MIT license. See the LICENSE file for more info.
