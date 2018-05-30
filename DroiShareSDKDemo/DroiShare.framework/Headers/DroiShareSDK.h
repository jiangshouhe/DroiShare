//
//  DroiShareSDK.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/6.
//  Copyright © 2017年 Droi. All rights reserved.
//   

#import <Foundation/Foundation.h>


@interface DroiShareSDK : NSObject

+ (instancetype)defaultShareSDK;

/**初始化 SDK  APIKey后台暂时没有 填写空字符串
 @param APIKey 在 DroiBaaS 官网上面申请的 SDK 对应的 APIKey
 */
+ (void)initializeWithAPIKey:(NSString *)APIKey;

/**
  Log 开关  enabled==YES 开启  SDK会在控制台输出详细的日志信息，开发者可以据此调试自己的程序。默认为YES
 */
+ (void)setLogEnabled:(BOOL)enabled;

/**获取 SDK 版本号
 */
+ (NSString *)getVersion;


@end
