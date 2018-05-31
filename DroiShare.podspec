
Pod::Spec.new do |s|
s.name         = 'DroiShare'
s.version      = '0.0.1'
s.summary      = '卓易分享'
s.homepage     = 'https://www.droibaas.com/'
s.license      = 'MIT'
s.authors      = {'jiangshouhe' => 'jianghe19870928@126.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/jiangshouhe/DroiShare.git', :tag => s.version}
s.resources     = 'SDK/DroiShareBundle.bundle'
s.vendored_frameworks ='SDK/DroiQQShare.framework','SDK/DroiShare.framework','SDK/DroiSinaWeiboShare.framework','SDK/DroiWechatShare.framework','SDK/TencentOpenAPI.framework'
s.requires_arc = true
end
