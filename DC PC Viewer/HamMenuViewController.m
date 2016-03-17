//
//  HamMenuViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/15/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "HamMenuViewController.h"

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
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EventsCell"];
//    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"List_New.png"]];
    if (indexPath.row == 0) {
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"On", @"Off", nil]];
        segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        segmentedControl.frame = CGRectMake(75, 5, 100, 30);
        
        segmentedControl.tag = indexPath.row;
        [segmentedControl addTarget:self action:@selector(didChangeSegmentedControl:) forControlEvents:UIControlEventValueChanged];
        segmentedControl.selectedSegmentIndex = 0;
        cell.accessoryView = segmentedControl;
        cell.textLabel.text = @"View Videos on DashCam";
        cell.detailTextLabel.text = @"recording will be disabled.";
        
    } else {
        cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    }
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView reloadData];
    UITableViewCell *cell=(UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor orangeColor]];
    cell.backgroundColor = [UIColor grayColor];
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