

Pod::Spec.new do |s|

  s.name         = "GTMRouter"
  s.version      = "0.0.1"
  s.summary      = "swift 实现的上拉刷新，下拉加载动效库"

  s.homepage     = "https://github.com/GTMYang/GTMRouter"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "GTMYang" => "17757128523@163.com" }


  s.source       = { :git => "https://github.com/GTMYang/GTMRouter.git", :tag => s.version }
  s.source_files = "GTMRouter/*.swift"
#s.resources    = 'GTMRouter/Resource/**/*'

  s.ios.deployment_target = "8.0"
  s.frameworks = "UIKit"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

end
