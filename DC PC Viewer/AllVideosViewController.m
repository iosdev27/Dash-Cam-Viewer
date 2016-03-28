//
//  AllVideosViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/7/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "AllVideosViewController.h"



@interface AllVideosViewController ()

@end

@implementation AllVideosViewController


@synthesize allVideosTableView;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = YES;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        [self.menuBarButtonItem setTarget:self.revealViewController];
        [self.menuBarButtonItem setAction:@selector(rightRevealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        
        allVideosTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    allVideosTableView.delegate = self;
    allVideosTableView.dataSource = self;
    
    [allVideosTableView openSection:0 animated:NO];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
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
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return [_collapsedSections containsObject:@(section)] ? 0 : 2;
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LIST_Chpt_NML.png"]];
    
    UIImageView *thumbnailImageForCell = [[UIImageView alloc]initWithFrame:CGRectMake(15,7,78,56)];
    thumbnailImageForCell.image = [UIImage imageNamed:@"SAMPLE_Thumbnail4List@2x.png"];
    
    [cell.contentView addSubview:thumbnailImageForCell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = self.navigationController.storyboard;
    
    MapAndVideoViewController *mapAndVideoVC = [storyboard instantiateViewControllerWithIdentifier:@"MapVideoVCID"];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mapAndVideoVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 56.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 73.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton* result = [UIButton buttonWithType:UIButtonTypeCustom];
    [result addTarget:self action:@selector(sectionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [result setTitle:[NSString stringWithFormat:@"Section %ld", (long)section] forState:UIControlStateNormal];
    result.tag = section;
    [result setBackgroundImage:[UIImage imageNamed:@"LIST_Trip_NML.png"] forState:UIControlStateNormal];
    
    //    [self sectionButtonTouchUpInside:result];
    return result;
}

- (void)sectionButtonTouchUpInside:(UIButton*)sender {
    [self.allVideosTableView toggleSection:sender.tag animated:YES];
}



@end
