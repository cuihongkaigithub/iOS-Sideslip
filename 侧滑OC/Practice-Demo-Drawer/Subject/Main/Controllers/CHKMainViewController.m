//
//  CHKMainViewController.m
//  Practice-Demo-Drawer
//
//  Created by IOSDEV on 16/8/15.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

#import "CHKMainViewController.h"

@interface CHKMainViewController ()

@end

@implementation CHKMainViewController {
    UIViewController *_mainVC;
    UIViewController *_leftVC;
    CGPoint _point;
    CGPoint _changePoint;
    BOOL _openLeftVC;
    UIView *_rightView;
    UIPanGestureRecognizer *_pan;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _openLeftVC = NO;
    _rightView = [[UIView alloc] initWithFrame:CGRectMake(0.8 * SCREEN_WIDTH, 0, 0.2 * SCREEN_WIDTH, SCREEN_HEIGHT)];
    [_rightView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:_pan];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getPushNotificationCenter) name:@"push" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getPopNotificationCenter) name:@"pop" object:nil];
}

- (void)tap {
    _openLeftVC = NO;
    [self hiddenLeftView];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            _leftVC.view.hidden = NO;
            _point = [sender locationInView:self.view];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            _changePoint = [sender locationInView:self.view];
            float width = _changePoint.x - _point.x;
            if (_openLeftVC == NO) {
                if (width <= 0) {
                    return;
                }
                if (width >= 0.8 * SCREEN_WIDTH) {
                    width = 0.8 * SCREEN_WIDTH;
                }
                _mainVC.view.x = width;
                _leftVC.view.centerX = width/2;
            } else {
                float width = _point.x - _changePoint.x;
                if (width <= 0) {
                    return;
                }
                if (width >= 0.8 * SCREEN_WIDTH) {
                    width = 0.8 * SCREEN_WIDTH;
                }
                _mainVC.view.x = 0.8 * SCREEN_WIDTH - width;
                _leftVC.view.centerX = 0.4 *SCREEN_WIDTH - width/2;
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            [sender setTranslation:CGPointZero inView:self.view];
            if (_mainVC.view.x < 0.5 * SCREEN_WIDTH) {
                _openLeftVC = NO;
                [self hiddenLeftView];
            } else {
                _openLeftVC = YES;
                [self showLeftView];
            }
        }
            break;
        default:
            break;
    }
}

- (void)hiddenLeftView {
    [UIView animateWithDuration:0.5 animations:^{
        _leftVC.view.width = SCREEN_WIDTH;
        _leftVC.view.x = -0.4 *SCREEN_WIDTH;
        _mainVC.view.x = 0;
    } completion:^(BOOL finished) {
        _leftVC.view .hidden = YES;
        [_rightView removeFromSuperview];
    }];
}

- (void)showLeftView {
    [UIView animateWithDuration:0.5 animations:^{
        _leftVC.view.width = 0.8 * SCREEN_WIDTH;
        _leftVC.view.x = 0;
        _mainVC.view.x = 0.8 * SCREEN_WIDTH;
    } completion:^(BOOL finished) {
        [self.view addSubview:_rightView];
    }];
}

- (instancetype)initLeftViewController:(UIViewController *)leftVC widthMainVC:(UIViewController *)mainVC{
    _mainVC = mainVC;
    _leftVC = leftVC;
    _leftVC.view.frame = CGRectMake(-0.4 * SCREEN_WIDTH, 0, 0.8 * SCREEN_WIDTH, SCREEN_HEIGHT);
    _leftVC.view.hidden = YES;
    [self.view addSubview:_leftVC.view];
    _mainVC.view.frame = self.view.bounds;
    [self.view addSubview:_mainVC.view];
    return self;
}

- (void)getPushNotificationCenter {
    [self.view removeGestureRecognizer:_pan];
}
- (void)getPopNotificationCenter {
    [self.view addGestureRecognizer:_pan];
}


@end
