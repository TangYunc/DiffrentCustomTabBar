//
//  CenterViewController.m
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "CenterViewController.h"
#import "NavigationBarView.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化
    [self setUpUI];
    
    // 初始化导航栏
    [self setupNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navBarView removeFromSuperview];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark -初始化子视图
- (void)setUpUI{
    NSLog(@"开始初始化");
}

#pragma mark -初始化导航栏
- (void)setupNavigationBar {
    
    NavigationBarView *navView = [[NavigationBarView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SafeAreaTopHeight) andLeftBtn:@"我是中心按钮哦"];
    navView.viewController = self;
    [self.view addSubview:navView];
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
