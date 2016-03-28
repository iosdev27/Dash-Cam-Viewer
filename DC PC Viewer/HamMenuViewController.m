//
//  HamMenuViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/15/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "HamMenuViewController.h"
#import "AllVideosViewController.h"
#import "EventsViewController.h"
#import "TabBarViewController.h"
#import "SubClassofSWRevealViewController.h"

@interface HamMenuViewController () {
    NSMutableArray *tableData;
}

@end

@implementation HamMenuViewController
@synthesize hamMentTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    hamMentTableView.backgroundColor = [UIColor grayColor];
    hamMentTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    hamMentTableView.delegate = self;
    hamMentTableView.dataSource = self;
    
    tableData = [[NSMutableArray alloc] initWithObjects:@"", @"All Videos", @"Events", @"Settings", @"Adventure Mode Settings", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// manage datasource and delegate for the eventsTableView methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
            return 80;
    } else
        return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 0) {
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"On", @"Off", nil]];
        segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        segmentedControl.frame = CGRectMake(0, 5, 90, 30);
        
        segmentedControl.tag = indexPath.row;
        [segmentedControl addTarget:self action:@selector(didChangeSegmentedControl:) forControlEvents:UIControlEventValueChanged];
        segmentedControl.selectedSegmentIndex = 0;
        cell.accessoryView = segmentedControl;
        cell.textLabel.text = @"View Videos on DashCam";
        cell.detailTextLabel.text = @"recording will be disabled";
    } else {
        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    }
    cell.backgroundColor = [UIColor grayColor];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView reloadData];
    
    if (indexPath.row == 1 || indexPath.row == 2) {
        UITabBarController *tabBarController = (UITabBarController*)self.revealViewController.frontViewController;
        UINavigationController *navController = tabBarController.viewControllers[(indexPath.row)-1];
        [navController popToRootViewControllerAnimated:YES];
        
        tabBarController.selectedIndex = (indexPath.row)-1;
        [self.revealViewController pushFrontViewController:tabBarController animated:YES];
    }
}

- (void)didChangeSegmentedControl:(UISegmentedControl *)control {

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
