source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
platform :ios, '8.0'

inhibit_all_warnings!
target 'AdNomusTest' do
  pod 'AdnomusSdk', :git => 'http://gitlab.adnomus.com/gbarbalinardo/adnomus-ios-sdk.git'
end

project 'AdNomusTest.xcodeproj'
workspace 'AdNomusTest.xcworkspace'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
