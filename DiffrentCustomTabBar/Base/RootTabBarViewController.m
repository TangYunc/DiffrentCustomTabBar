//
//  RootTabBarViewController.m
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/7.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "CustomTabBar.h"
#import "ViewController.h"

@interface RootTabBarViewController ()<UITabBarControllerDelegate>

@property(nonatomic, strong)CustomTabBar *customTabBar;
@property (nonatomic, assign) NSUInteger selectItem;//选中的item
@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)setUpUI {
    _customTabBar = [[CustomTabBar alloc] init];
    [_customTabBar.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //选中时的颜色
    _customTabBar.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    _customTabBar.translucent = NO;
    //利用KVC 将自己的tabbar赋给系统tabBar
    [self setValue:_customTabBar forKeyPath:@"tabBar"];
    self.selectItem = 0; //默认选中第一个
    self.delegate = self;
    [self addChildViewControllers];
    //设置中间按钮为首页
    [self buttonAction:_customTabBar.centerBtn];
}

//添加子控制器
- (void)addChildViewControllers{
    
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"朋友圈" andImageName:@"btn_message" andSelectImage:@"btn_message_s"];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"聊天室" andImageName:@"btn_message" andSelectImage:@"btn_message_s"];
    //中间这个不设置东西，只占位
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"首页" andImageName:@"" andSelectImage:@""];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"E课堂" andImageName:@"btn_news" andSelectImage:@"btn_news_s"];
    [self addChildrenViewController:[[ViewController alloc] init] andTitle:@"我的" andImageName:@"btn_mine" andSelectImage:@"btn_mine_s"];
}

- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage =  [UIImage imageNamed:selectedImage];
    childVC.title = title;
    
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:baseNav];
}

- (void)buttonAction:(UIButton *)button{
    self.selectedIndex = 2;//关联中间按钮
    if (self.selectItem != 2){
        [self rotationAnimation];
    }
    self.selectItem = 2;
}

//tabbar选择时的代理
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (tabBarController.selectedIndex == 2){//选中中间的按钮
        if (self.selectItem != 2){
            [self rotationAnimation];
        }
    }else {
        [_customTabBar.centerBtn.layer removeAllAnimations];
    }
    self.selectItem = tabBarController.selectedIndex;
}

//旋转动画
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [_customTabBar.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
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
