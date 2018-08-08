//
//  BaseViewController.m
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    /**
        1.默认情况下extendedLayoutIncludesOpaqueBars = NO 扩展布局不包含导航栏
        2.默认情况下automaticallyAdjustsScrollViewInsets = YES 自动计算滚动视图的内容边距
        3.当 导航栏 是 不透明时,而tabBar为透明的时候,为了正确显示tableView的全部内容,需要重新设置这两个属性的值,然后设置contentInset
        4.设置tableView的内边距(能够显示出导航栏和tabBar下覆盖的内容)
            --- tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0)
        5.设置内容指示器(滚动条)的内边距
            --- tableView.scrollIndicatorInsets = tableView.contentInset;
     */
    // 初始化导航栏
    //    [self setupNavigationBar];
}
-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage generateImageFromColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    
    // 去掉下划线
    [self hideNavigationBarShadowLine:YES];
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    if (viewControllers.count >1) {
        
        return;
        
    }else {
        
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (UIView *)navBarView {
    if (!_navBarView) {
        _navBarView = [[UIView alloc] init];
        _navBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"NavBG"]];
        _navBarView.frame = CGRectMake(0, 0, kScreenWidth, SafeAreaTopHeight);
    }
    return _navBarView;
}

- (void)hideNavigationBarShadowLine:(BOOL)hide{
    if (hide) {
        //隐藏导航栏下的线
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    else{
        [self.navigationController.navigationBar setShadowImage:nil];
    }
}

#pragma mark -初始化导航栏

- (void)setupNavigationBar {
    
    //导航栏 返回 按钮
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    if (viewControllers.count > 1){
        
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, SafeAreaTopHeight-65/2.0-6, 94/2.0, 65/2.0);
        [leftButton setImage:[UIImage imageNamed:@"BackNV"] forState:UIControlStateNormal];
        leftButton.adjustsImageWhenHighlighted = NO;
        [leftButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    }
    
    [self.view addSubview:self.navBarView];
}

#pragma mark - 设置返回按钮
- (void)setIsBackButton:(BOOL)isBackButton
{
    if (_isBackButton != isBackButton) {
        _isBackButton = isBackButton;
        
        if (_isBackButton == YES) {
            // 创建返回按钮
            UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
            backButton.frame = CGRectMake(0, 0, 56, 56);
            // 设置标题图片
            
            [backButton setImage:[UIImage imageNamed:@"BackNV"] forState:UIControlStateNormal];
            [backButton setImage:[UIImage imageNamed:@"BackNV"] forState:UIControlStateHighlighted];
            // 设置事件
            [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
            // 创建导航按钮设置到左侧
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        } else {
            self.navigationItem.leftBarButtonItem = nil;
        }
    }
}

#pragma mark -设置导航栏标题

-(void)setNavigationBarTitle:(NSString *)title {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, 20, kScreenWidth - 84, NavigationBar_HEIGHT )];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:17.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navBarView addSubview:titleLabel];
}

#pragma mark -- 提示控件
- (void)popdAlertViewIsAlertStyleWithTitle:(NSString *)title withMessage:(NSString *)message {
    
    //弹出alert视图提示输入账号密码
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了alert的取消按钮!");
    }];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了alert的确定按钮!");
    }];
    [alert addAction:cancel];
    [alert addAction:confirm];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)popdAlertViewIsActionSheetStyleWithTitle:(NSString *)title withMessage:(NSString *)message{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    //UIAlertControllerStyleAlert在中央屏幕。
    //UIAlertControllerStyleActionSheet在屏幕底部。
    UIAlertAction *useCamera = [UIAlertAction actionWithTitle:@"使用相机拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"这里是要调用相机拍照功能");
    }];
    UIAlertAction *desAction = [UIAlertAction actionWithTitle:@"destructive" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"这里是要调用销毁功能");
    }];
    UIAlertAction *usePhoto = [UIAlertAction actionWithTitle:@"使用相册照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"这里是要调用相册功能");
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:useCamera];
    [alertController addAction:desAction];
    [alertController addAction:usePhoto];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - 返回按钮事件
- (void)backAction:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
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
