//
//  NSMutableDictionary+SDKWechatShare.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/28.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DroiShare/DroiShare.h>


@interface NSMutableDictionary (SDKWechatShare)


/**
 *  设置微信分享参数
 *  @param text              发送消息的文本内容
 *  @param imageData         图片数据 大小不能超过10M，微信暂时不支持分享多张图片
 *  @param thumbImage        缩略图
 *  @param url               视频url或者网页url ,支持网络视频分享，暂时不支持手机相册视频的分享
 *  @param title             分享视频或者网页时标题
 *  @param description       分享视频或者网页时描述内容
 *  @param type              分享类型
 *  分享网络数据可能比较慢，根据实际情况加上加载框
 *  分享文本时：
 *  设置type为SSDKContentTypeText, 并填入text参数
 *
 *  分享图片时：
 *  设置type为SSDKContentTypeImage,  imageData，thumbImage 必填
 *
 *  分享网页时：
 *  设置type为SSDKContentTypeWebPage, 并设置title、description、url以及thumbImage参数
 
 *  分享视频时：
 *  设置type为SSDKContentTypeVideo，  并设置title、description、url以及thumbImage参数
 * 发送消息的类型，包括文本消息和多媒体消息两种，两者只能选择其一，不能同时发送文本和多媒体消息 */

- (void)setupWeChatParamsByText:(NSString *)text
                      sendImageData:(NSData *)imageData
                         thumbImage:(UIImage *)thumbImage
                  videoUrlOrLinkUrl:(NSString *)url
                              title:(NSString *)title
                        description:(NSString *)description
                               type:(SSDKContentType)type;
@end
