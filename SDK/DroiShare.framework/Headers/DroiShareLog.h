//
//  DroiShareLog.h
//  DroiShareSDK
//
//  Created by zxl on 17/10/31.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define DroiDebugLog(...) NSLog(__VA_ARGS__)
#else
#define DroiDebugLog(...)
#endif


#define DroiLog(...) [DroiShareLog droiLog:[NSString stringWithFormat:__VA_ARGS__]]

#define DroiQQLog(...) [DroiShareLog droiQQLog:[NSString stringWithFormat:__VA_ARGS__]]
#define DroiWBLog(...) [DroiShareLog droiWBLog:[NSString stringWithFormat:__VA_ARGS__]]
#define DroiWXLog(...) [DroiShareLog droiWXLog:[NSString stringWithFormat:__VA_ARGS__]]

@interface DroiShareLog : NSObject

+ (void)droiLog:(NSString *)log;

+ (void)droiQQLog:(NSString *)log;
+ (void)droiWBLog:(NSString *)log;
+ (void)droiWXLog:(NSString *)log;


@end
