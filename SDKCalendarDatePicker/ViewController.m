//
//  TestViewController.m
//  THCalendarDatePickerExample
//
//  Created by Hannes Tribus on 31/07/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, retain) NSDate * curDate;
@property (nonatomic, retain) NSDateFormatter * formatter;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [super viewDidLoad];
    
    self.curDate = [NSDate date];
    
    self.formatter = [[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"dd/MM/yyyy --- HH:mm"];
    
    [self refreshTitle];
}

-(void)refreshTitle {
    [self.dateButton setTitle:(self.curDate ? [_formatter stringFromDate:_curDate] : @"No date selected") forState:UIControlStateNormal];
}

- (IBAction)touchedButton:(id)sender {
    if(!self.datePicker) {
        self.datePicker = [THDatePickerViewController datePicker];
    }
    
    self.datePicker.date = self.curDate;
    self.datePicker.delegate = self;
    
    // Set fonts
    [self.datePicker setWeekDayFont:[UIFont systemFontOfSize:15]];
    [self.datePicker setSingleDayButtonFont:[UIFont systemFontOfSize:17]];
    [self.datePicker setMonthFont:[UIFont systemFontOfSize:13]];
    
    [self.datePicker setAutoCloseOnSelectDate:YES];
    [self.datePicker setDisableYearSwitch:YES];
    [self.datePicker setDisableFutureSelection:YES];
    [self.datePicker setDaysInHistorySelection:1];
    [self.datePicker setDaysInFutureSelection:90];
    
    // Colors
    [self.datePicker setSelectedBackgroundColor:[UIColor redColor]];
    [self.datePicker setCurrentDateColor:[UIColor redColor]];
    [self.datePicker setCurrentDateColorSelected:[UIColor whiteColor]];
    [self.datePicker setCurrentLocale:[NSLocale localeWithLocaleIdentifier:@"nl_NL"]];
    
    [self presentViewController:self.datePicker animated:YES completion:nil];
}

#pragma mark - THDatePickerDelegate

- (void)datePickerDonePressed:(THDatePickerViewController *)datePicker {
    
    self.curDate = datePicker.date;
    [self refreshTitle];
    
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.5];
}

-(void) dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)datePickerCancelPressed:(THDatePickerViewController *)datePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)datePicker:(THDatePickerViewController *)datePicker selectedDate:(NSDate *)selectedDate {
    NSLog(@"Date selected: %@",[_formatter stringFromDate:selectedDate]);
}
@end
