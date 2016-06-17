//
//  ViewController.m
//  ZBJProgressBarDemo
//
//  Created by andy on 16/6/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "ViewController.h"

#import "ZBJProgressBar.h"

#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (nonatomic, strong) ZBJProgressBar *progressBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arr = [NSArray arrayWithObjects:@"待付款",@"已付款",@"待收货",@"已收货",nil];
    
    self.progressBar = [[ZBJProgressBar alloc] initWithFrame:CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 80)];
    self.progressBar.barColor         = [UIColor grayColor];
    self.progressBar.tintColor        = [UIColor colorWithRed:40.0/255.0 green:164.0/255.0 blue:176.0/255.0 alpha:1.0];
    self.progressBar.linesHeight      = 1.0;
    self.progressBar.filledLineHeight = 2.0;
    self.progressBar.dotsWidth        = 10.0;
    self.progressBar.titleFont        = [UIFont fontWithName:@"Helvetica" size:10];
    self.progressBar.titleSpace       = 10;
    self.progressBar.currentStep      = 3;
    self.progressBar.titleHeight      = 40;
    self.progressBar.titleArr         = arr;
    
    [self.view addSubview:self.progressBar];    
}

@end
