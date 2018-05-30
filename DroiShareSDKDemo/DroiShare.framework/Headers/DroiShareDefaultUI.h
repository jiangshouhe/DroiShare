//
//  DroiShareDefaultUI.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/5.
//  Copyright © 2017年 Droi. All rights reserved.
//  分享默认的ui

#import <UIKit/UIKit.h>
#import "DroiShare.h"

typedef void(^platformTypeBlock)(SSDKPlatformType type);

@interface DroiShareDefaultUI : UIView

@property(nonatomic,copy)platformTypeBlock type;
/**
 *  显示默认分享视图
 */
- (void)show;
@end

