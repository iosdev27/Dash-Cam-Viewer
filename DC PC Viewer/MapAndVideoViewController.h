//
//  MapAndVideoViewController.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/14/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>


@interface MapAndVideoViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *tripMapView;
@property(nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

-(IBAction)backButtonPressed:(id)sender;

@end
