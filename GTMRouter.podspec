

Pod::Spec.new do |s|

  s.name         = "GTMRouter"
  s.version      = "1.3.4"
  s.summary      = "swift 实现的上拉刷新，下拉加载动效库"
  s.swift_version= "4.1.2"

  s.homepage     = "https://github.com/GTMYang/GTMRouter"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GTMYang" => "17757128523@163.com" }


  s.source       = { :git => "https://github.com/GTMYang/GTMRouter.git", :tag => s.version }
  s.source_files = "GTMRouter/*.swift"

  s.ios.deployment_target = "8.0"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
