//
//  DroiShareUser.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/19.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <DroiCoreSDK/DroiCoreSDK.h>

@interface DroiShareUser : DroiUser

DroiExpose
@property NSString* _NickName;
DroiExpose
@property NSString* _Avatar;
DroiExpose
@property NSNumber* _Gender;//0-男 1- 女 2-保密/未知

@end
