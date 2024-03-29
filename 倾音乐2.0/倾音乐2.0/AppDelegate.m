//
//  AppDelegate.m
//  倾音乐2.0
//
//  Created by qingyun on 14-7-18.
//  Copyright (c) 2014年 MJ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MJsongList.h"
#import "MJmainList.h"
#import "IIViewDeckController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    判断登陆状况
    if (![enterState boolForKey:@"secondEnter"]) {
        [enterState setBool:YES forKey:@"secondEnter"];
        [enterState setBool:YES forKey:@"firstEnter"];
    }else{
        [enterState setBool:NO forKey:@"firstEnter"];
    }
    
        
    ViewController *enter = [[ViewController alloc]init];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:enter];
    
    _mainList =[[MJmainList alloc]init];
    
    _songList = [[MJsongList alloc]init];
    
    _desk = [[IIViewDeckController alloc]initWithCenterViewController:navigationController leftViewController:_mainList rightViewController:_songList];

            _desk.leftSize=150;
            _desk.rightSize=100;
    
        self.window.rootViewController = _desk;
    
        self.window.backgroundColor = [UIColor whiteColor];
    
       [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
