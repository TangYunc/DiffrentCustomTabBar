//
//  BaseNavViewController.m
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/7.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@property(nonatomic) UIActivityIndicatorView *loadingView;

@end

@implementation BaseNavViewController

//- (void)loadView
//{
//    [super loadView];
//    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]){
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = UIColorFromRGB(246,246,249);
    self.navigationItem.leftBarButtonItem  = [self leftNavigationItem];
    self.navigationItem.rightBarButtonItem = [self rightNavigationItem];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.translucent = NO;
    [self setUpNavStyle];
    
}


- (UIBarButtonItem *)leftNavigationItem
{
    return nil;
}

- (UIBarButtonItem *)rightNavigationItem
{
    return nil;
}

- (void)startLoading
{
    if (nil == _loadingView){
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [[UIApplication sharedApplication].keyWindow addSubview:_loadingView];
        _loadingView.center = [UIApplication sharedApplication].keyWindow.center;
    }
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = NO;
    [_loadingView startAnimating];
}

- (void)stopLoading
{
    [UIApplication sharedApplication].keyWindow.userInteractionEnabled = YES;
    [_loadingView stopAnimating];
    [_loadingView removeFromSuperview];
    _loadingView = nil;
}

/**
 *  设置导航栏样式，子类可以复写该方法设置自己导航栏样式
 */
- (void)setUpNavStyle
{
    
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
