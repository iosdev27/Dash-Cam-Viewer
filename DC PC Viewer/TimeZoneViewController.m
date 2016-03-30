//
//  TimeZoneViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/30/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "TimeZoneViewController.h"

@interface TimeZoneViewController () {
    NSArray *timezoneData;
}

@end

@implementation TimeZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timezonePicker.dataSource = self;
    self.timezonePicker.delegate = self;
    
    timezoneData = [[NSArray alloc]initWithObjects:@"AST - Atlantic", @"EST - Eastern", @"CST - Central", @"MST - Mountain", @"PST - Pacific", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [timezoneData count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return timezoneData[row];
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

- (IBAction)doneButtonePressed:(id)sender {
    int row = [self.timezonePicker selectedRowInComponent:0];
    [self.delegate setSelectedTimeZone:timezoneData[row]];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
