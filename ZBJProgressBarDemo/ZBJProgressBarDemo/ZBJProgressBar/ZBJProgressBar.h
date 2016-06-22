//
//  ZBJProgressBar.h
//  ZBJProgressBarDemo
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBJProgressBar : UIView

/**
 *  当前进度，从0开始，默认为0
 */
@property (nonatomic) NSUInteger currentStep;
/**
 *  线的高度(未进行) 默认:1.f
 */
@property (nonatomic) CGFloat lineHeight;
/**
 *  已进行线的高度 默认:2.f
 */
@property (nonatomic) CGFloat selectLinesHeight;
/**
 *  圆点直径 默认:10.f
 */
@property (nonatomic) CGFloat dotsWidth;
/**
 *  进度条颜色(未进行) 默认:[UIColor grayColor]
 */
@property (nonatomic, strong) UIColor *barColor;
/**
 *  进度条颜色(已进行) 默认:[UIColor colorWithRed:40.0/255.0 green:164.0/255.0 blue:176.0/255.0 alpha:1.0]
 */
@property (nonatomic, strong) UIColor *tintColor;
/**
 *  标题数组
 */
@property (nonatomic, strong) NSArray *titleArr;
/**
 *  标题字体 默认:[UIFont systemFontOfSize:14]
 */
@property (nonatomic, strong) UIFont  *titleFont;
/**
 *  标题与进度条间隔 默认:10.f
 */
@property (nonatomic, assign) CGFloat titleSpace;

@end
