# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
workspace "MoovupTest"

target 'MoovupTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MoovupTest
  
  pod "Alamofire", "~> 5.5"
  pod 'CoreStore', '~> 9.1'


end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    # Fix build issue in Xcode 14
    # Reference: https://github.com/CocoaPods/CocoaPods/issues/11402#issuecomment-1201464693
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
      end
    end

    # Fix build issue in Xcode 14.3
    # Reference: https://stackoverflow.com/questions/75574268/missing-file-libarclite-iphoneos-a-xcode-14-3
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end
