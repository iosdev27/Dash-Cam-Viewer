//
//  TabBarViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/11/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "TabBarViewController.h"
#import "CEFoldAnimationController.h"
#import "CEHorizontalSwipeInteractionController.h"

@interface TabBarViewController () <UITabBarControllerDelegate>

@end

@implementation TabBarViewController {
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // You do not need this method if you are not supporting earlier iOS Versions
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (void)viewDidLoad {
    
}

- (void)viewDidAppear:(BOOL)animated {
    
}

- (void)viewWillAppear:(BOOL)animated {
    
}




-(NSUInteger)supportedInterfaceOrientations
{
    if (self.selectedViewController)
        return [self.selectedViewController supportedInterfaceOrientations];
    
    return UIInterfaceOrientationMaskPortrait;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (self.view.userInteractionEnabled) {
        NSLog(@"User Interaction enabled.");
    } else
        NSLog(@"User Interaction disabled.");
}

-(BOOL)shouldAutorotate
{
    return NO;
}

@end
