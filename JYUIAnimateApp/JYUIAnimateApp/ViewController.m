//
//  ViewController.m
//  JYUIAnimateApp
//
//  Created by yuzhelun on 2016/11/22.
//  Copyright © 2016年 Julie Yu. All rights reserved.
//

#import "ViewController.h"
#import <JYUIAnimate/JYUIAnimate.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    JYUIAnimateView *animateView = [[JYUIAnimateView alloc] initWithFrame:screenBounds];
    [self.view addSubview:animateView];
    [animateView startAnimation];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1" inBundle:[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"JYUIAnimate" ofType: @"bundle"]] compatibleWithTraitCollection:nil]];
    imageView.frame = CGRectMake((screenBounds.size.width - 40) / 2, (screenBounds.size.height - 40) / 2, 40, 40);
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
