//
//  NSMutableDictionary+SDKWeiboShare.h
//  DroiShareSDK
//
//  Created by zxl on 17/9/27.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DroiShare/DroiShare.h>


@interface NSMutableDictionary (SDKWeiboShare)

/**
 *  设置微博分享参数
 *  @param text              文本 或者是带链接的文本
 *  @param images            图片集合,数组元素可以为UIImage
 *  @param title             网页的内容标题
 *  @param webpageUrl        网页的url地址
 *  @param thumbnailData     网页的内容缩略图 多媒体内容缩略图 大小小于32k
 *  @param videoUrl          视频url
 *  @param type              分享类型
 *  注意：一个消息结构由三部分组成：文字、图片和多媒体数据。三部分内容中至少有一项不为空，图片和多媒体数据不能共存。(新版的多图和视频属于图片数据，并且图片和视频也不能共存)  即：图片和链接不能共存，视频和链接不能共存，图片和视频不能共存
 */
- (void)setupWeiboShareParamsByText:(NSString *)text
                            images:(NSArray *)images
                      webPageTitle:(NSString *)title
                        webPageUrl:(NSString *)webpageUrl
              webPageThumbnailData:(NSData *)thumbnailData
                          videoUrl:(NSURL *)videoUrl
                              type:(SSDKContentType)type;
@end
