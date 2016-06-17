//
//  ZBJProgressBar.m
//  ZBJProgressBarDemo
//
//  Created by andy on 16/6/17.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "ZBJProgressBar.h"

@interface ZBJProgressBar()

@property (nonatomic, assign) BOOL      isAnimated;
@property (nonatomic, assign) NSInteger futureStep;
@property (nonatomic, strong) NSArray   *views;
@property (nonatomic, strong) NSArray   *filledViews;
@property (nonatomic, strong) UIView    *showLabelView;

@end

@implementation ZBJProgressBar

#pragma mark -  Life

- (void)defaultInit {
    self.numberOfSteps    = 4;
    self.currentStep      = 0;
    self.filledLineHeight = 1.f;
    self.linesHeight      = 2.f;
    self.dotsWidth        = 10.f;
    self.animDuration     = 3.f;
    self.animOption       = UIViewAnimationOptionCurveEaseIn;
    self.barColor         = [UIColor grayColor];
    self.tintColor        = [UIColor whiteColor];
    self.titleFont        = [UIFont systemFontOfSize:14];
    self.titleSpace       = 10.f;
    self.titleHeight      = 20.f;
    
    self.isAnimated       = NO;
    self.futureStep       = -1;
    self.showLabelView    = [[UIView alloc] init];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultInit];
    }
    return self;
}

- (void)setTitleArr:(NSArray *)titleArr {
    _titleArr      = titleArr;
    _numberOfSteps = titleArr.count;
    [self prepareViews];
}

- (void)animateViewFromIndex:(NSUInteger)index toIndex:(NSUInteger)endIndex andInterval:(CGFloat)interval {
    if (index > endIndex) {
        self.isAnimated = NO;
        if (self.futureStep != -1) {
            NSInteger step  = self.futureStep;
            self.futureStep = -1;
            [self setCurrentStep:step];
        }
        return;
    }
    [UIView animateWithDuration:interval delay:0.f options:self.animOption animations:^{
        
        self.isAnimated      = YES;
        UIView *filledDot    = [self.filledViews objectAtIndex:index];
        UIView *notFilledDot = [self.views objectAtIndex:index];
        
        [self.showLabelView setFrame:CGRectMake(0, self.showLabelView.frame.origin.y, (index + 3) / 2 * self.frame.size.width / self.numberOfSteps, self.showLabelView.frame.size.height)];
        [filledDot setFrame:CGRectMake(filledDot.frame.origin.x, filledDot.frame.origin.y, notFilledDot.frame.size.width, filledDot.frame.size.height)];
    }completion:^(BOOL finished){
        [self animateViewFromIndex:index + 1 toIndex:endIndex andInterval:interval];
    }];
}

- (void)animateViewInvertFromIndex:(NSUInteger)index toIndex:(NSUInteger)endIndex andInterval:(CGFloat)interval {
    if (index <= endIndex) {
        self.isAnimated = NO;
        if (self.futureStep != -1) {
            NSInteger step = self.futureStep;
            self.futureStep = -1;
            [self setCurrentStep:step];
        }
        return;
    }
    [UIView animateWithDuration:interval delay:0.f options:self.animOption animations:^{
        self.isAnimated = YES;
        UIView *filledDot = [self.filledViews objectAtIndex:index];
        [filledDot setFrame:CGRectMake(filledDot.frame.origin.x, filledDot.frame.origin.y, 0, filledDot.frame.size.height)];
    }completion:^(BOOL finished){
        [self animateViewInvertFromIndex:index-1 toIndex:endIndex andInterval:interval];
    }];
}

- (void)setCurrentStep:(NSUInteger)currentStep {
    if (self.isAnimated == NO) {
        if (currentStep < self.numberOfSteps) {
            if (currentStep != _currentStep) {
                if (_currentStep < currentStep)
                {
                    if (currentStep == 0) {
                        [[self.views objectAtIndex:0] setBackgroundColor:self.tintColor];
                    } else {
                        NSUInteger diff = currentStep - _currentStep;
                        [self animateViewFromIndex:_currentStep * 2 toIndex:(_currentStep * 2)+diff * 2 andInterval:self.animDuration / (CGFloat)diff];
                    }
                } else {
                    if (_currentStep == -1) {
                        [[self.views objectAtIndex:0] setBackgroundColor:self.tintColor];
                    } else {
                        NSUInteger diff = _currentStep - currentStep;
                        [self animateViewInvertFromIndex:_currentStep * 2 toIndex:(_currentStep * 2) - diff * 2 andInterval:self.animDuration / (CGFloat)diff];
                    }
                }
            }
            _currentStep = currentStep;
        }
    } else {
        self.futureStep = currentStep;
    }
}

- (void)nextStep {
    if (self.currentStep != self.numberOfSteps)
        [self setCurrentStep:self.currentStep + 1];
}

- (void)prevStep {
    if (self.currentStep != -1)
        [self setCurrentStep:self.currentStep - 1];
}

- (void) prepareViews {
    
    NSMutableArray *aviews       = [[NSMutableArray alloc] init];
    NSMutableArray *afilledViews = [[NSMutableArray alloc] init];
    
    CGFloat padding = (self.frame.size.width - self.dotsWidth) / (self.numberOfSteps - 1);
    double labWidth = self.frame.size.width / self.numberOfSteps;
    
    self.showLabelView.frame                  = CGRectMake(0, self.titleSpace + self.frame.size.height / 2, labWidth, self.titleHeight);
    self.showLabelView.backgroundColor        = [UIColor clearColor];
    self.showLabelView.clipsToBounds          = YES;
    self.showLabelView.userInteractionEnabled = YES;
    
    for (int i = 0; i < self.numberOfSteps; i++) {
        UIView *round = [[UIView alloc] initWithFrame:CGRectMake(i * padding, self.frame.size.height / 2 - self.dotsWidth / 2, self.dotsWidth, self.dotsWidth)];
        round.layer.cornerRadius = self.dotsWidth / 2;
        if (i == 0) {
            round.backgroundColor = self.tintColor;
        } else {
            round.backgroundColor = self.barColor;
        }
        
        UIView *filledround = [[UIView alloc] initWithFrame:CGRectMake(i * padding, self.frame.size.height / 2 - self.dotsWidth / 2, 0, self.dotsWidth)];
        filledround.backgroundColor        = self.tintColor;
        filledround.layer.cornerRadius     = self.dotsWidth / 2;
        filledround.layer.masksToBounds    = NO;
        filledround.userInteractionEnabled = NO;
        
        [afilledViews addObject:filledround];
        
        //lab
        UILabel *defaultLab  = [[UILabel alloc] init];
        UILabel *showLab     = [[UILabel alloc] init];
        
        defaultLab.frame     = CGRectMake(i * labWidth, self.titleSpace + self.frame.size.height / 2, labWidth, self.titleHeight);
        showLab.frame        = CGRectMake(i * labWidth, 0, labWidth, self.titleHeight);
        
        defaultLab.font      = self.titleFont;
        showLab.font         = self.titleFont;
        
        defaultLab.textColor = self.barColor;
        showLab.textColor    = self.tintColor;
        if (0 == i) {
            defaultLab.textAlignment = NSTextAlignmentLeft;
            showLab.textAlignment    = NSTextAlignmentLeft;
        } else if (self.numberOfSteps - 1 == i) {
            defaultLab.textAlignment = NSTextAlignmentRight;
            showLab.textAlignment    = NSTextAlignmentRight;
        } else {
            defaultLab.textAlignment = NSTextAlignmentCenter;
            showLab.textAlignment    = NSTextAlignmentCenter;
            
            [defaultLab setCenter:CGPointMake(round.center.x, defaultLab.center.y)];
            [showLab setCenter:CGPointMake(round.center.x, showLab.center.y)];
            
        }
        
        if (self.titleArr.count > i && self.titleArr.count != 0) {
            defaultLab.text = self.titleArr[i];
            showLab.text    = self.titleArr[i];
        }
        
        [aviews addObject:round];
        if (i < self.numberOfSteps - 1) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake((round.frame.origin.x+round.frame.size.width) - 1, self.frame.size.height / 2 - self.linesHeight / 2, padding, self.linesHeight)];
            line.backgroundColor = self.barColor;
            [self addSubview:line];
            [aviews addObject:line];
            
            UIView *filledline = [[UIView alloc] initWithFrame:CGRectMake((round.frame.origin.x+round.frame.size.width) - 1, self.frame.size.height / 2 - self.filledLineHeight / 2, 0, self.filledLineHeight)];
            filledline.backgroundColor = self.tintColor;
            [self addSubview:filledline];
            [afilledViews addObject:filledline];
        }
        [self.showLabelView addSubview:showLab];
        [self addSubview:round];
        [self addSubview:filledround];
        [self addSubview:defaultLab];
        [self addSubview:self.showLabelView];
    }
    self.views       = aviews;
    self.filledViews = afilledViews;
}

@end
