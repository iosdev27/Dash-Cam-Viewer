//
//  SDCardConnectionViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/9/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//


#import "SDCardConnectionViewController.h"
#import "DGActivityIndicatorAnimationProtocol.h"
#import "DGActivityIndicatorView.h"



@import SystemConfiguration.CaptiveNetwork;


@interface SDCardConnectionViewController ()

@end

@implementation SDCardConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list@2x.png"]];
//    [self.view addSubview:backgroundView];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallSpinFadeLoader tintColor:[UIColor whiteColor] size:20.0f];
    activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    activityIndicatorView.transform = CGAffineTransformMakeScale(6, 6);
    activityIndicatorView.center = self.view.center;
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
}

- (void)viewDidAppear:(BOOL)animated {

    [NSThread sleepForTimeInterval:1.0f];
    [self dismissViewControllerAnimated:YES completion:nil];
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

@end
