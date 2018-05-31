//
//  DroiQQShareResponse.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DroiQQShareSDK.h"
#import <TencentOpenAPI/QQApiInterface.h>



@interface DroiQQShareResponse : NSObject<QQApiInterfaceDelegate>

+ (instancetype)defaultQQShareResponse;


@property (nonatomic ,copy)SSDKShareResponseHandler shareResponseBlock;
@end
