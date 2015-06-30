//
//  CustomTabBar.m
//  CustomTabBar
//
//  Created by qianfeng on 14-8-30.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "CustomTabBar.h"
#define BUTTON_COUNT 4
#define BUTTON_START_TAG 1000

@interface CustomTabBar ()
{
    CGRect m_frame;
    NSArray  *titleArray;
}

@property (nonatomic, strong) NSArray * m_arrNormal;
@property (nonatomic, strong) NSArray * m_arrSelected;

@end

@implementation CustomTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"custom tabBar initWithFrame");
        m_frame = frame;
        NSLog(@"m_frame == %@", NSStringFromCGRect(m_frame));
        [self setMemory];
        [self createButtons];
    }
    return self;
}

- (void)setMemory
{
    self.m_arrNormal = [NSArray arrayWithObjects:@"appItemNormal.png", @"contactsItemNormal.png", @"dynamicItemNormal.png", @"infoItemNormal.png", nil];
    self.m_arrSelected = [NSArray arrayWithObjects:@"appItemSelected.png", @"contactsItemSelected.png", @"dynamicItemSelected.png", @"infoItemSelected.png", nil];
    titleArray=@[@"第一",@"第二",@"第三",@"第四"];
    
}

- (void)createButtons
{
    for (NSUInteger i = 0; i < BUTTON_COUNT; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        button.frame = CGRectMake(0 + (m_frame.size.width / BUTTON_COUNT) * i, 0, (m_frame.size.width / BUTTON_COUNT), m_frame.size.height);
        button.tag = BUTTON_START_TAG + i;
        
        UILabel  *lable=[[UILabel alloc]initWithFrame:CGRectMake(button.frame.origin.x+30, button.frame.origin.y+30, button.frame.size.width, 20)];
        lable.font=[UIFont systemFontOfSize:12];
        lable.tag=2000+i;
        lable.text=titleArray[i];
        [self addSubview:lable];
        
//        UILabel  *lable2=[[UILabel alloc]initWithFrame:CGRectMake(button.frame.origin.x+30, button.frame.origin.y+30, button.frame.size.width, 20)];
//        lable2.font=[UIFont systemFontOfSize:10];
//        lable2.textColor=[UIColor redColor];
//        lable2.text=titleArray[i];
//        [self addSubview:lable2];
//        
        

        
        
        UIImage * normalImage = [UIImage imageNamed:[self.m_arrNormal objectAtIndex:i]];
        UIImage * selectedImage = [UIImage imageNamed:[self.m_arrSelected objectAtIndex:i]];
//        NSLog(@"selected image == %@", selectedImage);
        
        if (i == 0) {
            [button setBackgroundImage:selectedImage forState:
             UIControlStateNormal];
            lable.textColor=[UIColor blueColor];

        } else {
            [button setBackgroundImage:normalImage forState:
             UIControlStateNormal];

        }
        
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)buttonPressed:(UIButton *)button
{
    [self resetButtonImagesWithButton:button];
    
    // 必选的代理方法，如下调用，作用可以帮助排查必选的代理方法是否实现
    [self.m_delegate buttonPresedInCustomTabBar:button.tag - BUTTON_START_TAG];
    
    // 针对代理协议里面有可选的代理时使用的方法可，respondsToSelector 就是判断self.m_delegate指向的对象有没有，这个方法--> buttonPresedInCustomTabBar:
    if (self.m_delegate && [self.m_delegate respondsToSelector:@selector(buttonPresedInCustomTabBar:)]) {
        
    }
}

- (void)resetButtonImagesWithButton:(UIButton *)button
{
    
    for (NSUInteger i = 0; i < BUTTON_COUNT; i++) {
        UIButton * btn = (UIButton *)[self viewWithTag:i + BUTTON_START_TAG];
        NSString * normal = [self.m_arrNormal objectAtIndex:i];
        UIImage * normalImage = [UIImage imageNamed:normal];
        [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
        UILabel  *lable=(UILabel *)[self viewWithTag:2000+i] ;
        lable.textColor=[UIColor blackColor];
        
    }
    
    NSLog(@"button pressed");
    NSString * selected = [self.m_arrSelected objectAtIndex:button.tag - BUTTON_START_TAG];
    UIImage * selectedImage = [UIImage imageNamed:selected];
    [button setBackgroundImage:selectedImage forState:UIControlStateNormal];
    
    UILabel  *label=(UILabel *)[self viewWithTag:button.tag+1000];
    label.textColor=[UIColor blueColor];
    
    
    
    
}

/*
 NSLog(@"button pressed");
 NSString * selected = [self.m_arrSelected objectAtIndex:button.tag - BUTTON_START_TAG];
 UIImage * selectedImage = [UIImage imageNamed:selected];
 [button setBackgroundImage:selectedImage forState:UIControlStateNormal];

 */

/*
 [button setBackgroundImage:selectedImage forState:UIControlStateSelected];
 [button setBackgroundImage:
 selectedImage
 forState:UIControlStateHighlighted];
 */

@end
