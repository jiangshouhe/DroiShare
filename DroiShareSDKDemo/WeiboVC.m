//
//  WeiboVC.m
//  DroiShareSDK
//
//  Created by zxl on 17/9/15.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import "WeiboVC.h"


#import <DroiSinaWeiboShare/DroiSinaWeiboShare.h>


@interface WeiboVC ()
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end

@implementation WeiboVC

- (NSMutableArray *)dataSourceArray
{
    if (_dataSourceArray == nil) {
        _dataSourceArray =[NSMutableArray array];
          [_dataSourceArray addObject:@"分享纯文本到微博"];
          [_dataSourceArray addObject:@"分享带链接的纯文本到微博"];
          [_dataSourceArray addObject:@"分享（本地图片）到微博"];
          [_dataSourceArray addObject:@"分享（网络图片）到微博"];
          [_dataSourceArray addObject:@"分享网页链接(缩略图为本地图片)到微博"];
          [_dataSourceArray addObject:@"分享网页链接(缩略图为网络图片)到微博"];//测试是去掉
          [_dataSourceArray addObject:@"分享网络视频到微博"];
          [_dataSourceArray addObject:@"分享本地视频到微博"];
        
    }
    return _dataSourceArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listTableView.rowHeight = 50;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourceArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ShareIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    
    cell.textLabel.text =self.dataSourceArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams setupWeiboShareParamsByText:@"分享文字" images:nil webPageTitle:nil webPageUrl:nil webPageThumbnailData:nil videoUrl:nil type:SSDKContentTypeText];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
            
            
        }
            break;
        case 1:
        {
            
            
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            [shareParams setupWeiboShareParamsByText:@"欢迎访问 https://www.droibaas.com"
                                              images:nil
                                        webPageTitle:nil
                                          webPageUrl:nil
                                webPageThumbnailData:nil
                                            videoUrl:nil
                                                type:SSDKContentTypeText];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
            
        }
            break;
        case 2:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            
            //本地图片
            
            UIImage *image1=[UIImage imageNamed:@"res2.png"];
            
            NSArray *images =[NSArray arrayWithObjects:image1,image1,nil];
            
            [shareParams setupWeiboShareParamsByText:@"分享图片test"
                                              images:images
                                        webPageTitle:nil
                                          webPageUrl:nil
                                webPageThumbnailData:nil
                                            videoUrl:nil
                                                type:SSDKContentTypeImage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
        }
            break;
        case 3:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            //网络图片
            NSData *datai =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img.gfresh.cn/ekdoc/42958808.png"]];
            UIImage *image0 =  [UIImage imageWithData:datai];
            
            NSArray *images =[NSArray arrayWithObjects:image0,image0,nil];
            [shareParams setupWeiboShareParamsByText:@"分享网络图片 https://www.droibaas.com"
                                              images:images
                                        webPageTitle:nil
                                          webPageUrl:nil
                                webPageThumbnailData:nil
                                            videoUrl:nil
                                                type:SSDKContentTypeImage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
            
            
        }
            break;
        case 4:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //3.分享网页链接 webPageTitle webPageUrl webPageThumbnailData 必须要有值才能成功
            //webPageUrl 如果是个网络视频也是可以的@"http://www.iqiyi.com/v_19rramjrr8.html"
            
            //缩略图为本地
            
            //多媒体内容中缩略图大小不能大于32K
            
            UIImage *image1=[UIImage imageNamed:@"res1thumb.png"];
            NSData *localData = UIImagePNGRepresentation(image1);
            
            //请求慢 请加上加载框
            [shareParams setupWeiboShareParamsByText:nil
                                              images:nil
                                        webPageTitle:@"test Title"
                                          webPageUrl:@"http://www.mob.com"
                                webPageThumbnailData:localData
                                            videoUrl:nil
                                                type:SSDKContentTypeWebPage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 5:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //3.分享网页链接 webPageTitle webPageUrl webPageThumbnailData 必须要有值才能成功
            
            //多媒体内容中缩略图大小不能大于32K
            //缩略图为网络图片
            NSData *networkData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img.gfresh.cn/supplier_brand/20170823/61939922.jpg"]];//https://img.gfresh.cn/ekdoc/42958808.png 大于32k 请更换自己的网络图片大小不能大于32K
            
            //请求慢 请加上加载框
            
            [shareParams setupWeiboShareParamsByText:nil
                                              images:nil
                                        webPageTitle:@"test Title"
                                          webPageUrl:@"http://www.mob.com"
                                webPageThumbnailData:networkData
                                            videoUrl:nil
                                                type:SSDKContentTypeWebPage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
            
            
        }
            break;
        case 6:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //3.分享视频链接 webPageTitle webPageUrl webPageThumbnailData 必须要有值才能成功
            
            
            //webPageUrl 如果是个网络视频也是可以的@"http://www.iqiyi.com/v_19rramjrr8.html"
            
            
            //缩略图为本地
            //    多媒体内容中缩略图大小不能大于32K
           
            
            
            UIImage *image1=[UIImage imageNamed:@"res1thumb.png"];
            NSData *localData = UIImagePNGRepresentation(image1);
            
            //请求慢 请加上加载框
            
            [shareParams setupWeiboShareParamsByText:nil
                                              images:nil
                                        webPageTitle:@"test video"
                                          webPageUrl:@"http://www.iqiyi.com/v_19rramjrr8.html"
                                webPageThumbnailData:localData
                                            videoUrl:nil
                                                type:SSDKContentTypeVideo];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
        }
            break;
        case 7:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //4.分享视频  必须传videoUrl
            //本地视频
            NSURL *videoUrl = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"apm" ofType:@"mov"]];
            
            
            [shareParams setupWeiboShareParamsByText:@"分享的视频"
                                              images:nil
                                        webPageTitle:nil
                                          webPageUrl:nil
                                webPageThumbnailData:nil
                                            videoUrl:videoUrl
                                                type:SSDKContentTypeVideo];
            
            __weak typeof(self) weakSelf = self;
            [[DroiSinaWeiboShareSDK defaultSinaWeiboShareSDK] weiboShare:SSDKPlatformTypeSinaWeibo parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                
                [weakSelf shareResponseWithState:state];
            }];
            
            
        }
            break;
            
        default:
            break;
    }
}

- (void)shareResponseWithState:(NSUInteger)state
{
    switch (state) {
        case SSDKResponseStateSuccess:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
            break;
        case SSDKResponseStateFail:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
            break;
        case SSDKResponseStateCancel:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享已取消"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
            break;
            
        default:
            break;
    }
}

@end
