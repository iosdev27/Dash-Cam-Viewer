//
//  EventsViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/7/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "EventsViewController.h"
#import "MapVideoView.h"

@interface EventsViewController ()

@end

@implementation EventsViewController
@synthesize eventsTableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = YES;
    
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
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
    return 73.5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = self.navigationController.storyboard;

//    MapVideoView *mVView = [[MapVideoView alloc]initWithFrame:CGRectMake(0,667/2, 375, 250)];
//    MapVideoView *mVView = [[MapVideoView alloc]initWithFrame:CGRectMake(0,-200, 375, 250)];
    MapVideoView *mVView = [[MapVideoView alloc]init];
    [self.view addSubview:mVView];
    
//    MapAndVideoViewController *mapAndVideoVC = [storyboard instantiateViewControllerWithIdentifier:@"MapVideoVCID"];
//    if (mapAndVideoVC.view != nil) {
//        [self.view addSubview:mapAndVideoVC.view];
//    }
    
//    [self.navigationController pushViewController:mapAndVideoVC animated:YES];    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EventsCell"];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LIST_ChptLock_OLD_NML.png"]];
    
    UIImageView *thumbnailImageForCell = [[UIImageView alloc]initWithFrame:CGRectMake(15,7,78,56)];
    thumbnailImageForCell.image = [UIImage imageNamed:@"SAMPLE_Thumbnail4List@2x.png"];
    
    [cell.contentView addSubview:thumbnailImageForCell];
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
