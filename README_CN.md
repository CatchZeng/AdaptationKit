# AdaptationKit

![Swift](https://img.shields.io/badge/Swift-4.2-green.svg)
[![Version](https://img.shields.io/cocoapods/v/AdaptationKit.svg?style=flat)](https://cocoapods.org/pods/AdaptationKit)
[![License](https://img.shields.io/cocoapods/l/AdaptationKit.svg?style=flat)](https://cocoapods.org/pods/AdaptationKit)
[![Platform](https://img.shields.io/cocoapods/p/AdaptationKit.svg?style=flat)](https://cocoapods.org/pods/AdaptationKit)

📱 屏幕自动适配方案。

## 特性

- [x] 快速适配各种不同尺寸屏幕
- [x] 自动计算尺寸和字体大小
- [x] 支持便捷操作符(~ ，≈)
- [x] 支持 IBInspectable
- [x] 自定义适配规则

## 使用方法

使用前先导入 AdaptationKit。

```swift
import AdaptationKit
```

### ScreenMatchable

快速适配各种不同尺寸屏幕。支持 Int,Float,Double,String,CGRect,CGSize,CGFloat,CGPoint,UIEdgeInsets。

![Effect](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/inch.jpg)

```swift
label.text = "I am " +
"unkown screen"
.i4("iPhone 4 like screen.")
.i8("iPhone 8 like screen.")
.i8P("iPhone 8Plus like screen.")
.iX("iPhone X like screen.")
.iXR("iPhone XR like screen.")
.iXMAX("iPhone XS MAX like screen.")
.p97("iPad 9.7 like screen.")
.p105("iPad 10.5 like screen.")
.p11("iPad 11 like screen.")
.p129("iPad 12.9 like screen.")

/*
* 默认 numberOfLines = 0
* iPad numberOfLines = 1
* iPhone(除了 iPhone XS Max 以外) numberOfLines = 2
* iPhone XS Max numberOfLines = 3
*/
label.numberOfLines = 0.pad(1).phone(2).iXMAX(3)

/*
* 默认 value = "0"
* iPad 9.7 & iPhone X value = "1"
*/
let value = "0".match([.p97, .iX], "1")
```

Extend other types you need.

```swift
extension YouType: ScreenMatchable {}
```

### Adaptable

自动计算尺寸和字体大小。

```swift
/*
* 默认(iPhone 8) width = 12.0
* iPhone 4 width = 10.24
* iPhone X MAX  width = 13.248
* ...
*/
testView.snp.makeConstraints { (make) in
    make.width.equalTo(12.adaptInch())
}

/*
* 默认(iPhone 8) size = 12.0
* iPhone 4 size = 10.24
* iPhone X MAX  size = 13.248
* ...
*/
label.font = UIFont(name: label.font.fontName, size: 12.0.adaptFont())


// 便捷操作符
// ~ 相当于 adaptInch()
// ≈ 相当于 adaptFont()

testView.snp.makeConstraints { (make) in
    make.width.equalTo(12~)
}

label.font = UIFont(name: label.font.fontName, size: 12.0≈) 
```

### UI

#### adaptFont

支持 UILabel,UITextView,UITextField。

```swift
label.adaptFont = true // 相当于  label.font = UIFont(name: label.font.fontName, size: font.pointSize.adaptFont())
```

![IBInspectable](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptFont.jpg)

![Effect](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptFontEffect.jpg)

#### adaptConstant

自动计算 NSLayoutConstraint 的 constant 值。

```swift
constraint.adaptConstant = true
```

![IBInspectable](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptConstant.jpg)

![Effect](https://raw.githubusercontent.com/CatchZeng/AdaptationKit/master/images/adaptConstantEffect.jpg)

### AdaptationRule

以上所有的自动计算都是基于默认的规则(AdaptationRule.default)。

如果默认的规则不满足需求，你可以自定义规则。

```swift
let inchRule = AdaptationRule(baseScreen: .i8)
inchRule.set(screen: .i4, ratio: 0.5)
inchRule.set(screen: .iXMAX, ratio: 1.3)
AdaptationKit.set(inchRule: inchRule)

let fontRule = AdaptationRule(baseScreen: .i8)
fontRule.set(screen: .i4, ratio: 0.6)
fontRule.set(screen: .iXMAX, ratio: 1.5)
AdaptationKit.set(fontRule: fontRule)
```

## 实例

Clone 本项目, 在 Example 项目中执行 `pod install`，然后 run 项目即可。

## 安装

AdaptationKit 可通过 [CocoaPods](https://cocoapods.org) 安装。

```ruby
pod 'AdaptationKit'
```

## 作者

catchzeng, 891793848@qq.com

## License

AdaptationKit is available under the MIT license. See the LICENSE file for more info.
