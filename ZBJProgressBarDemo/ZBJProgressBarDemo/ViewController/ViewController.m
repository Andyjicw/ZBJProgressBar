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
- (void) test {
    
    
    /*
     
     UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
     [self.view addSubview:imageView];
     
     self.view.backgroundColor=[UIColor blueColor];
     
     UIGraphicsBeginImageContext(imageView.frame.size);
     [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
     CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
     CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 15.0);
     CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
     CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
     CGContextBeginPath(UIGraphicsGetCurrentContext());
     CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 100, 100);
     CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 200, 100);
     CGContextStrokePath(UIGraphicsGetCurrentContext());
     imageView.image=UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     */
    
    
    
    // 创建Quartz上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 填充矩形
    CGContextSetRGBFillColor(context, 0.6f, 0.6f, 0.6f, 1.0f);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 320.0f, 460.0f));
    
    // 创建一个Path句柄
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    // 初始化该path到一个初始点
    CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, 0.0f, 0.0f);
    
    // 添加一条直线，从初始点到该函数指定的坐标点
    CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, 50.0f, 100.0f);
    
    // 关闭该path
    CGPathCloseSubpath(pathRef);
    
    // 设置描边颜色
    CGContextSetRGBStrokeColor(context, 0.99f, 0.01f, 0.02f,1.0f);
    
    // 将此path添加到Quartz上下文中
    CGContextAddPath(context, pathRef);
    
    // 对上下文进行描边
    CGContextStrokePath(context);
    
    // 释放该path
    CGPathRelease(pathRef);
}
@end
