//
//  NSMutableDictionary+SDKQQShare.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DroiShare/DroiShare.h>


@interface NSMutableDictionary (SDKQQShare)


/**
 *  设置QQ分享参数
 *  @param text            分享文本内容
 *  @param title           分享标题
 *  @param images          分享图片数组,并且数组元素只能为（NSData *）,分享到空间时可以多张图片,图片可以为本地或者网络
 *  @param description     分享描述
 *  @param webPageUrlOrVideoUrl     视频url或者网页url
 *  @param previewImageURL          视频或者网页的预览缩略图
 *  @param type            分享类型
 *  分享网络数据可能比较慢，   根据实际情况加上加载框
 */
- (void)setupQQParamsByText:(NSString *)text
                          title:(NSString *)title
                         images:(NSArray <NSData *>*)images
                    description:(NSString *)description
           webPageUrlOrVideoUrl:(NSString*)webPageUrlOrVideoUrl
                previewImageURL:(NSData*)previewImageURL
                           type:(SSDKContentType)type;
@end
