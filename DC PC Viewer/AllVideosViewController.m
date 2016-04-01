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

BOOL GalleryButtonDisplayed = YES;
BOOL ListButtonDisplayed = NO;

BOOL GalleryBTNView = YES;

@synthesize allVideosTableView;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *uvc = [collectionView dequeueReusableCellWithReuseIdentifier:@"VideoCell" forIndexPath:indexPath];
    uvc.backgroundColor = [UIColor whiteColor];
    
    // UIImageView *thumbnailImageForCell = [[UIImageView alloc]initWithFrame:CGRectMake(15,7,78,56)];
    UIImageView *thumbnailImageForCell = [[UIImageView alloc]init];
    thumbnailImageForCell.image = [UIImage imageNamed:@"IMG_ Play Chapter_ThisChapterScreenshot.png"];
    
    [uvc setBackgroundView:thumbnailImageForCell];
    return uvc;
}

- (void)myAction:(id)sender{
    UIButton *myButton = (UIButton *)sender;
    NSLog(@"sender tag: %ld", (long)myButton.tag);
    
    if (GalleryButtonDisplayed) {
        UIImage *image = [UIImage imageNamed:@"BNT_NaviBar_List_NML.png"];
        [myButton setImage:image forState:UIControlStateNormal];
        GalleryButtonDisplayed = NO;
        ListButtonDisplayed = YES;
        
        self.galleryCollectionView.frame = CGRectMake(allVideosTableView.frame.origin.x, allVideosTableView.frame.origin.y, self.view.frame.size.width, allVideosTableView.frame.size.height);
        self.galleryCollectionView.hidden = NO;
        allVideosTableView.hidden = YES;
        
    } else if (ListButtonDisplayed) {
        UIImage *image = [UIImage imageNamed:@"BTN_NaviBar_Gallery_NML.png"];
        [myButton setImage:image forState:UIControlStateNormal];
        ListButtonDisplayed = NO;
        GalleryButtonDisplayed = YES;
        self.galleryCollectionView.hidden = YES;
        allVideosTableView.hidden = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = YES;
    
    SWRevealViewController *revealViewController = self.revealViewController;
    
//    if (revealViewController) {
//        [self.menuBarButtonItem setTarget:self.revealViewController];
//        [self.menuBarButtonItem setAction:@selector(rightRevealToggle:)];
//        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
//        
//        
//    }
    
    allVideosTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    allVideosTableView.delegate = self;
    allVideosTableView.dataSource = self;
    [allVideosTableView openSection:0 animated:NO];
    
    self.galleryCollectionView.hidden = YES;
    
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
