//
//  AppDelegate.m
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import "AppDelegate.h"
#import "CHKTabBarController.h"
#import "CHKMyViewController.h"
#import "CHKMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self createWindow];
    
    return YES;
}

- (void)createWindow {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    _window.rootViewController = [self createRootViewController];
}

- (UIViewController *)createRootViewController {
    CHKMyViewController *myVC = [[CHKMyViewController alloc] init];
    CHKTabBarController *tab = [[CHKTabBarController alloc] init];
    NSArray *arr = [self createTabBarItems];
    [tab addItemsByTitles:arr[0] Images:arr[1] HightImages:arr[2] ClassNames:arr[3]];
    
    CHKMainViewController *main = [[CHKMainViewController alloc] init];
    return [main initLeftViewController:myVC widthMainVC:tab];
}

- (NSArray *)createTabBarItems {
    return @[
             @[@"首页",@"游玩",@"聊天",@"更多"],
             @[@"icon_0",@"icon_1",@"icon_2",@"icon_3"],
             @[@"icon_0_select",@"icon_1_select",@"icon_2_select",@"icon_3_select"],
             @[@"CHKHomeViewController",@"CHKPlayViewController",@"CHKChatViewController",@"CHKMoreViewController"]
             ];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
