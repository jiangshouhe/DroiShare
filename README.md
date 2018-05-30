# DroiShare
# 社会化服务
## 简介
社会化sdk帮助开发者快速集成微博、微信、QQ等平台分享和登录功能。

## 安装

### 快速入门
由于卓易社会化 SDK 基于卓易 CoreSDK，所以请在安装卓易社会化 SDK 之前仔细阅读[快速入门](http://www.droibaas.com/Index/document)，并确保已经完成快速入门的所有步骤。


### 使用CocoaPods方式集成（推荐）
DroiShare SDK使用 CocoaPods 作为函数库的管理工具。我们推荐您使用 CocoaPods 这种方式来安装 SDK，这样可以简化安装 DroiShare SDK的流程。如果您未安装CocoaPods，请参考[《 CocoaPods 安装和使用教程》](http://www.jianshu.com/p/b7bbf7f6af54)完成安装。CocoaPods 安装完成后，请在项目根目录下创建一个 Podfile 文件，并添加如下内容（如果已有直接添加即可）：
###在 Podfile 文件中添加命令：
```
#platform :ios, '8.0'
target ‘yourTarget’ do

pod 'DroiCoreSDK'
post_install do |installer|
require './Pods/DroiCoreSDK/scripts/postInstall.rb'
DroiCoreParser.installParser()
end

pod 'WechatOpenSDK'
pod "Weibo_SDK", :git => "https://github.com/sinaweibosdk/weibo_ios_sdk.git"
end

```
之后在控制台中 cd 到 Podfile 文件所在目录，执行如下命令完成安装。

```
pod  install
```

注意：由于QQ平台暂时不支持CocoaPods方式集成，所以要到QQ开放平台http://open.qq.com 下载SDK，将`TencentOpenAPI.framework`添加到工程中
###  手动集成
解压获取后将 `DroiShare.framework` `DroiShareBundle.bundle``DroiSinaWeiboShare.framework`
`DroiWechatShare.framework``DroiQQShare.framework`添加到工程中。
如果需要集成第三方登录功能需要
下载[DroiOAuth SDK](http://gitlab.droi.com/DroiBaaS/DroiBaaSOAuth/blob/master/DroiBaaSOAuth_universal.zip)
添加`libDroiOAuthQQProvider.a`  `libDroiOAuthSinaProvider.a`  `libDroiOAuthWeixinProvider.a`  和 `DroiOAuthQQProvider.h`  `DroiOAuthSinaProvider.h`  `DroiOAuthWeixinProvider.h`添加到工程中，集成第三方登录需要在[官网](https://www.droibaas.com)后台创建应用，并且将微博、微信、QQ开放平台下创建的应用信息添加到官网后台的账号服务中，同时需要在info.plist中添加`DROI_APP_ID` 值为你在官网后台创建应用的Application ID。
###配置info.plist
添加一个数组名为 `LSApplicationQueriesSchemes` 并加入以下元素,元素类型为String

* sinaweibohd
* sinaweibo
* weibosdk
* weibosdk2.5
* weixin
* mqq
* mqqapi
* mqqopensdkapiV4
* mqqopensdkapiV2
* sinaweibosso
* sinaweibohdsso
* wtloginmqq2
* mqqOpensdkSSoLogin
* mqqopensdkapiV3
* mqzone
* wechat

在 Info -> URL Types 中，加入 URL Schemes
如：`wb1665582056` `wxd80b178214361b94` `tencent1106430520`

配置内容比较多，请参考demo工程。

###初始化 SDK
在使用DroiShare SDK之前需要先初始化DroiShare SDK 请在Applegate.m中添加如下代码，完成初始化。

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

[DroiSinaWeiboShareSDK setupSinaWeiboByAppKey:@"1665582056" appSecret:@"7f15979837dcc3a9acd0b278f3d5b296" redirectUrl:@"https://api.weibo.com/oauth2/default.html"];
[DroiWechatShareSDK setupWeChatByAppId:@"wxd80b178214361b94" appSecret:@"7c10606c2ddfe7348181aab64a7741eb"];

[DroiQQShareSDK setupQQByAppId:@"1106430520" appKey:@"NJ7BbX9Sy2gnw6vO"];

[DroiCore initializeCore];
[DroiOAuthSinaProvider initializeSDK];
[DroiOAuthQQProvider initializeSDK];
[DroiOAuthWeixinProvider initializeSDK];
[DroiShareSDK initializeWithAPIKey:@""];

return YES;
}

```
如果不要需要第三方登录功能请去掉:`[DroiOAuthSinaProvider initializeSDK];`
`[DroiOAuthQQProvider initializeSDK];`
`[DroiOAuthWeixinProvider initializeSDK];`

###分享和登录响应

```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
if ([url.description hasPrefix:@"wb"]) {

[DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
return [WeiboSDK handleOpenURL:url delegate:[DroiSinaWeiboShareResponse defaultSinaWeiboShareResponse]];

}else if ([url.description hasPrefix:@"wx"]){
[WXApi handleOpenURL:url delegate:[DroiWechatShareResponse defaultWechatShareResponse]];
return [DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
}else{
[DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
return  [QQApiInterface handleOpenURL:url delegate:[DroiQQShareResponse defaultQQShareResponse]];


}

}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
if ([url.description hasPrefix:@"wb"]) {

[DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];
return [WeiboSDK handleOpenURL:url delegate:[DroiSinaWeiboShareResponse defaultSinaWeiboShareResponse]];

}else if ([url.description hasPrefix:@"wx"]){
[WXApi handleOpenURL:url delegate:[DroiWechatShareResponse defaultWechatShareResponse]];
return [DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];

}else{
[DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];
return  [QQApiInterface handleOpenURL:url delegate:[DroiQQShareResponse defaultQQShareResponse]];

}
}

```
如果不要需要第三方登录功能请去掉:
`[DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];`和`[DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];`

###分享
在需要分享的地方添加即可，下面以微博分享文字为例

```
NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
[shareParams setupWeiboShareParamsByText:@"分享文字" images:nil webPageTitle:nil webPageUrl:nil webPageThumbnailData:nil videoUrl:nil type:SSDKContentTypeText];

__weak typeof(self) weakSelf = self;
[[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {

[weakSelf shareResponseWithState:state];
}];

```
更多详细分享和登录功能请参考demo工程。









