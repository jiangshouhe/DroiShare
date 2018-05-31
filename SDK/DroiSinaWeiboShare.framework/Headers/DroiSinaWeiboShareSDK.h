//
//  DroiSinaWeiboShareSDK.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/27.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DroiShare/DroiShare.h>


typedef void(^SSDKShareResponseHandler) (SSDKResponseState state,NSString *errStr);

@interface DroiSinaWeiboShareSDK : NSObject


+ (instancetype)defaultSinaWeiboShareSDK;

/**
 *  设置新浪微博应用信息
 *  @param appKey       应用标识
 *  @param appSecret    应用密钥
 *  @param redirectUrl  回调地址
 */
+ (void)setupSinaWeiboByAppKey:(NSString *)appKey
                         appSecret:(NSString *)appSecret
                       redirectUrl:(NSString *)redirectUrl;

/**
 *  微博分享方法
 *  @param platformType             平台类型
 *  @param parameters               分享参数
 *  @param shareResponseBlock       分享回调
 */
- (void)weiboShare:(SSDKPlatformType)platformType
   parameters:(NSMutableDictionary *)parameters
    shareResponseBlock:(SSDKShareResponseHandler)shareResponseBlock;


@end
