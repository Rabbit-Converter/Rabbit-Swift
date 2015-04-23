#
# Be sure to run `pod lib lint Rabbit.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Rabbit-Swift"
  s.version          = "0.1.2"
  s.summary          = "Rabbit Converter"
  s.description      = <<-DESC
                       Another Unicode to Zawgyi , Zawgyi to Unicode Converter
                       DESC
  s.homepage         = "https://github.com/Rabbit-Converter/Rabbit-Swift"
  s.license          = 'MIT'
  s.author           = { "saturngod" => "saturngod@gmail.com" }
  s.source           = { :git => "https://github.com/Rabbit-Converter/Rabbit-Swift.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.swift'
  
end
