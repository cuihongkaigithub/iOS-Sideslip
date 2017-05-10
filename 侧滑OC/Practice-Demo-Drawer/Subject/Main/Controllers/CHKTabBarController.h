//
//  CHKTabBarController.h
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHKTabBarController : UITabBarController



- (void)addItemByTitle:(NSString *)title Image:(NSString *)imageName HightImage:(NSString *)hightName ClassName:(NSString *)className;

- (void)addItemsByTitles:(NSArray *)titles Images:(NSArray *)imageNames HightImages:(NSArray *)hightNames ClassNames:(NSArray *)classNames;

@end
