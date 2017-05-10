//
//  CHKHomeViewController.m
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import "CHKHomeViewController.h"

@interface CHKHomeViewController ()

@end

@implementation CHKHomeViewController {
    UIButton *_touch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _touch = [UIButton buttonWithType:UIButtonTypeCustom];
    _touch.frame = CGRectMake(100, 100, 150, 100);
    [_touch setTitle:@"进入下一级界面" forState:UIControlStateNormal];
    [_touch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_touch addTarget:self action:@selector(butAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_touch];
}
- (void)butAction {
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
