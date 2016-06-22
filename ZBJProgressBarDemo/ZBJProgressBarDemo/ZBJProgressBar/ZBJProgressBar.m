//
//  ZBJProgressBar.m
//  ZBJProgressBarDemo
//
//  Author Andyjicw 479003573@qq.com
//
//  Created by andy on 16/6/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "ZBJProgressBar.h"

@interface ZBJProgressBar()

@end

@implementation ZBJProgressBar

#pragma mark -  LifeCycle

- (void) common {
    _currentStep       = 0;
    _tintColor         = [UIColor colorWithRed:40.0/255.0 green:164.0/255.0 blue:176.0/255.0 alpha:1.0];
    _barColor          = [UIColor grayColor];
    _titleFont         = [UIFont systemFontOfSize:14];
    _titleSpace        = 10.f;
    _dotsWidth         = 10.f;
    _lineHeight        = 1.f;
    _selectLinesHeight = 2.f;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self common];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self common];
    }
    return self;
}

#pragma mark - setUpView

- (void) setUp {
    
    CGFloat padding = (self.frame.size.width - self.titleArr.count * self.dotsWidth) / (self.titleArr.count - 1) / 2 + self.dotsWidth / 2;
    
    for (int i = 0; i <= self.titleArr.count * 2 - 2; i ++) {
        if (i % 2 == 0) {
            CGRect rect    = CGRectMake(padding * i / 2,
                                        (self.frame.size.height - self.dotsWidth) / 4,
                                        self.dotsWidth,
                                        self.dotsWidth);
            CGPoint center = CGPointMake(padding * i + self.dotsWidth / 2,
                                         self.frame.size.height / 2 + self.titleSpace + (self.frame.size.height / 2 - self.titleSpace) / 2);
            if (i / 2 <= self.currentStep) {
                [self addCircle:rect color:self.tintColor];
                [self setUpTitle:(i / 2) color:self.tintColor center:center];
            } else {
                [self addCircle:rect color:self.barColor];
                [self setUpTitle:(i / 2) color:self.barColor center:center];
            }
            
        } else {
            CGPoint start = CGPointMake((i - 1) * padding + self.dotsWidth, self.frame.size.height / 2);
            CGPoint end   = CGPointMake((i + 1) * padding, self.frame.size.height / 2);
            if ((i - 1) / 2 >= self.currentStep) {
                [self addLine:start end:end color:self.barColor lineWidth:self.selectLinesHeight];
            } else {
                [self addLine:start end:end color:self.tintColor lineWidth:self.lineHeight];
            }
        }
    }
}

#pragma mark - draw

- (void) setUpTitle:(NSInteger)index color:(UIColor *)color center:(CGPoint)center {
    
    UILabel *lab  = [[UILabel alloc] init];
    lab.frame     = CGRectMake(0,
                               self.frame.size.height / 2 + self.titleSpace,
                               self.frame.size.width / self.titleArr.count,
                               self.frame.size.height / 2 - self.titleSpace);
    lab.text      = self.titleArr[index];
    lab.font      = self.titleFont;
    lab.textColor = color;
    if (0 == index) {
        lab.textAlignment = NSTextAlignmentLeft;
    } else if (self.titleArr.count - 1 == index) {
        lab.frame = CGRectMake(center.x - self.frame.size.width / self.titleArr.count + self.dotsWidth / 2,
                               self.frame.size.height / 2 + self.titleSpace,
                               self.frame.size.width / self.titleArr.count,
                               self.frame.size.height / 2 - self.titleSpace);
        lab.textAlignment = NSTextAlignmentRight;
    } else {
        lab.textAlignment = NSTextAlignmentCenter;
        lab.center = center;
    }
    [self addSubview:lab];
}
- (void) addCircle:(CGRect)rect color:(UIColor *)color {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame         = rect;
    layer.fillColor     = color.CGColor;
    UIBezierPath *path  = [UIBezierPath bezierPathWithOvalInRect:layer.frame];
    layer.path          = path.CGPath;
    [self.layer addSublayer:layer];
}

- (void) addLine:(CGPoint)startPoint end:(CGPoint)endPoint color:(UIColor *)color lineWidth:(CGFloat)lineWidth {
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth     = lineWidth;
    layer.strokeColor   = color.CGColor;
    UIBezierPath *path  = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    layer.path          = path.CGPath;
    [self.layer addSublayer:layer];
}

#pragma mark - setter

- (void) setCurrentStep:(NSUInteger)currentStep {
    _currentStep = currentStep;
}
- (void) setlineHeight:(CGFloat)filledLineHeight {
    _lineHeight = filledLineHeight;
}

- (void) setselectLinesHeight:(CGFloat)selectLinesHeight {
    _selectLinesHeight = selectLinesHeight;
}

- (void) setDotsWidth:(CGFloat)dotsWidth {
    _dotsWidth = dotsWidth;
}

- (void) setBarColor:(UIColor *)barColor {
    _barColor = barColor;
}

- (void) setTintColor:(UIColor *)tintColor {
    _tintColor = tintColor;
}

- (void) setTitleArr:(NSArray *)titleArr {
    _titleArr = titleArr;
    [self setUp];
}

- (void) setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
}

- (void) setTitleSpace:(CGFloat)titleSpace {
    _titleSpace = titleSpace;
}

@end
