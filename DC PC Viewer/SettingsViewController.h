//
//  SettingsViewController.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/30/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeZoneViewController.h"

@interface SettingsViewController : UIViewController <timezoneDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *settingsScrollView;
@property (weak, nonatomic) IBOutlet UIButton *timezoneButton;

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)timezoneButtonPressed:(id)sender;

@end
