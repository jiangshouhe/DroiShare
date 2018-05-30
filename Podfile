#platform :ios, '7.0'
target ‘DroiShareSDKDemo’ do
    
pod 'DroiCoreSDK'
    post_install do |installer|
        require './Pods/DroiCoreSDK/scripts/postInstall.rb'
        DroiCoreParser.installParser()
end
    
pod 'WechatOpenSDK'
pod "Weibo_SDK", :git => "https://github.com/sinaweibosdk/weibo_ios_sdk.git"
end
