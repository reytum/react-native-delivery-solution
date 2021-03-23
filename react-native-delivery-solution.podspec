require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-delivery-solution"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/reytum/react-native-delivery-solution.git", :tag => "#{s.version}" }

  s.source_files = "ios/RNDeliverySolution/*.{h,m,mm,swift}"
  s.dependency "React-Core"
  s.static_framework = true
  s.dependency 'CocoaLumberjack', '~> 3.6.1'
  s.libraries           = 'sqlite3', 'z'
  s.vendored_frameworks = 'ios/RNDeliverySolution/TSLocationManager.xcframework'
end
