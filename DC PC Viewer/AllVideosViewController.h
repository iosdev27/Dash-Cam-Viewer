//
//  AllVideosViewController.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/7/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "Reachability.h"
#import "MapAndVideoViewController.h"

@interface AllVideosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSMutableSet *_collapsedSections;
}

@property (weak, nonatomic) IBOutlet UIToolbar *navigationToolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButtonItem;
@property (weak, nonatomic) IBOutlet UITableView *allVideosTableView;

@end
