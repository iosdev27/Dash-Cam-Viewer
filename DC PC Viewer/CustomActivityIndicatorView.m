//
//  CustomActivityIndicatorView.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/9/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "CustomActivityIndicatorView.h"

@implementation CustomActivityIndicatorView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@interface CustomActivityIndicatorView()

@property (nonatomic,strong) CALayer *animationLayer;
@property (nonatomic,assign) BOOL isAnimating;

- (void)addRotationAnimationToLayer:(CALayer*)layer;
- (void)pauseLayer:(CALayer*)layer;
- (void)resumeLayer:(CALayer*)layer;

@end

@implementation CustomActivityIndicatorView

@synthesize animationLayer,isAnimating;
@synthesize hidesWhenStopped;

- (id)initWithCustomActivityIndicatorImage:(UIImage *)image
{
    CGRect indicatorFrame = CGRectMake(0, 0,image.size.width,image.size.height);
    self  = [self initWithFrame:indicatorFrame];
    self.animationLayer = [CALayer layer];
    [self.animationLayer setFrame:self.frame];
    self.animationLayer.contents = (id)[image CGImage];
    self.animationLayer.masksToBounds = YES;
    [self.layer addSublayer:self.animationLayer];
    
    [self addRotationAnimationToLayer:self.animationLayer];
    [self pauseLayer:self.animationLayer];
    self.hidesWhenStopped = YES;
    
    return self;
}

-(void)addRotationAnimationToLayer:(CALayer*)layer
{
    CABasicAnimation *rotation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.duration = 2.0;
    rotation.removedOnCompletion = NO;
    rotation.repeatCount = HUGE_VALF;
    rotation.fillMode = kCAFillModeForwards;
    rotation.fromValue = [NSNumber numberWithFloat:0.0];
    rotation.toValue = [NSNumber numberWithFloat:3.14*2];
    [self.animationLayer addAnimation:rotation forKey:@"rotate"];
}

-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime =
    [layer convertTime:CACurrentMediaTime()
             fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    isAnimating = NO;
}
-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause =
    [layer convertTime:CACurrentMediaTime()
             fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
    isAnimating = YES;
}
- (void)startAnimating
{
    if(self.hidesWhenStopped){
        [self setHidden:NO];
    }
    [self resumeLayer:self.animationLayer];
}
- (void)stopAnimating
{
    if(self.hidesWhenStopped){
        [self setHidden:YES];
    }
    [self pauseLayer:self.animationLayer];
}
- (BOOL)isAnimating
{
    return isAnimating;
}

@end
