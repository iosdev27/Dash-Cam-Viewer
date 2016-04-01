//
//  MapAndVideoViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/14/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "MapAndVideoViewController.h"
@import AVFoundation;
@import AVKit;

@interface MapAndVideoViewController () {
    AVPlayerViewController *avpController;
    AVPlayer *myPlayer;
}

@end

@implementation MapAndVideoViewController
@synthesize tripMapView;

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
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


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(150, 150);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UIImageView *thumbnailImageForCell = [[UIImageView alloc]init];
    thumbnailImageForCell.image = [UIImage imageNamed:@"IMG_Play Event_This Event THUMB.png"];
    
    [cell setBackgroundView:thumbnailImageForCell];
    
    
    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"TCI_1" withExtension:@"MP4"];
    myPlayer = [AVPlayer playerWithURL:videoURL];
    
    avpController.player = myPlayer;
    [myPlayer play];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    UIImageView *thumbnailImageForCell = [[UIImageView alloc]init];
    thumbnailImageForCell.image = [UIImage imageNamed:@"IMG_ Play Chapter_ThisChapterScreenshot.png"];
    
    [cell setBackgroundView:thumbnailImageForCell];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if (revealViewController) {
        [self.menuBarButtonItem setTarget:self.revealViewController];
        [self.menuBarButtonItem setAction:@selector(rightRevealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self zoomIntoMap];
    
    [self createPlayer];
    
    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"TCI_1" withExtension:@"MP4"];
    myPlayer = [AVPlayer playerWithURL:videoURL];
  
    avpController.player = myPlayer;

    
    
    //location services check
    if([CLLocationManager locationServicesEnabled]){
        
        NSLog(@"Location Services Enabled");
        
        if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
            NSLog(@"Denied");
            //            alert = [[UIAlertView alloc] initWithTitle:@"App Permission Denied"
            //                                               message:@"To re-enable, please go to Settings and turn on Location Service for this app."
            //                                              delegate:nil
            //                                     cancelButtonTitle:@"OK"
            //                                     otherButtonTitles:nil];
            //            [alert show];
        }
    }
    
    //map setup
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    
    
    tripMapView.frame = CGRectMake(0, 45, 375, 250);
    tripMapView.delegate = self;
    [tripMapView setMapType:MKMapTypeStandard];
    [tripMapView setZoomEnabled:YES];
    [tripMapView setScrollEnabled:YES];
//    [tripMapView setCenterCoordinate:tripMapView.userLocation.location.coordinate animated:YES];
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setMinimumInteritemSpacing:0.0f];
    [self.videoFramesScrollListCollectionView setCollectionViewLayout:flowLayout];
    
    self.videoFramesScrollListCollectionView.frame = CGRectMake(0, (avpController.view.frame.origin.y + avpController.view.frame.size.height), self.view.frame.size.width, (self.view.frame.size.height - (avpController.view.frame.origin.y + avpController.view.frame.size.height)));
//    NSLog(@"scroll y:%f", self.videoFramesScrollListCollectionView.frame.view.size.height);
}

- (void)createPlayer {
    avpController = [[AVPlayerViewController alloc]init];
    avpController.view.frame = CGRectMake(0,335, self.view.frame.size.width, 250);
    [self addChildViewController:avpController];
    [self.view addSubview:avpController.view];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
    NSLog(@"%@", [self deviceLocation]);
    
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
  
//    region.center.latitude = self.locationManager.location.coordinate.latitude;
//    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.center.latitude = 43.7816477;
    region.center.longitude = -79.24443839999998;
    region.span.longitudeDelta = 3; //.005
    region.span.longitudeDelta = 3;
    [tripMapView setRegion:region animated:YES];
//
}

// viewDidAppear is not getting called so duplipcating functionality
- (void)zoomIntoMap {
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
    NSLog(@"%@", [self deviceLocation]);
    
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    
    //    region.center.latitude = self.locationManager.location.coordinate.latitude;
    //    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.center.latitude = 43.7816477;
    region.center.longitude = -79.24443839999998;
    region.span.longitudeDelta = 3; //.005
    region.span.longitudeDelta = 3;
    [tripMapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self.locationManager requestWhenInUseAuthorization];

    [self.locationManager startUpdatingLocation];
     tripMapView.showsUserLocation = YES;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    region.center.latitude = self.locationManager.location.coordinate.latitude;
        region.center.longitude = self.locationManager.location.coordinate.longitude;
        region.span.longitudeDelta = 0.005f;
        region.span.longitudeDelta = 0.005f;
        [tripMapView setRegion:region animated:YES];
    [self.tripMapView setRegion:[self.tripMapView regionThatFits:region] animated:YES];
}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
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

- (IBAction)shareButtonPressed:(id)sender {
//    NSString *textToShare = @"Look at this awesome website for aspiring iOS Developers!";
//    NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"TCI_1" withExtension:@"MP4"];
    
    NSArray *objectsToShare = @[videoURL];
    
//    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
//    
//    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
//                                   UIActivityTypePrint,
//                                   UIActivityTypeAssignToContact,
//                                   UIActivityTypeAddToReadingList,
//                                   UIActivityTypePostToFlickr,
//                                   UIActivityTypePostToVimeo];
//    
//    activityVC.excludedActivityTypes = excludeActivities;
    
    DashCamActivityViewController *dcActivity = [[DashCamActivityViewController alloc]init];
    UIActivityViewController *activityVC = [dcActivity getActivityViewController];
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
