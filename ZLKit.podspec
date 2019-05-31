# 注释

Pod::Spec.new do |s|

#组件名称
s.name             = 'ZLKit'

#组件版本号
s.version          = '3.3.1'

#摘要
s.summary          = '工具库、高效开发'

#详细描述。字数需要比摘要多
s.description      = <<-DESC
库内集成对系统控件的二次封装、对基础逻辑的处理、高效的宏定义等等；
DESC
#组件主页地址
s.homepage         = 'https://github.com/itzhaolei/ZLKit'

#权限、授权协议
s.license          = 'MIT'

#用户名及邮箱
s.author           = { 'Mr.Zhao' => 'itzhaolei@foxmail.com' }

#仓库地址 SSH地址 tag指向了上面的 s.version
s.source           = { :git => 'https://github.com/itzhaolei/ZLKit.git', :tag => s.version }

#支持的系统版本号不小于哪个版本
s.ios.deployment_target = '8.0'

#组件文件的存放位置
s.source_files = 'ZLKit/Classes/**/*'

s.resource_bundles = {
'ZLKit' => ['ZLKit/Assets/**/*']
}

#依赖的系统库
# s.frameworks = 'UIKit'

#依赖的第三方库
s.dependency "ZLHTTPSessionManager", "~> 0.0.7"
s.dependency "ZLNavigationBar", "~> 0.1.1"

end
