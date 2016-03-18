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
    CEFoldAnimationController *_animationController;
    CEHorizontalSwipeInteractionController *_swipeInteractionController;
}

//- (id)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        self.delegate = self;
//        
//        // create the interaction / animation controllers
//        _swipeInteractionController = [CEHorizontalSwipeInteractionController new];
//        _animationController = [CEFoldAnimationController new];
//        _animationController.folds = 3;
//        
//        // observe changes in the currently presented view controller
//        [self addObserver:self
//               forKeyPath:@"selectedViewController"
//                  options:NSKeyValueObservingOptionNew
//                  context:nil];
//    }
//    return self;
//}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
//                        change:(NSDictionary *)change
//                       context:(void *)context
//{
//    if ([keyPath isEqualToString:@"selectedViewController"] )
//    {
//        // wire the interaction controller to the view controller
//        [_swipeInteractionController wireToViewController:self.selectedViewController
//                                             forOperation:CEInteractionOperationTab];
//    }
//}



//- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
//            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
//                                              toViewController:(UIViewController *)toVC {
//    
//    NSUInteger fromVCIndex = [tabBarController.viewControllers indexOfObject:fromVC];
//    NSUInteger toVCIndex = [tabBarController.viewControllers indexOfObject:toVC];
//    
//    _animationController.reverse = fromVCIndex < toVCIndex;
//    return _animationController;
//}
//
//-(id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
//{
//    return _swipeInteractionController.interactionInProgress ? _swipeInteractionController : nil;
//}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // You do not need this method if you are not supporting earlier iOS Versions
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
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
