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
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    return cell;
    
}


@end
