Pod::Spec.new do |s|
  s.name = 'AwareSDK'
  s.version = '1.1.1'
  s.license = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.summary = 'AIQ Aware iOS SDK'
  s.homepage = 'https://github.com/SkelterLabsInc/aware-ios-sdk'
  s.authors = { 'Skelter Labs' => 'aware-support@skelterlabs.com' }
  s.source = { :git => 'https://github.com/SkelterLabsInc/aware-ios-sdk.git', :tag => s.version }
  s.documentation_url = 'https://github.com/SkelterLabsInc/aware-ios-sdk'
  s.ios.deployment_target = '10.0'
  s.swift_versions = ['5.1', '5.2', '5.3']
  s.source_files = 'Sources/**/*.swift'

  s.dependency 'Alamofire', '~> 5.4'
end
