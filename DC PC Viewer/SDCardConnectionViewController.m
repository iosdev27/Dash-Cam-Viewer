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


@interface SDCardConnectionViewController ()

@end

@implementation SDCardConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"full-screen_half.png"]];
//    [self.view addSubview:backgroundView];
    
    
   
    
//    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:85/255.0f blue:101/255.0f alpha:1.0f];
    self.view.backgroundColor = [UIColor grayColor];
    
    DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallSpinFadeLoader tintColor:[UIColor whiteColor] size:20.0f];
    activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    activityIndicatorView.transform = CGAffineTransformMakeScale(6, 6);
    activityIndicatorView.center = self.view.center;
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    
//    NSArray *activityTypes = @[@(DGActivityIndicatorAnimationTypeNineDots),
//                               @(DGActivityIndicatorAnimationTypeTriplePulse),
//                               @(DGActivityIndicatorAnimationTypeFiveDots),
//                               @(DGActivityIndicatorAnimationTypeRotatingSquares),
//                               @(DGActivityIndicatorAnimationTypeDoubleBounce),
//                               @(DGActivityIndicatorAnimationTypeTwoDots),
//                               @(DGActivityIndicatorAnimationTypeThreeDots),
//                               @(DGActivityIndicatorAnimationTypeBallPulse),
//                               @(DGActivityIndicatorAnimationTypeBallClipRotate),
//                               @(DGActivityIndicatorAnimationTypeBallClipRotatePulse),
//                               @(DGActivityIndicatorAnimationTypeBallClipRotateMultiple),
//                               @(DGActivityIndicatorAnimationTypeBallRotate),
//                               @(DGActivityIndicatorAnimationTypeBallZigZag),
//                               @(DGActivityIndicatorAnimationTypeBallZigZagDeflect),
//                               @(DGActivityIndicatorAnimationTypeBallTrianglePath),
//                               @(DGActivityIndicatorAnimationTypeBallScale),
//                               @(DGActivityIndicatorAnimationTypeLineScale),
//                               @(DGActivityIndicatorAnimationTypeLineScaleParty),
//                               @(DGActivityIndicatorAnimationTypeBallScaleMultiple),
//                               @(DGActivityIndicatorAnimationTypeBallPulseSync),
//                               @(DGActivityIndicatorAnimationTypeBallBeat),
//                               @(DGActivityIndicatorAnimationTypeLineScalePulseOut),
//                               @(DGActivityIndicatorAnimationTypeLineScalePulseOutRapid),
//                               @(DGActivityIndicatorAnimationTypeBallScaleRipple),
//                               @(DGActivityIndicatorAnimationTypeBallScaleRippleMultiple),
//                               @(DGActivityIndicatorAnimationTypeTriangleSkewSpin),
//                               @(DGActivityIndicatorAnimationTypeBallGridBeat),
//                               @(DGActivityIndicatorAnimationTypeBallGridPulse),
//                               @(DGActivityIndicatorAnimationTypeRotatingSandglass),
//                               @(DGActivityIndicatorAnimationTypeRotatingTrigons),
//                               @(DGActivityIndicatorAnimationTypeTripleRings),
//                               @(DGActivityIndicatorAnimationTypeCookieTerminator),
//                               @(DGActivityIndicatorAnimationTypeBallSpinFadeLoader)];
//    
//    for (int i = 0; i < activityTypes.count; i++) {
//        DGActivityIndicatorView *activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:(DGActivityIndicatorAnimationType)[activityTypes[i] integerValue] tintColor:[UIColor whiteColor]];
//        CGFloat width = self.view.bounds.size.width / 5.0f;
//        CGFloat height = self.view.bounds.size.height / 7.0f;
//        
//        activityIndicatorView.frame = CGRectMake(width * (i % 7), height * (int)(i / 7), width, height);
//        [self.view addSubview:activityIndicatorView];
//        [activityIndicatorView startAnimating];
//    }

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
