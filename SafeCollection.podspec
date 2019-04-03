Pod::Spec.new do |s|
  s.name             = "SafeCollection"
  s.version          = "3.1.0"
  s.summary          = "Safe Collection for Swift"
  s.homepage         = "https://github.com/devxoul/SafeCollection"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "Suyeol Jeon" => "devxoul@gmail.com" }
  s.source           = { :git => "https://github.com/devxoul/SafeCollection.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/**/*.swift"
  s.requires_arc     = true
  s.swift_version    =  "5.0"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
end
