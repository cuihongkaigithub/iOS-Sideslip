//
//  CHKNavigationController.m
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import "CHKNavigationController.h"

@interface CHKNavigationController ()

@end

@implementation CHKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"push" object:self];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    [super popViewControllerAnimated:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pop" object:self];
    return self.viewControllers.lastObject;
}

@end
