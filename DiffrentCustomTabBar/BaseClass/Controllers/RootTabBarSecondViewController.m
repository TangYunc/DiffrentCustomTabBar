//
//  RootTabBarSecondViewController.m
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "RootTabBarSecondViewController.h"
#import "BaseNavigationViewController.h"
#import "ViewController.h"
#import "CenterViewController.h"

#import "CustomSecondTabBar.h"

@interface RootTabBarSecondViewController ()<CustomSecondTabBarDelegate>

@property (nonatomic, strong) CustomSecondTabBar *customSecondTabBar;
@end

@implementation RootTabBarSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)setUpUI{
    CustomSecondTabBar *customSecondTabBar = [[CustomSecondTabBar alloc] init];
    customSecondTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customSecondTabBar];
    self.customSecondTabBar = customSecondTabBar;
    
    self.customSecondTabBar.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *subView in self.tabBar.subviews) {
        if ([subView isKindOfClass:[UIControl class]]) {
            [subView removeFromSuperview];
        }
    }
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [child removeFromSuperview];
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //01 首页
        ViewController *homeVC = [[ViewController alloc] init];
        homeVC.view.backgroundColor = [UIColor whiteColor];
        [self addOneChildViewController:homeVC title:@"首页" norImage:@"HomeNormal" selectedImage:@"HomeSelected"];
        //02 消息
        ViewController *messageVC = [[ViewController alloc] init];
        messageVC.view.backgroundColor = [UIColor whiteColor];
        //        CounselingViewController *counselingVC = [[CounselingViewController alloc] init];
        //        counselingVC.view.backgroundColor = [UIColor whiteColor];
        [self addOneChildViewController:messageVC title:@"消息" norImage:@"CounselingNormal" selectedImage:@"CounselingSelected"];
        //03 采购料单
        ViewController *purchaseVC = [[ViewController alloc] init];
        purchaseVC.view.backgroundColor = [UIColor whiteColor];
        [self addOneChildViewController:purchaseVC title:@"购物车" norImage:@"PurchaseNormal" selectedImage:@"PurchaseSelected"];
        //02 我的
        ViewController *mineVC = [[ViewController alloc] init];
        mineVC.view.backgroundColor = [UIColor whiteColor];
        [self addOneChildViewController:mineVC title:@"我的" norImage:@"MineNormal" selectedImage:@"MineSelected"];
    }
    return self;
}

-(void)addOneChildViewController:(UIViewController *)childVc title:(NSString *)title norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:norImage];
    
    UIImage *selImage = [UIImage imageNamed:selectedImage];
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selImage;
    
    
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    [self.customSecondTabBar  addTabBarButton:childVc.tabBarItem];
    
}

#pragma mark - YDTabBarDelegate
-(void)tabBar:(CustomSecondTabBar *)tabBar from:(NSInteger)from to:(NSInteger)to
{
    NSLog(@"%zd",to);
    
    self.selectedIndex = to;
}

-(void)tabBarPresentViewController:(CustomSecondTabBar *)tabBar{
    
}
-(void)selectTabItem:(NSInteger)index{
    NSLog(@"index:%ld",(long)index);
}

#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(CustomSecondTabBar *)tabBar{
    
    CenterViewController *centerVC = [[CenterViewController alloc] init];
    centerVC.view.backgroundColor = [UIColor whiteColor];
    BaseNavigationViewController *navVC = [[BaseNavigationViewController alloc] initWithRootViewController:centerVC];
    [self presentViewController:navVC animated:YES completion:nil];
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
