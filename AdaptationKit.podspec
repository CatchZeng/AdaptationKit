#
# Be sure to run `pod lib lint AdaptationKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AdaptationKit'
  s.version          = '0.1.0'
  s.summary          = 'auto adaptation solution.'
  s.description      = '📱 screen auto adaptation solution.'
  s.homepage         = 'https://github.com/catchzeng/AdaptationKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'catchzeng' => '891793848@qq.com' }
  s.source           = { :git => 'https://github.com/catchzeng/AdaptationKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'AdaptationKit/Classes/**/*'
end
