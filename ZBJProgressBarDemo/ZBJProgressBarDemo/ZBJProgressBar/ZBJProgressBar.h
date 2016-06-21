//
//  ZBJProgressBar.h
//  ZBJProgressBarDemo
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#warning todo
typedef enum {
    Center          = 0,    //titleLable全部居中
    RightCenterLeft = 1     //demo 效果
}TitleStyle;

#import <UIKit/UIKit.h>

@interface ZBJProgressBar : UIView
///当前步数 default is 0
@property (nonatomic) NSUInteger currentStep;
///未进行线的高度 default is 1
@property (nonatomic) CGFloat filledLineHeight;
///已进行线的高度 default is 2
@property (nonatomic) CGFloat linesHeight;
///圆点半径 default is 10
@property (nonatomic) CGFloat dotsWidth;
///动画时间 default is 0.6
@property (nonatomic) NSTimeInterval animDuration;
///动画选项 default is UIViewAnimationOptionCurveEaseIn
@property (nonatomic) UIViewAnimationOptions animOption;
///未进行进度颜色 default is [UIColor grayColor]
@property (nonatomic, strong) UIColor *barColor;
///已进行进度颜色 default is [UIColor whiteColor]
@property (nonatomic, strong) UIColor *tintColor;
///标题数组
@property (nonatomic, strong) NSArray *titleArr;
///标题字体 default is [UIFont systemFontOfSize:14]
@property (nonatomic, strong) UIFont  *titleFont;
///标题与进度条间隔 default is 10.f
@property (nonatomic, assign) CGFloat titleSpace;
///标题高度 default is 20
@property (nonatomic, assign) CGFloat titleHeight;
///标题类型 default is 
@property TitleStyle titleStyle;

@end
