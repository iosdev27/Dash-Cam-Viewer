//
//  CustomActivityIndicatorView.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/9/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CustomActivityIndicatorView : UIView
@property (nonatomic, assign) BOOL hidesWhenStopped;

-(id)initWithCustomActivityIndicatorImage:(UIImage *)image;
-(void)startAnimating;
-(void)stopAnimating;
-(BOOL)isAnimating;

@end
