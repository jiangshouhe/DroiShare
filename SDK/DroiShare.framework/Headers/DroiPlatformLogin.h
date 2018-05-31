//
//  DroiPlatformLogin.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/20.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DroiShare.h"

//
typedef void(^SSDKGetUserStateChangedHandler) (SSDKResponseState state, DroiShareUser *user,  DroiError *error);

//第三方登录
@interface DroiPlatformLogin : NSObject



+ (instancetype)defaultDroiPlatformLogin;

/**
 *  获取微博授权用户信息
 *  @param stateChangedHandler 回调处理
 */
+ (void)getWeiboLoginUserInfo:(SSDKGetUserStateChangedHandler)stateChangedHandler;


/**
 *  获取微信授权用户信息
 *  @param stateChangedHandler 回调处理
 */
+ (void)getWeChatLoginUserInfo:(SSDKGetUserStateChangedHandler)stateChangedHandler;

/**
 *  获取QQ授权用户信息
 *  @param stateChangedHandler 回调处理
 */
+ (void)getQQLoginUserInfo:(SSDKGetUserStateChangedHandler)stateChangedHandler;


@end
