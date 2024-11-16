
Pod::Spec.new do |spec|


  spec.name         = "SwiftFormKit"
  spec.version      = "1.0.0"
  spec.summary      = "A framework for creating dynamic forms in iOS."
  spec.description  = "SwiftFormKit is a framework that allows developers to easily create dynamic forms with support for different field types and automatic validation."
  spec.homepage     = "https://github.com/tyvdvb/SwiftFormKit"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "tyvdvb" => "ira1980nazar@gmail.com" }
  spec.platform     = :ios, "17.2"
  spec.source       = { :git => "https://github.com/tyvdvb/SwiftFormKit.git", :tag => spec.version.to_s }
  spec.source_files  = "SwiftFormKit/**/*.{swift}"
  spec.swift_versions     = "5.0"


end
