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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    SWRevealViewController *revealViewController = self.revealViewController;
    
//    UIView *menuButtonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 63, 33)];
//    [self.navigationItem setRightBarButtonItem:self.menuBarButtonItem];
    
    if (revealViewController) {
        [self.menuBarButtonItem setTarget:self.revealViewController];
//        [self.menuBarButtonItem setAction:@selector(revealToggle:)];
        [self.menuBarButtonItem setAction:@selector(rightRevealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
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
