//
//  HamMenuViewController.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/15/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface HamMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *hamMentTableView;

@end
