//
//  DroiWechatShareSDK.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DroiShare/DroiShare.h>



typedef void(^SSDKShareResponseHandler) (SSDKResponseState state,NSString *errStr);

@interface DroiWechatShareSDK : NSObject


+ (instancetype)defaultWechatShareSDK;


/**
 *  设置微信(微信好友，微信朋友圈)应用信息
 *  @param appId      应用标识
 *  @param appSecret  应用密钥
 */
+ (void)setupWeChatByAppId:(NSString *)appId
                     appSecret:(NSString *)appSecret;
/**
 *  微信分享方法
 *  @param platformType             平台类型
 *  @param parameters               分享参数
 */
- (void)weChatShare:(SSDKPlatformType)platformType
   parameters:(NSMutableDictionary *)parameters
shareResponseBlock:(SSDKShareResponseHandler)shareResponseBlock;


@end
