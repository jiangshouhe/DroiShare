//
//  QQZoneVC.m
//  DroiShareSDK
//
//  Created by zxl on 17/9/14.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import "QQZoneVC.h"

#import <DroiQQShare/DroiQQShare.h>

@interface QQZoneVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property(nonatomic,strong)NSMutableArray *dataSourceArray;


@end



@implementation QQZoneVC

- (NSMutableArray *)dataSourceArray
{
    if (_dataSourceArray == nil) {
        _dataSourceArray =[NSMutableArray array];
        
         [_dataSourceArray addObject:@"分享纯文本到QQZone"];
        
         [_dataSourceArray addObject:@"分享（本地图片）到QQZone"];
         [_dataSourceArray addObject:@"分享（网络图片）到QQZone"];
        
        [_dataSourceArray addObject:@"分享网页链接(缩略图为本地图片)到空间"];
        [_dataSourceArray addObject:@"分享网页链接(缩略图为网络图片)到空间"];
        
        [_dataSourceArray addObject:@"分享网络视频(缩略图为本地图片)到空间"];
        [_dataSourceArray addObject:@"分享网络视频(缩略图为网络图片)到空间"];
        
        
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
            [shareParams setupQQParamsByText:@"分享文字" title:nil images:nil description:nil webPageUrlOrVideoUrl:nil previewImageURL:nil type:SSDKContentTypeText];
            
            
            
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
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
            
            NSArray *imagesArray =[NSArray arrayWithObjects:localData, nil];//数组元素只能为（NSData *）
            
            
            //title信息 分享到空间时不会显示
            [shareParams setupQQParamsByText:nil title:@"test分享本地图片" images:imagesArray description:nil webPageUrlOrVideoUrl:nil previewImageURL:nil type:SSDKContentTypeImage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
            
            
        }
            break;
        case 2:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            
            //网络图片
            NSData *networkData =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img.gfresh.cn/ekdoc/42958808.png"]];
            NSArray *imagesArray =[NSArray arrayWithObjects:networkData,networkData, nil];
            //title信息 分享到空间时不会显示
            [shareParams setupQQParamsByText:nil title:@"test分享网络图片" images:imagesArray description:nil webPageUrlOrVideoUrl:nil previewImageURL:nil type:SSDKContentTypeImage];
            
            //分享网络图片可能比较慢，请开发者自己加上加载框
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
            
        }
            break;
        case 3:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            
            //分享链接
            //分享本地预览图片
            
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
            NSData *localData = [NSData dataWithContentsOfFile:filePath];
            
            [shareParams setupQQParamsByText:nil title:@"分享链接标题" images:nil description:@"分享链接描述" webPageUrlOrVideoUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" previewImageURL:localData type:SSDKContentTypeWebPage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 4:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            
            //分享链接
            //网络预览图片
            NSURL *previewURL = [NSURL URLWithString:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"];
            NSData* networkData =[NSData dataWithContentsOfURL:previewURL];
            
            
            [shareParams setupQQParamsByText:nil title:@"分享链接标题" images:nil description:@"分享链接描述" webPageUrlOrVideoUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" previewImageURL:networkData type:SSDKContentTypeWebPage];
            
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
            
            
        }
            break;
            
        case 5:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            
            
            
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
            NSData *localData = [NSData dataWithContentsOfFile:filePath];
            
            
            //分享网络视频到QQ空间时,不会直接到发布界面。而是到QQ发送选择界面,请在这个界面选择发布到QQ空间()
            [shareParams setupQQParamsByText:nil title:@"分享视频标题" images:nil description:@"分享视频描述" webPageUrlOrVideoUrl:@"http://www.tudou.com/programs/view/_cVM3aAp270/" previewImageURL:localData type:SSDKContentTypeVideo];
            
            
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
                [weakSelf shareResponseWithState:state];
            }];
        }
            break;
        case 6:
        {
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            
            
            
            //网络预览图片
            NSURL *previewURL = [NSURL URLWithString:@"http://img1.gtimg.com/sports/pics/hv1/87/16/1037/67435092.jpg"];
            NSData* networkData =[NSData dataWithContentsOfURL:previewURL];
            
            
            //分享网络视频到QQ空间时,不会直接到发布界面。而是到QQ发送选择界面,请在这个界面选择发布到QQ空间()
            [shareParams setupQQParamsByText:nil title:@"分享视频标题" images:nil description:@"分享视频描述" webPageUrlOrVideoUrl:@"http://www.tudou.com/programs/view/_cVM3aAp270/" previewImageURL:networkData type:SSDKContentTypeVideo];
            
            
            __weak typeof(self) weakSelf = self;
            [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
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
