//
//  THDatePickerViewController.h
//  THCalendarDatePicker
//
//  Created by chase wasden on 2/10/13.
//  Adapted by Hannes Tribus on 31/07/14.
//  Copyright (c) 2014 3Bus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "THDateDay.h"

@class THDatePickerViewController;

@protocol THDatePickerDelegate <NSObject>

-(void)datePickerDonePressed:(THDatePickerViewController *)datePicker;
-(void)datePickerCancelPressed:(THDatePickerViewController *)datePicker;

@optional

-(void)datePicker:(THDatePickerViewController *)datePicker selectedDate:(NSDate *)selectedDate;
-(void)datePicker:(THDatePickerViewController *)datePicker deselectedDate:(NSDate *)deselectedDate;
-(void)datePickerDidHide:(THDatePickerViewController *)datePicker;

@end

@interface THDatePickerViewController : UIViewController <THDateDayDelegate>

+(THDatePickerViewController *)datePicker;

@property (weak, nonatomic) id<THDatePickerDelegate> delegate;

// Dates 'n stuff
@property (strong, nonatomic) NSDate * date;
@property (strong, nonatomic) NSTimeZone *dateTimeZone;
@property (strong, nonatomic) NSString* dateTitle;
@property (strong, nonatomic) NSArray * selectedDates;
@property (strong, nonatomic) NSLocale *currentLocale;

// Animation
@property (nonatomic) float slideAnimationDuration;
@property (nonatomic) float autoCloseCancelDelay;

//Colors
@property (strong, nonatomic) UIColor *selectedBackgroundColor;
@property (strong, nonatomic) UIColor *currentDateColor;
@property (strong, nonatomic) UIColor *currentDateColorSelected;

//Fonts
@property (nonatomic, strong) UIFont *weekDayFont;
@property (nonatomic, strong) UIFont *singleDayButtonFont;
@property (nonatomic, strong) UIFont *monthFont;

@property (nonatomic, getter=isRounded) BOOL dayCornersAreRounded;
@property (nonatomic, getter=isHistoryFutureBasedOnInternal) BOOL historyFutureBasedOnInternal;
@property (weak, nonatomic) IBOutlet UIView *toolbarBackgroundView;


- (void)setDateHasItemsCallback:(BOOL (^)(NSDate * date))callback;

/*! Enable Clear Date Button
 * \param allow should show "clear date" button
 */
- (void)setAllowClearDate:(BOOL)allow;

/*! Enable Multi Day Selection
 * \param allow selection of multiple days
 */
- (void)setAllowMultiDaySelection:(BOOL)allow;

/*! Enable Ok Button when selected Date has already been selected
 * \param allow should show ok button
 */
- (void)setAllowSelectionOfSelectedDate:(BOOL)allow;

/*! Use Clear Date Button as "got to Today"
 * \param beTodayButton should use "clear date" button as today
 */
- (void)setClearAsToday:(BOOL)beTodayButton;

/*! Should the view be closed on selection of a date
 * \param autoClose should close view on selection
 */
- (void)setAutoCloseOnSelectDate:(BOOL)autoClose;

/*! Should it be possible to select dates in history
 * \param disableHistorySelection should it be possible?
 */
- (void)setDisableHistorySelection:(BOOL)disableHistorySelection;

/*! Should it be possible to select dates in future
 * \param disableFutureSelection should it be possible?
 */
- (void)setDisableFutureSelection:(BOOL)disableFutureSelection;

/*! Should it be possible to select dates in history up to a number of days (including today) or 0 if any date
 * \param daysInHistory how many days?
 */
- (void)setDaysInHistorySelection:(NSUInteger)daysInHistory;

/*! Should it be possible to select dates in future up to a number of days (including today) or 0 if any date
 * \param daysInFuture how many days?
 */
- (void)setDaysInFutureSelection:(NSUInteger)daysInFuture;

/*! Set the timeZone by name to be used. Valid timezones can be retrieved using [NSTimeZone knownTimeZoneNames]
 * \param the name of the timezone to be used
 * \return successful?
 */
- (BOOL)setDateTimeZoneWithName:(NSString *)name;

/*! Should it be possible to fast switch the year
 * \param disableYearSwitch should it be possible?
 */
- (void)setDisableYearSwitch:(BOOL)disableYearSwitch;

/*! Set date range
 * \param fromDate      range from
 * \param toDate        range to
 */
- (void)setDateRangeFrom:(NSDate *)fromDate toDate:(NSDate *)toDate;

/*! Set calendar title
 * \param dateTitle     calendar title
 */
- (void)setDateTitle:(NSString*)dateTitle;

@end
