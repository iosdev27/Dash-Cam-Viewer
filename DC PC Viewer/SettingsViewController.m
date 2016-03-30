//
//  SettingsViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/30/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.settingsScrollView.contentSize = CGSizeMake(375, 1600);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)timezoneButtonPressed:(id)sender {
    TimeZoneViewController *tzVC = [self.storyboard instantiateViewControllerWithIdentifier:@"timezoneVCID"];
    tzVC.delegate = self;
    [self.navigationController pushViewController:tzVC animated:YES];
}

- (void)setSelectedTimeZone:(NSString *)selecteZone {
    NSString *timezoneAbbr = [selecteZone substringToIndex:3];
    [self.timezoneButton setTitle:[NSString stringWithFormat:@"%@ %@", timezoneAbbr, @">"] forState:UIControlStateNormal];
}

@end
