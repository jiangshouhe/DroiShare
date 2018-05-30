//
//  ViewController.m
//  DroiShareSDKDemo
//
//  Created by zxl on 17/9/25.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import "ViewController.h"
//三方
#import "QQFriendVC.h"
#import "QQZoneVC.h"
#import "WechatTimelineVC.h"
#import "WechatSessionVC.h"
#import "WeiboVC.h"
#import "WXApi.h"

#import <DroiShare/DroiShare.h>
#import <DroiQQShare/DroiQQShare.h>
#import <DroiSinaWeiboShare/DroiSinaWeiboShare.h>
#import <DroiWechatShare/DroiWechatShare.h>

@interface ViewController ()

@end

@implementation ViewController

#pragma mark 默认ui分享
- (IBAction)shareUIAction:(id)sender {
    DroiShareDefaultUI *defaultUI = [[DroiShareDefaultUI alloc] initWithFrame:CGRectZero];
    [defaultUI show];
    defaultUI.type = ^(SSDKPlatformType type){
        //根据不同的平台类型进行分享
        switch (type){
            case SSDKPlatformSubTypeWechatTimeline:
            {
                //                 NSLog(@"微信朋友圈分享");
                [self wechatTimelineShareAction];
            }
                break;
            case SSDKPlatformSubTypeWechatSession:
            {
                //                 NSLog(@"微信好友分享");
                [self wechatSessionShareAction];
            }
                break;
            case SSDKPlatformTypeSinaWeibo:
            {
                
                //                 NSLog(@"新浪微博分享");
                [self sinaWeiboShareAction];
                
            }
                break;
            case SSDKPlatformSubTypeQQFriend:
            {
                
                //                 NSLog(@"QQ好友");
                [self qqFriendShareAction];
                
            }
                break;
            case SSDKPlatformSubTypeQZone:
            {
                
                //                 NSLog(@"QQ空间");
                [self qqZoneShareAction];
                
            }
                break;
            case SSDKPlatformSubTypeCopyLink:
            {
                
                                 NSLog(@"复制链接好了吧");
                
                
            }
                break;
                
            default:
                break;
        }
        
    };
}

- (IBAction)weiboShare:(id)sender {
    WeiboVC *vc =[[WeiboVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)weiboLogin:(id)sender {
    [DroiPlatformLogin getWeiboLoginUserInfo:^(SSDKResponseState state, DroiShareUser *user, DroiError *error) {
        
        if (state == SSDKResponseStateSuccess)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"微博登录成功"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
            
            NSLog(@"用户昵称：%@",user._NickName);
            NSLog(@"用户头像：%@",user._Avatar);
            NSLog(@"用户性别：%@",user._Gender);
            
        }else
        {
            NSLog(@"失败error：%@",error);
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"微博登录失败"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
        
        
    }];
    
}
- (IBAction)QQFriendShare:(id)sender {
    QQFriendVC *vc =[[QQFriendVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)QZoneShare:(id)sender {
    QQZoneVC *vc =[[QQZoneVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)QQLogin:(id)sender {
    
    [DroiPlatformLogin getQQLoginUserInfo:^(SSDKResponseState state, DroiShareUser *user, DroiError *error) {
        
        if (state == SSDKResponseStateSuccess)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录成功"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
            
            NSLog(@"用户昵称：%@",user._NickName);
            NSLog(@"用户头像：%@",user._Avatar);
            NSLog(@"用户性别：%@",user._Gender);
            
        }else
        {
            NSLog(@"失败error：%@",error);
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
        
        
    }];
    
}

- (IBAction)weixinFriendShare:(id)sender {
    WechatSessionVC *vc =[[WechatSessionVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)WechatTimelineShare:(id)sender {
    WechatTimelineVC *vc =[[WechatTimelineVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)weixinLogin:(id)sender {
    
    if ([WXApi isWXAppInstalled]==NO) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"请先安装微信 APP"
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    [DroiPlatformLogin getWeChatLoginUserInfo:^(SSDKResponseState state, DroiShareUser *user, DroiError *error) {
        
        if (state == SSDKResponseStateSuccess)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录成功"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
            
            NSLog(@"用户昵称：%@",user._NickName);
            NSLog(@"用户头像：%@",user._Avatar);
            NSLog(@"用户性别：%@",user._Gender);
            
        }else
        {
            NSLog(@"失败error：%@",error);
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败"
                                                                message:nil
                                                               delegate:nil
                                                      cancelButtonTitle:@"确定"
                                                      otherButtonTitles:nil];
            [alertView show];
        }
        
        
    }];
    
}

#pragma mark 默认UI-微信朋友圈分享
- (void)wechatTimelineShareAction{
    
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

#pragma mark 默认UI-微信好友分享
- (void)wechatSessionShareAction{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    //分享网页链接
    //缩略图为本地
    UIImage *localThumbImage = [UIImage imageNamed:@"res2.png"];//缩略图
    
    [shareParams setupWeChatParamsByText:nil sendImageData:nil thumbImage:localThumbImage videoUrlOrLinkUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" title:@"新闻标题" description:@"新闻描述" type:SSDKContentTypeWebPage];
    __weak typeof(self) weakSelf = self;
    [[DroiWechatShareSDK defaultWechatShareSDK] weChatShare:SSDKPlatformSubTypeWechatSession parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
        [weakSelf shareResponseWithState:state];
    }];
}

#pragma mark 默认UI-微博分享
- (void)sinaWeiboShareAction{
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    //3.分享网页链接 webPageTitle webPageUrl webPageThumbnailData 必须要有值才能成功
    //缩略图为本地
    //    多媒体内容中缩略图大小不能大于32K
    /**
     NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"DroiShareBundle" ofType:@"bundle"];//
     NSString *linePath = [bundlePath stringByAppendingPathComponent:@"res1thumb.png"];
     
     NSData* localData = [NSData dataWithContentsOfFile:linePath];*/
    
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

#pragma mark 默认UI-QQ好友分享
- (void)qqFriendShareAction{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    
    //分享链接
    //分享本地预览图片
    
    
    /**
     NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"DroiShareBundle" ofType:@"bundle"];//
     NSString *linePath = [bundlePath stringByAppendingPathComponent:@"res2.png"];
     NSData* localData = [NSData dataWithContentsOfFile:linePath];*/
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
    NSData *localData = [NSData dataWithContentsOfFile:filePath];//分享图片
    
    [shareParams setupQQParamsByText:nil title:@"分享链接标题" images:nil description:@"分享链接描述" webPageUrlOrVideoUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" previewImageURL:localData type:SSDKContentTypeWebPage];
    __weak typeof(self) weakSelf = self;
    [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQQFriend parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
        [weakSelf shareResponseWithState:state];
    }];
}

#pragma mark 默认UI-QQ空间分享
- (void)qqZoneShareAction{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    
    //分享链接
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"res2" ofType:@"png"];
    NSData *localData = [NSData dataWithContentsOfFile:filePath];
    
    [shareParams setupQQParamsByText:nil title:@"分享链接标题" images:nil description:@"分享链接描述" webPageUrlOrVideoUrl:@"http://tech.qq.com/zt2012/tmtdecode/252.htm" previewImageURL:localData type:SSDKContentTypeWebPage];
    
    __weak typeof(self) weakSelf = self;
    [[DroiQQShareSDK defaultQQShareSDK] qqShare:SSDKPlatformSubTypeQZone parameters:shareParams shareResponseBlock:^(SSDKResponseState state, NSString *errStr) {
        [weakSelf shareResponseWithState:state];
    }];
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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
