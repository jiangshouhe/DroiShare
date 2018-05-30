/*
 * Copyright (c) 2016-present Shanghai Droi Technology Co., Ltd.
 * All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "DroiCoreSDK/DroiOAuthProvider.h"

#ifndef DROI_LIBRARY
// Update share type for QQ dynamically
#import "TencentOpenAPI/TencentOAuth.h"
int const DROI_QQ_SHARE_TYPE = AuthShareType_QQ;
#endif

@interface DroiOAuthQQProvider : DroiOAuthProvider
+ (BOOL) initializeSDK;
+ (BOOL) registerProvider;
@end
