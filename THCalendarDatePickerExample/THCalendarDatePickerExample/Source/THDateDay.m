//
//  THDateDay.m
//  THCalendarDatePicker
//
//  Created by chase wasden on 2/10/13.
//  Adapted by Hannes Tribus on 31/07/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//


#import "THDateDay.h"

#import <QuartzCore/QuartzCore.h>

@implementation THDateDay

@synthesize selectedBackgroundColor = _selectedBackgroundColor;
@synthesize currentDateColor = _currentDateColor;
@synthesize currentDateColorSelected = _currentDateColorSelected;
@synthesize dayCornersAreRounded = _rounded;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _selectedBackgroundColor = [UIColor redColor];
        _currentDateColor = [UIColor colorWithRed:242/255.0 green:121/255.0 blue:53/255.0 alpha:1.0];
        _currentDateColorSelected = [UIColor whiteColor];
        _rounded = NO;
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    if ([self isRounded]) {
        [self drawShadow];
    }
}

#pragma mark -

-(void)setLightText:(BOOL)light {
    
    if(light) {
        self.backgroundColor = [UIColor colorWithRed:242/255.0 green:238/255.0 blue:239/255.0 alpha:1.0];
        self.layer.borderWidth = 0.75;
        self.layer.borderColor = [UIColor colorWithRed:224/255.0 green:218/255.0 blue:219/255.0 alpha:0.8].CGColor;
    }
    
    [self.dateButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [self setCurrentColors];
}

- (IBAction)dateButtonTapped:(id)sender {
    [self.delegate dateDayTapped:self];
}

-(void)setSelected:(BOOL)selected {
    
    if(selected) {
        [self setBackgroundColor:self.selectedBackgroundColor];
        [self.dateButton setSelected:YES];
        [self.dateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [self.dateButton setSelected:NO];
        [self.dateButton setTitleColor:[UIColor colorWithWhite:.3 alpha:1] forState:UIControlStateNormal];
    }
    
    [self setCurrentColors];
}

- (void)setCurrentColors {
    
    if (self.currentDateColor && [self isToday]) {
        [self.dateButton setTitleColor:self.currentDateColor forState:UIControlStateNormal];
    }
    
    if (self.currentDateColorSelected && [self isToday]) {
        [self.dateButton setTitleColor:self.currentDateColorSelected forState:UIControlStateSelected];
    }
}

-(void)setEnabled:(BOOL)enabled {
    
    [self.dateButton setEnabled:enabled];
    
    if (!enabled) {
        [self setLightText:!enabled];
    }
    [self drawShadow];
}

- (void) setFontForDayButton:(UIFont *) font {
    self.dateButton.titleLabel.font = font;
}

- (BOOL)isToday {
    
    NSDateComponents *otherDay = [[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian] components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.date];
    NSDateComponents *today = [[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian] components:NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
    return ([today day] == [otherDay day] &&
            [today month] == [otherDay month] &&
            [today year] == [otherDay year] &&
            [today era] == [otherDay era]);
}

#pragma mark - Circular mask

- (void) addMaskToBounds:(CGRect) maskBounds {
    
//    self.bounds = CGRectInset(self.frame, 6.0, 6.0);
    
//    int minWidthHeight = MIN(maskBounds.size.width, maskBounds.size.height);
//    
//    CGRect newFrame = CGRectMake(maskBounds.origin.x + ceil((maskBounds.size.width - minWidthHeight)/2.0), maskBounds.origin.y + ceil((maskBounds.size.height - minWidthHeight)/2.0), minWidthHeight, minWidthHeight);
//    NSLog(@"x: %f, y: %f, width: %f, height: %f", newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height);
//    
//    CGPathRef maskPath = CGPathCreateWithEllipseInRect(newFrame, NULL);
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    
//    maskLayer.bounds = newFrame;
//    maskLayer.path = maskPath;
//    maskLayer.fillColor = [UIColor blackColor].CGColor;
//    
//    CGPathRelease(maskPath);
//    
//    CGPoint point = CGPointMake(maskBounds.size.width/2, maskBounds.size.height/2);
//    maskLayer.position = point;
//    
//    [self.layer setMask:maskLayer];
}

- (void) drawShadow {
    
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(2, 3);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 4.0;
    self.layer.cornerRadius = 4.0;
}

@end
