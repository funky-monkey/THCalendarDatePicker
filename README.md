THCalendarDatePicker
===

[![Pod License](http://img.shields.io/cocoapods/l/THCalendarDatePicker.svg?style=flat)](http://opensource.org/licenses/MIT)


This control is based on the [datepicker-ios](https://github.com/ccwasden/datepicker-ios) control and the [KNSemiModalViewController](https://github.com/kentnguyen/KNSemiModalViewController) has been stripped out.

The original controller was not aware of orientation changes and was missing some customization features that I needed for my project, so I decided to rewrite part of the controller to fit to my needs.

# Screenshots

![iPhone Portrait](./Screenshots/Screenshot1.png?raw=true  | width=300)
![iPhone Landscape](./Screenshots/Screenshot2.png?raw=true | width=300)

# Installation

### CocoaPods

Install with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

####Objective-C

```
platform :ios, '8.0'
pod 'THCalendarDatePicker', :git => 'https://github.com/funky-monkey/THCalendarDatePicker.git'
```
####Swift

```
platform :ios, '8.0'
use_frameworks!
pod 'THCalendarDatePicker', :git => 'https://github.com/funky-monkey/THCalendarDatePicker.git'
```

# Usage

This is a sample initialization taken from the ExampleProject.

```objective-c
- (IBAction)touchedButton:(id)sender {
    if(!self.datePicker)
        self.datePicker = [THDatePickerViewController datePicker];
    self.datePicker.date = self.curDate;
    self.datePicker.delegate = self;
    [self.datePicker setAllowClearDate:NO];
    [self.datePicker setClearAsToday:YES];
    [self.datePicker setAutoCloseOnSelectDate:YES];
    [self.datePicker setAllowSelectionOfSelectedDate:YES];
    [self.datePicker setDisableHistorySelection:YES];
    [self.datePicker setDisableFutureSelection:NO];
    [self.datePicker setSelectedBackgroundColor:[UIColor colorWithRed:125/255.0 green:208/255.0 blue:0/255.0 alpha:1.0]];
    [self.datePicker setCurrentDateColor:[UIColor colorWithRed:242/255.0 green:121/255.0 blue:53/255.0 alpha:1.0]];

    [self.datePicker setDateHasItemsCallback:^BOOL(NSDate *date) {
     int tmp = (arc4random() % 30)+1;
     if(tmp % 5 == 0)
     return YES;
     return NO;
     }];
    //[self.datePicker slideUpInView:self.view withModalColor:[UIColor lightGrayColor]];
    [self presentSemiViewController:self.datePicker withOptions:@{
                                                                  KNSemiModalOptionKeys.pushParentBack    : @(NO),
                                                                  KNSemiModalOptionKeys.animationDuration : @(1.0),
                                                                  KNSemiModalOptionKeys.shadowOpacity     : @(0.3),
                                                                  }];
}

```

or how you could do it in Swift

```Swift
    lazy var datePicker:THDatePickerViewController = {
        var dp = THDatePickerViewController.datePicker()
        dp.delegate = self
        dp.setAllowClearDate(false)
        dp.setClearAsToday(true)
        dp.setAutoCloseOnSelectDate(false)
        dp.setAllowSelectionOfSelectedDate(true)
        dp.setDisableHistorySelection(true)
        dp.setDisableFutureSelection(false)
        //dp.autoCloseCancelDelay = 5.0
        dp.selectedBackgroundColor = UIColor(red: 125/255.0, green: 208/255.0, blue: 0/255.0, alpha: 1.0)
        dp.currentDateColor = UIColor(red: 242/255.0, green: 121/255.0, blue: 53/255.0, alpha: 1.0)
        dp.currentDateColorSelected = UIColor.yellowColor()
        return dp
    }()

    @IBAction func dateButtonTouched(sender: AnyObject) {
        datePicker.date = curDate
        datePicker.setDateHasItemsCallback({(date:NSDate!) -> Bool in
            let tmp = (arc4random() % 30) + 1
            return tmp % 5 == 0
        })
        presentSemiViewController(datePicker, withOptions: [
            KNSemiModalOptionKeys.pushParentBack    : NSNumber(bool: false),
            KNSemiModalOptionKeys.animationDuration : NSNumber(float: 1.0),
            KNSemiModalOptionKeys.shadowOpacity     : NSNumber(float: 0.3)
            ])
    }
```

#Contributions

...are really welcome. If you have an idea just fork the library change it and if its useful for others and not affecting the functionality of the library for other users I'll insert it

###Contributors

- [Mikko Koppanen](https://github.com/mkoppanen)
- [Kirill Pahnev](https://github.com/pahnev)
- [jeremiescheer](https://github.com/jeremiescheer)
- [powfulhong](https://github.com/powfulhong)
- [sparkdreamstudio](https://github.com/sparkdreamstudio)
- [Ignacio pascualin](https://github.com/pascualin)

# License

Source code of this project is available under the standard MIT license. Please see [the license file](LICENSE.md).