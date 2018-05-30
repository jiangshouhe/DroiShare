//
//  DroiSinaWeiboShareResponse.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/27.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DroiSinaWeiboShareSDK.h"
#import "WeiboSDK.h"

@interface DroiSinaWeiboShareResponse : NSObject<WeiboSDKDelegate>



+ (instancetype)defaultSinaWeiboShareResponse;


@property (nonatomic ,copy)SSDKShareResponseHandler shareResponseBlock;
@end
