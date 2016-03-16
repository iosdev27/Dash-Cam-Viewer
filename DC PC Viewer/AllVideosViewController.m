//
//  AllVideosViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/7/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "AllVideosViewController.h"
#import "SWRevealViewController.h"

@interface AllVideosViewController ()

@end

@implementation AllVideosViewController


@synthesize allVideosTableView;

- (void)viewDidLoad {
    [super viewDidLoad];


    // Do any additional setup after loading the view from its nib.
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        [self.menuBarButtonItem setTarget:self.revealViewController];
//        [self.menuBarButtonItem setAction:@selector(revealToggle:)];
        [self.menuBarButtonItem setAction:@selector(rightRevealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        
        allVideosTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        _collapsedSections = [NSMutableSet new];
    }
    
    allVideosTableView.delegate = self;
    allVideosTableView.dataSource = self;
 
    
}

- (void)viewDidAppear:(BOOL)animated {

}

- (void)viewWillAppear:(BOOL)animated {

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

#pragma mark - allViedosTableView methods

//manage datasource and  delegate for submenu tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_collapsedSections containsObject:@(section)] ? 0 : 5;
}

-(NSArray*) indexPathsForSection:(int)section withNumberOfRows:(int)numberOfRows {
    NSMutableArray* indexPaths = [NSMutableArray new];
    for (int i = 0; i < numberOfRows; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}

-(void)sectionButtonTouchUpInside:(UIButton*)sender {
    sender.backgroundColor = [UIColor grayColor];
    [self.allVideosTableView beginUpdates];
    int section = sender.tag;
    bool shouldCollapse = ![_collapsedSections containsObject:@(section)];
    if (shouldCollapse) {
        int numOfRows = [self.allVideosTableView numberOfRowsInSection:section];
        NSArray* indexPaths = [self indexPathsForSection:section withNumberOfRows:numOfRows];
        [self.allVideosTableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [_collapsedSections addObject:@(section)];
    }
    else {
        int numOfRows = 5;
        NSArray* indexPaths = [self indexPathsForSection:section withNumberOfRows:numOfRows];
        [self.allVideosTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [_collapsedSections removeObject:@(section)];
    }
    [self.allVideosTableView endUpdates];
    //[_tableView reloadData];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton* result = [UIButton buttonWithType:UIButtonTypeCustom];
    [result addTarget:self action:@selector(sectionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    result.backgroundColor = [UIColor grayColor];
    [result setTitle:[NSString stringWithFormat:@"Section %d", section] forState:UIControlStateNormal];
    result.tag = section;
    [result setBackgroundImage:[UIImage imageNamed:@"List-Header-Base.png"] forState:UIControlStateNormal];
    
    return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* result =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    result.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
//    result.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"List_New.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0]];
    result.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"List_New.png"]];
    return result;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    MapAndVideoViewController *mapAndVideoVC = [storyboard instantiateViewControllerWithIdentifier:@"MapVideoVCID"];
    [self.navigationController pushViewController:mapAndVideoVC animated:YES];
}

@end
