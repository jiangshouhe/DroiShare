//
//  DroiShareSDKHeader.h
//  DroiShareSDK
//
//  Created by zxl on 17/10/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width


#define MYBUNDLE_NAME  @"DroiShareBundle.bundle"
#define MYBUNDLE_PATH  [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: MYBUNDLE_NAME]
#define MYBUNDLE        [NSBundle bundleWithPath: MYBUNDLE_PATH]

/**
 *  平台类型
 */
typedef NS_ENUM(NSUInteger, SSDKPlatformType){
    
    /**
     *  新浪微博
     */
    SSDKPlatformTypeSinaWeibo           = 2,
    
    /**
     *  QQ空间
     */
    SSDKPlatformSubTypeQZone            = 6,
    /**
     *  QQ好友
     */
    SSDKPlatformSubTypeQQFriend         = 24,
    
    /**
     *  微信好友
     */
    SSDKPlatformSubTypeWechatSession    = 22,
    /**
     *  微信朋友圈
     */
    SSDKPlatformSubTypeWechatTimeline   = 23,
    
    /**
     *  复制链接
     */
    SSDKPlatformSubTypeCopyLink   = 46,
    
};

/**
 *  回复状态
 */
typedef NS_ENUM(NSUInteger, SSDKResponseState){
    /**
     *  成功
     */
    SSDKResponseStateSuccess    = 1,
    
    /**
     *  失败
     */
    SSDKResponseStateFail       = 2,
    
    /**
     *  取消
     */
    SSDKResponseStateCancel     = 3
};

/**
 *  内容类型
 */
typedef NS_ENUM(NSUInteger, SSDKContentType){
    
    /**
     *  文本
     */
    SSDKContentTypeText         = 1,
    
    /**
     *  图片
     */
    SSDKContentTypeImage        = 2,
    
    /**
     *  网页
     */
    SSDKContentTypeWebPage      = 3,
    
    /**
     *  视频
     */
    SSDKContentTypeVideo        = 4,
    
};

@interface DroiShareSDKHeader : NSObject

@end
