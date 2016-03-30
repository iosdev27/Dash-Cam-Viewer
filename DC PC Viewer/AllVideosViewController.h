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
#import "STCollapseTableView.h"

@interface AllVideosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {

}

@property (weak, nonatomic) IBOutlet UIToolbar *localToolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButtonItem;
//@property (weak, nonatomic) IBOutlet UITableView *allVideosTableView;
@property (weak, nonatomic) IBOutlet STCollapseTableView *allVideosTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *galleryCollectionView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *listBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *galleryBarButtonItem;

- (IBAction)listBTNClicked:(id)sender;
- (IBAction)galleryViewBarButtonItem:(id)sender;

@end
