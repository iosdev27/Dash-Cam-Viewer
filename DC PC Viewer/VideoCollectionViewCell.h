//
//  VideoCollectionViewCell.h
//  ExpandableCollectionView
//
//  Created by Vin Chopra on 3/29/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *cellImage;
@property (nonatomic, weak) IBOutlet UILabel *cellLabel;

@end
