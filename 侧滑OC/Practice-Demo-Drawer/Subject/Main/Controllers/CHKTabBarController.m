//
//  CHKTabBarController.m
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import "CHKTabBarController.h"
#import "UIImage+LHCOriginalImage.h"

@implementation CHKTabBarController 


#pragma mark item相关方法
- (void)addItemByTitle:(NSString *)title Image:(NSString *)imgName HightImage:(NSString *)hightName ClassName:(NSString *)className{
    UIViewController *vc = [[[self getClassByClassName:className] alloc] init];
    vc.title = title;
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imgName] originalImage] selectedImage:[[UIImage imageNamed:hightName] originalImage]];
    [self addChildViewController:[[[self getClassByClassName:@"CHKNavigationController"] alloc] initWithRootViewController:vc]];
}

- (void)addItemsByTitles:(NSArray *)titles Images:(NSArray *)imageNames HightImages:(NSArray *)hightNames ClassNames:(NSArray *)classNames {
    for (NSInteger index = 0; index < titles.count; index++) {
        [self addItemByTitle:titles[index] Image:imageNames[index] HightImage:hightNames[index] ClassName:classNames[index]];
    }
}

@end
