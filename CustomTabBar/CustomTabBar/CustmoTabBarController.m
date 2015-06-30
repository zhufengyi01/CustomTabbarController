//
//  CustmoTabBarController.m
//  CustomTabBar
//
//  Created by qianfeng on 14-8-30.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "CustmoTabBarController.h"
#import "FristViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FouthViewController.h"
#import "CustomTabBar.h"

@interface CustmoTabBarController ()<CustomTabBarDelegate>
@property (nonatomic, strong) CustomTabBar * m_tabBar;
@end

@implementation CustmoTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createControllers];
    [self createCustomTabBar];
}

- (void)createControllers
{
    FristViewController * firstVC = [[FristViewController alloc] init];
    UINavigationController * fristNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    
    SecondViewController * secondVC = [[SecondViewController alloc] init];
    UINavigationController * secondNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    ThirdViewController * thirdVC = [[ThirdViewController alloc] init];
    UINavigationController * thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    
    FouthViewController * fouthVC = [[FouthViewController alloc] init];
    UINavigationController * fouthNav = [[UINavigationController alloc] initWithRootViewController:fouthVC];
    NSArray * controllerArr = [NSArray arrayWithObjects:fristNav, secondNav, thirdNav, fouthNav, nil];
    self.viewControllers = controllerArr;
}

- (void)createCustomTabBar
{
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.m_tabBar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 49)];
    self.m_tabBar.m_delegate = self;
    self.m_tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbarBG.png"]]; // 设置tabar 的背景图片
    [self.tabBar addSubview:self.m_tabBar];
}
#pragma  mark ---
#pragma  mark ---   ---CustomTabBarDelegate  ----
#pragma  mark ---
- (void)buttonPresedInCustomTabBar:(NSUInteger)index
{
    self.selectedIndex = index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
