//
//  WechatTimelineVC.m
//  DroiShareSDK
//
//  Created by zxl on 17/9/15.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import "WechatTimelineVC.h"

#import <DroiWechatShare/DroiWechatShare.h>

@interface WechatTimelineVC ()
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end

@implementation WechatTimelineVC

- (NSMutableArray *)dataSourceArray
{
    if (_dataSourceArray == nil) {
        _dataSourceArray =[NSMutableArray array];
        
        [_dataSourceArray addObject:@"分享文本到微信朋友圈"];
        
        [_dataSourceArray addObject:@"分享（本地图片）到朋友圈"];
        [_dataSourceArray addObject:@"分享（网络图片）到朋友圈"];
        
        [_dataSourceArray addObject:@"分享网页链接(缩略图为本地图片)到朋友圈"];
        [_dataSourceArray addObject:@"分享网页链接(缩略图为网络图片)到朋友圈"];        
        [_dataSourceArray addObject:@"分享网络视频(缩略图为本地图片)到朋友圈"];
        [_dataSourceArray addObject:@"分享网络视频(缩略图为网络图片)到朋友圈"];
        
        
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
            //分享文字
            [shareParams  setupWeChatParamsByText:@"文本内容" sendImageData:nil thumbImage:nil videoUrlOrLinkUrl:nil title:nil description:nil type:SSDKContentTypeText];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 1:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //分享本地图片
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
            NSData *localData = [NSData dataWithContentsOfFile:filePath];//分享图片
            
            UIImage *localImage = [UIImage imageNamed:@"res1thumb.png"];//缩略图
            [shareParams  setupWeChatParamsByText:nil sendImageData:localData thumbImage:localImage videoUrlOrLinkUrl:nil title:nil description:nil type:SSDKContentTypeImage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 2:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //网络图片
            NSData *networkData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"]];
            UIImage *networkImage=  [UIImage imageWithData:networkData];
            
            
            [shareParams  setupWeChatParamsByText:nil sendImageData:networkData thumbImage:networkImage videoUrlOrLinkUrl:nil title:nil description:nil type:SSDKContentTypeImage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 3:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //分享网页链接
            //缩略图为本地
            UIImage *localThumbImage = [UIImage imageNamed:@"res2.png"];//缩略图
            [shareParams setupWeChatParamsByText:nil sendImageData:nil thumbImage:localThumbImage videoUrlOrLinkUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" title:@"新闻标题" description:@"新闻描述" type:SSDKContentTypeWebPage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 4:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //分享网页链接
            //缩略图为网络图片
            NSData *networkData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"]];
            UIImage *networkThumbImage=  [UIImage imageWithData:networkData];
            
            
            [shareParams setupWeChatParamsByText:nil sendImageData:nil thumbImage:networkThumbImage videoUrlOrLinkUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" title:@"新闻标题" description:@"新闻描述" type:SSDKContentTypeWebPage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 5:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //分享视频  //缩略图为本地
            UIImage *localThumbImage = [UIImage imageNamed:@"res2.png"];//缩略图
            
            [shareParams setupWeChatParamsByText:nil sendImageData:nil thumbImage:localThumbImage videoUrlOrLinkUrl:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html" title:@"视频标题" description:@"视频描述" type:SSDKContentTypeVideo];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 6:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            //分享视频
            //缩略图为网络图片
            NSData *networkData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img.gfresh.cn/ekdoc/42958808.png"]];
            UIImage *networkThumbImage=  [UIImage imageWithData:networkData];
            
            
            [shareParams setupWeChatParamsByText:nil sendImageData:nil thumbImage:networkThumbImage videoUrlOrLinkUrl:@"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html" title:@"视频标题" description:@"视频描述" type:SSDKContentTypeVideo];
            
            __weak typeof(self) weakSelf = self;
            [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatTimeline parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
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
