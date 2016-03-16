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

@interface MapAndVideoViewController ()

@end

@implementation MapAndVideoViewController
@synthesize tripMapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AVPlayerViewController *avpController = [[AVPlayerViewController alloc]init];
    avpController.view.frame = CGRectMake(0,667/2, 375, 250);
    [self addChildViewController:avpController];
    [self.view addSubview:avpController.view];
    
    AVPlayer *myPlayer;
    
    
//    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"vid" ofType:@"mp4"];
//    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
//    myPlayer = [AVPlayer playerWithURL:fileURL];
    
    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"TCI_1" withExtension:@"MP4"];
    myPlayer = [AVPlayer playerWithURL:videoURL];
  
    avpController.player = myPlayer;
    [myPlayer play];
    
    
    
    
//    avpController.view.frame = self.view.frame;
    
    
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
    [tripMapView setMapType:MKMapTypeSatelliteFlyover];
    [tripMapView setZoomEnabled:YES];
    [tripMapView setScrollEnabled:YES];
//    [tripMapView setCenterCoordinate:tripMapView.userLocation.location.coordinate animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
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

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
