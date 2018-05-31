
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
s.dependency 'DroiCoreSDK'

    s.subspec 'ShareSDKPlatforms' do |sp|
        # SinaWeibo
        sp.subspec 'SinaWeibo' do |ssp|
        ssp.vendored_libraries = "SDK/Weibo_SDK/*.a"
        ssp.resources = 'SDK/Weibo_SDK/WeiboSDK.bundle'
        ssp.frameworks = 'ImageIO'
        ssp.libraries = 'sqlite3'
        ssp.source_files = "SDK/Weibo_SDK/*.{h,m}"
        ssp.public_header_files = "SDK/Weibo_SDK/*.h"

        end

        # WeChat
        sp.subspec 'WeChat' do |ssp|
        ssp.vendored_libraries = "SDK/WechatOpenSDK/*.a"
        ssp.source_files = "SDK/WechatOpenSDK/*.{h,m}"
        ssp.public_header_files = "SDK/WechatOpenSDK/*.h"
        ssp.libraries = 'sqlite3'

        end
    end
end
