//
//  AppDelegate.m
//  DroiShareSDKDemo
//
//  Created by zxl on 17/9/25.
//  Copyright © 2017年 Droi. All rights reserved.
//jsh test

#import "AppDelegate.h"

#import "WeiboSDK.h"
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "DroiOAuthSinaProvider.h"
#import "DroiOAuthQQProvider.h"
#import "DroiOAuthWeixinProvider.h"
#import <DroiCoreSDK/DroiCoreSDK.h>
#import <DroiShare/DroiShare.h>
#import <DroiQQShare/DroiQQShare.h>
#import <DroiWechatShare/DroiWechatShare.h>
#import <DroiSinaWeiboShare/DroiSinaWeiboShare.h>



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [DroiSinaWeiboShareSDK setupSinaWeiboByAppKey:@"948975021" appSecret:@"91dbe522054ba8d4c02b1e3ac72799a9" redirectUrl:@"https://api.weibo.com/oauth2/default.html"];
    [DroiWechatShareSDK setupWeChatByAppId:@"wx91dba24c246fd144" appSecret:@"afe85b6a805bc9da0197d874687f2db8"];
    [DroiQQShareSDK setupQQByAppId:@"101435528" appKey:@"4816da96391b0172acba031645e2a475"];
    [DroiCore initializeCore];
    [DroiOAuthSinaProvider initializeSDK];
    [DroiOAuthQQProvider initializeSDK];
    [DroiOAuthWeixinProvider initializeSDK];
    [DroiShareSDK initializeWithAPIKey:@""];
//    [WeiboSDK enableDebugMode:YES];
//    [WeiboSDK enableDebugMode:NO];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
//    NSLog(@"3.处理url=%@",url);
//    NSLog(@"3.处理sourceApplication=%@",sourceApplication);
    
    
    
    if ([url.description hasPrefix:@"wb"]) {
        
        [DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
        return [WeiboSDK handleOpenURL:url delegate:[DroiSinaWeiboShareResponse defaultSinaWeiboShareResponse]];
        
    }else if ([url.description hasPrefix:@"wx"]){
        [WXApi handleOpenURL:url delegate:[DroiWechatShareResponse defaultWechatShareResponse]];
        return [DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
    }else{
        [DroiOAuthProvider handleOpenUrl:url sourceApplication:sourceApplication annotation:annotation];
        return  [QQApiInterface handleOpenURL:url delegate:[DroiQQShareResponse defaultQQShareResponse]];
        
        
    }
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
//    NSLog(@"4.处理url=%@",url);
    
    if ([url.description hasPrefix:@"wb"]) {
        
        [DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];
        return [WeiboSDK handleOpenURL:url delegate:[DroiSinaWeiboShareResponse defaultSinaWeiboShareResponse]];
        
    }else if ([url.description hasPrefix:@"wx"]){
        [WXApi handleOpenURL:url delegate:[DroiWechatShareResponse defaultWechatShareResponse]];
        return [DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];
        
    }else{
        [DroiOAuthProvider handleOpenUrl:url sourceApplication:nil annotation:nil];
        return  [QQApiInterface handleOpenURL:url delegate:[DroiQQShareResponse defaultQQShareResponse]];
        
    }
    
    
}



@end
