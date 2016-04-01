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

BOOL GalleryButtonDisplayedEvents = YES;
BOOL ListButtonDisplayedEvents = NO;

- (void)myAction:(id)sender{
    UIButton *myButton = (UIButton *)sender;
    NSLog(@"sender tag: %ld", (long)myButton.tag);
    
    if (GalleryButtonDisplayedEvents) {
        UIImage *image = [UIImage imageNamed:@"BNT_NaviBar_List_NML.png"];
        [myButton setImage:image forState:UIControlStateNormal];
        GalleryButtonDisplayedEvents = NO;
        ListButtonDisplayedEvents = YES;
        
        //self.galleryCollectionView.frame = CGRectMake(allVideosTableView.frame.origin.x, allVideosTableView.frame.origin.y, self.view.frame.size.width, allVideosTableView.frame.size.height);
        //self.galleryCollectionView.hidden = NO;
        //allVideosTableView.hidden = YES;
        
    } else if (ListButtonDisplayedEvents) {
        UIImage *image = [UIImage imageNamed:@"BTN_NaviBar_Gallery_NML.png"];
        [myButton setImage:image forState:UIControlStateNormal];
        ListButtonDisplayedEvents = NO;
        GalleryButtonDisplayedEvents = YES;
        //self.galleryCollectionView.hidden = YES;
        //allVideosTableView.hidden = NO;
    }
}


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
    
    //Tool Bar setup
    self.localToolBar.hidden = YES;
    
    UIToolbar *myToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 28, self.view.frame.size.width, 44)];
    myToolbar.backgroundColor = [UIColor grayColor];
    [self.view addSubview:myToolbar];
    
    NSMutableArray* BarbuttonsArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    
    UIBarButtonItem *fixedItemfirst = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItemfirst.width = 137.0f;
    [BarbuttonsArray addObject:fixedItemfirst];
    
    UILabel *dashCamLabel = [[UILabel alloc] init];
    
    dashCamLabel.frame = CGRectMake(0, 0, 80, 22);
    [dashCamLabel setCenter:self.view.center];
    dashCamLabel.text = @"Dash Cam";
    //    dashCamLabel.textColor = [UIColor lightBlueColor];
    UIBarButtonItem *title = [[UIBarButtonItem alloc] initWithCustomView:dashCamLabel];
    
    [BarbuttonsArray addObject:title];
    
    //Fixed space between Dash Cam lbael, and gallery button
    UIBarButtonItem *fixedItem0 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem0.width = 55.0f;
    [BarbuttonsArray addObject:fixedItem0];
    
    //Gallery barbutton
    UIImage *image = [UIImage imageNamed:@"BTN_NaviBar_Gallery_NML.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.tag = 1;
    button.bounds = CGRectMake( 0, 0, 22, 22 );
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(myAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    [BarbuttonsArray addObject:barButtonItem];
    
    //Fixed space between gallery, and menu buttons
    UIBarButtonItem *fixedItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedItem.width = 10.0f;
    [BarbuttonsArray addObject:fixedItem];
    
    //Menu barbutton
    UIImage *image2 = [UIImage imageNamed:@"BTN_NaviBar_Hamburger_NML.png"];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.tag = 2;
    button2.bounds = CGRectMake( 0, 0, 22, 22 );
    [button2 setImage:image2 forState:UIControlStateNormal];
    [button2 addTarget:self.revealViewController action:@selector(rightRevealToggle:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    [BarbuttonsArray addObject:barButtonItem2];
    
    //Dash Cam Label
    
    [myToolbar setItems:BarbuttonsArray];

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
//    MapVideoView *mVView = [[MapVideoView alloc]init];
//    [self.view addSubview:mVView];
    
    MapAndVideoViewController *mapAndVideoVC = [storyboard instantiateViewControllerWithIdentifier:@"MapVideoVCID"];
//    if (mapAndVideoVC.view != nil) {
//        [self.view addSubview:mapAndVideoVC.view];
//    }
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mapAndVideoVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
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
