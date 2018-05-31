//
//  DroiQQShareSDK.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DroiShare/DroiShare.h>


typedef void(^SSDKShareResponseHandler) (SSDKResponseState state,NSString *errStr);

@interface DroiQQShareSDK : NSObject


+ (instancetype)defaultQQShareSDK;

/**
 *  设置QQ分享平台（QQ空间，QQ好友分享）应用信息
 *  @param appId          应用标识
 *  @param appKey         应用Key
 */
+ (void)setupQQByAppId:(NSString *)appId
                    appKey:(NSString *)appKey;

/**
 *  QQ(QQ好友和QQ空间)分享方法
 *  @param platformType             平台类型   SSDKPlatformSubTypeQQFriend或者SSDKPlatformSubTypeQZone
 *  @param parameters               分享参数
 */
- (void)qqShare:(SSDKPlatformType)platformType
   parameters:(NSMutableDictionary *)parameters
shareResponseBlock:(SSDKShareResponseHandler)shareResponseBlock;
@end
