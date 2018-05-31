//
//  DroiWechatShareResponse.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DroiWechatShareSDK.h"
#import "WXApi.h"

@interface DroiWechatShareResponse : NSObject<WXApiDelegate>


+ (instancetype)defaultWechatShareResponse;


@property (nonatomic ,copy)SSDKShareResponseHandler shareResponseBlock;
@end
