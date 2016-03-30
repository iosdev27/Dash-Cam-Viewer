//
//  TimeZoneViewController.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/30/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "timezoneDelegate.h"

@interface TimeZoneViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <timezoneDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIPickerView *timezonePicker;


- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonePressed:(id)sender;


@end
