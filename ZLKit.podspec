Pod::Spec.new do |s|

s.name             = 'ZLKit'

s.version          = '3.0.2'

s.summary          = '工具库'

s.description      = <<-DESC
库内集成对系统控件的二次封装、对基础逻辑的处理、高效的宏定义等等；
DESC

s.homepage         = 'https://github.com/itzhaolei/ZLKit'

s.license          = 'MIT'

s.author           = { 'Mr.Zhao' => 'itzhaolei@foxmail.com' }

s.source           = { :git => 'https://github.com/itzhaolei/ZLKit.git', :tag => s.version }

s.ios.deployment_target = '8.0'

s.source_files = 'ZLKitDemo/Library/**/*'

s.resource_bundles = {
'ZLNavigationBar' => ['ZLKitDemo/Library/**/*']
}

s.framework  = "UIKit"

s.dependency "ZLHTTPSessionManager", "~> 0.0.1"
s.dependency "ZLNavigationBar", "~> 0.1.0"

end
