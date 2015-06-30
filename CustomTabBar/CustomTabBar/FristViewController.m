//
//  FristViewController.m
//  CustomTabBar
//
//  Created by qianfeng on 14-8-30.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "FristViewController.h"
#import "CommonViewController.h"
@interface FristViewController ()

@end

@implementation FristViewController

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
    [self setBasicCondition];
    [self createButton];
    [self createItems];
}

- (void)createItems
{
    [self createNavigationBarWithLeftType:ADD andRightType:MORE];
}

- (void)rightButtonPressed:(UIButton *)button
{
    [super rightButtonPressed:button];
    NSLog(@"right in first");
}

- (void)leftButtonPressed:(UIButton *)button
{
    [super leftButtonPressed:button];
    NSLog(@"left in first");
    [self pushToCommonViewController];
}

- (void)pushToCommonViewController
{
    CommonViewController * controller = [[CommonViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)setBasicCondition
{
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"第一";
}

- (void)createButton
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 120, 37);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)buttonPressed:(UIButton *)button
{
    //跳转
    CommonViewController * controller = [[CommonViewController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;   //隐藏了tabar
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
