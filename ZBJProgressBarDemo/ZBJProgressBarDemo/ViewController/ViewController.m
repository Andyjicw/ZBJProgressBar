//
//  ViewController.m
//  ZBJProgressBarDemo
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "ViewController.h"

#import "ZBJProgressBar.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = [NSArray arrayWithObjects:@"待付款", @"已付款", @"待发货",  @"已收货",  @"一一", nil];
    
    ZBJProgressBar *progressBar = [[ZBJProgressBar alloc] initWithFrame:CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 80)];
    
//    progressBar.barColor         = [UIColor grayColor];
//    progressBar.tintColor        = [UIColor colorWithRed:40.0/255.0 green:164.0/255.0 blue:176.0/255.0 alpha:1.0];
//    progressBar.selectLinesHeight      = 1.0;
//    progressBar.lineHeight = 2.0;
//    progressBar.dotsWidth        = 10.0;
//    progressBar.titleFont        = [UIFont fontWithName:@"Helvetica" size:14];
//    progressBar.titleSpace       = 10;
//    progressBar.currentStep      = 1;
    
    progressBar.titleArr         = arr;
    [self.view addSubview:progressBar];
}

@end
