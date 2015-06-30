//
//  RootViewController.m
//  CustomTabBar
//
//  Created by qianfeng on 14-8-30.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

//#define ADD @"add"
//#define CLEAR @"clear"
//#define GROUP @"group"
//#define MORE @"more"

@interface RootViewController ()
@property (nonatomic, strong) NSString * m_leftType;
@property (nonatomic, strong) NSString * m_rightType;
@end

@implementation RootViewController

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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbarBG.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor =[UIColor whiteColor];
}
//子类调用这个方法，设置了左右两个按钮
- (void)createNavigationBarWithLeftType:(NSString *)leftType andRightType:(NSString *)rightType
{
    self.m_leftType = leftType;
    self.m_rightType = rightType;
    
    [self createLeftItem:leftType andRightType:rightType];
}

- (void)createLeftItem:(NSString *)leftType andRightType:(NSString *)rightType
{
    NSLog(@"left type == %@", leftType);
    NSLog(@"right type == %@", rightType);

    if (leftType) {  //创建左边的button
        NSString * normalImage = nil;
        NSString * selectedImage = nil;
        
        if ([leftType isEqualToString:ADD]) {
            normalImage = @"addNavItemNormal.png";
            selectedImage = @"addNavItemSelected.png";
            NSLog(@"left add");
        } else if ([leftType isEqualToString:CLEAR]) {
            normalImage = @"clearNavItemNormal.png";
            selectedImage = @"clearNavItemSelected.png";
            NSLog(@"left clear");

        } else if ([leftType isEqualToString:GROUP]) {
            normalImage = @"GroupNavItemNormal.png";
            selectedImage = @"GroupNavItemSelected.png";
            NSLog(@"left group");

        } else if ([leftType isEqualToString:MORE]) {
            normalImage = @"moreNavItemNormal.png";
            selectedImage = @"moreNavItemSelected.png";
            NSLog(@"left more");

        }
        
        NSLog(@"left\n");
        NSLog(@"normalImage == %@", normalImage);
        NSLog(@"selectedImage == %@", selectedImage);
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 66, 44);
        [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        
        [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(leftButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = item;
    }
    
    if (rightType) {   //创建右边的button
        NSLog(@"rightType------->%@", rightType);
        NSString * normalImage = nil;
        NSString * selectedImage = nil;
        
        if ([rightType isEqualToString:ADD]) {
            normalImage = @"addNavItemNormal.png";
            selectedImage = @"addNavItemSelected.png";
            NSLog(@"right add");

        } else if ([rightType isEqualToString:CLEAR]) {
            normalImage = @"clearNavItemNormal.png";
            selectedImage = @"clearNavItemSelected.png";
            NSLog(@"right clear");

        } else if ([rightType isEqualToString:GROUP]) {
            normalImage = @"GroupNavItemNormal.png";
            selectedImage = @"GroupNavItemSelected.png";
            NSLog(@"right group");

        } else if ([rightType isEqualToString:MORE]) {
            normalImage = @"moreNavItemNormal.png";
            selectedImage = @"moreNavItemSelected.png";
            NSLog(@"right more");

        }
        
        NSLog(@"right\n");
        NSLog(@"normalImage == %@", normalImage);
        NSLog(@"selectedImage == %@", selectedImage);
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 66, 44);
        [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        
        [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
        
        [button addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)rightButtonPressed:(UIButton *)button
{
    NSLog(@"rightButtonPressed in root");
}

- (void)leftButtonPressed:(UIButton *)button
{
    NSLog(@"leftButtonPressed in root");
}

/*- (void)createLeftItem
{
    NSString * normalImage = nil;
    NSString * selectedImage = nil;
    
    if ([self.m_leftType isEqualToString:ADD]) {
        normalImage = @"addNavItemNormal.png";
        selectedImage = @"addNavItemSelected.png";
    } else if ([self.m_leftType isEqualToString:CLEAR]) {
        normalImage = @"clearNavItemNormal.png";
        selectedImage = @"clearNavItemSelected.png";
        
    } else if ([self.m_leftType isEqualToString:GROUP]) {
        normalImage = @"GroupNavItemNormal.png";
        selectedImage = @"GroupNavItemSelected.png";
        
        
    } else if ([self.m_leftType isEqualToString:MORE]) {
        normalImage = @"moreNavItemNormal.png";
        selectedImage = @"moreNavItemSelected.png";
    }
    
//    [self createItemIsLeft:YES  andNormalImageName:normalImage andSelectedImageName:selectedImage];
    
    NSLog(@"left\n");
    NSLog(@"normalImage == %@", normalImage);
    NSLog(@"selectedImage == %@", selectedImage);
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 66, 44);
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonPressed:andIsLeft:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
    
}
*/
/*- (void)createRightItem
{
    NSLog(@"right type == %@", self.m_rightType);
    NSString * normalImage = nil;
    NSString * selectedImage = nil;
    
    if ([self.m_leftType isEqualToString:ADD]) {
        normalImage = @"addNavItemNormal.png";
        selectedImage = @"addNavItemSelected.png";
    } else if ([self.m_leftType isEqualToString:CLEAR]) {
        normalImage = @"clearNavItemNormal.png";
        selectedImage = @"clearNavItemSelected.png";

    } else if ([self.m_leftType isEqualToString:GROUP]) {
        normalImage = @"GroupNavItemNormal.png";
        selectedImage = @"GroupNavItemSelected.png";


    } else if ([self.m_leftType isEqualToString:MORE]) {
        normalImage = @"moreNavItemNormal.png";
        selectedImage = @"moreNavItemSelected.png";
        
        NSLog(@"right more");
    }
    
//    [self createItemIsLeft:NO  andNormalImageName:normalImage andSelectedImageName:selectedImage];
    
    NSLog(@"right\n");
    NSLog(@"normalImage == %@", normalImage);
    NSLog(@"selectedImage == %@", selectedImage);
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 66, 44);
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(buttonPressed:andIsLeft:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    

}*/

/*- (void)createItemIsLeft:(BOOL)isLeft andNormalImageName:(NSString *)normalName andSelectedImageName:(NSString *)selectedName
{
    NSLog(@"normalImage == %@", normalName);
    NSLog(@"selectedImage == %@", normalName);

    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 66, 44);
    [button setBackgroundImage:[UIImage imageNamed:normalName] forState:UIControlStateNormal];
    
     [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
    
    [button setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateHighlighted];
   
    [button addTarget:self action:@selector(buttonPressed:andIsLeft:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
}
*/
- (void)buttonPressed:(UIButton *)button andIsLeft:(BOOL)isLeft
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
