//
//  EventsViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/7/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController
@synthesize eventsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        [self.menuBarButtonItem setTarget:self.revealViewController];
        [self.menuBarButtonItem setAction:@selector(rightRevealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    eventsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    eventsTableView.delegate = self;
    eventsTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - eventsTableView methods

// manage datasource and delegate for the eventsTableView methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EventsCell"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"List_New.png"]];
    return cell;
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
