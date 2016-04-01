//
//  DashCamActivityViewController.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/30/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "DashCamActivityViewController.h"

@implementation DashCamActivityViewController

- (id)init {
    if (!(self = [super init])) {
        return nil;
    }
    return self;
}

- (NSString *)activityType {
    return @"MyFeedbackActivity";
}

- (NSString *)activityTitle {
    return @"Feedback";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"Chapter Analytics40.png"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}

- (UIActivityViewController *)getActivityViewController {
    DashCamActivityViewController *feedbackActivity = [[DashCamActivityViewController alloc] init];
    DashCamActivityViewController *facebookActivity = [[DashCamActivityViewController alloc] init];
 //   MyMailActivity *mailActivity = [[MyMailActivity alloc] init];
    
    NSArray *applicationActivities = @[feedbackActivity, facebookActivity];

    //NSArray *applicationActivities = @[feedbackActivity, facebookActivity, mailActivity];
    NSArray *activitiesItems = @[@"A string to be used for MyFeedbackActivity", @"A string to be used for MyFacebookActivity", @"A string to be used for MyMailActivity"];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activitiesItems applicationActivities:applicationActivities];
    
    // Removed un-needed activities
    activityVC.excludedActivityTypes = [[NSArray alloc] initWithObjects:
                                        UIActivityTypeCopyToPasteboard,
                                        UIActivityTypePostToWeibo,
                                        UIActivityTypePostToFacebook,
                                        UIActivityTypeSaveToCameraRoll,
                                        UIActivityTypeCopyToPasteboard,
                                        UIActivityTypeMail,
                                        UIActivityTypeMessage,
                                        UIActivityTypeAssignToContact,
                                        nil];
    
    UILabel *testLabel = [[UILabel alloc]init];
    testLabel.text = @"Test label";
    
    testLabel.frame = CGRectMake(0, 0, 50, 50);
    [activityVC.view addSubview:testLabel];
    
    activityVC.view.frame = CGRectMake(0, 0, 375, 600);
    
    return activityVC;
}

- (UIViewController *)activityViewController {
    /**
     * DESCRIPTION:
     * Returns the view controller to present to the user.
     * Subclasses that provide additional UI using a view controller can override this method to return that view controller. If this method returns a valid object, the system presents the returned view controller modally instead of calling the performActivity method.
     * Your custom view controller should provide a view with your custom UI and should handle any user interactions inside those views. Upon completing the activity, do not dismiss the view controller yourself. Instead, call the activityDidFinish: method and let the system dismiss it for you.
     */
    UIViewController *vC = [[UIViewController alloc] init];
    return vC;
    
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    /**
     * DESCRIPTION:
     * Prepares your service to act on the specified data.
     * The default implementation of this method does nothing. This method is called after the user has selected your service but before your service is asked to perform its action. Subclasses should override this method and use it to store a reference to the data items in the activityItems parameter. In addition, if the implementation of your service requires displaying additional UI to the user, you can use this method to prepare your view controller object and make it available from the activityViewController method.
     */
}

-(void)performActivity {
    /**
     * DESCRIPTION:
     * Performs the service when no custom view controller is provided.
     * The default implementation of this method does nothing. If your service does not provide any custom UI using the activityViewController method, override this method and use it to perform the activity. Your activity must operate on the data items received in the prepareWithActivityItems: method.
     * This method is called on your app’s main thread. If your app can complete the activity quickly on the main thread, do so and call the activityDidFinish: method when it is done. If performing the activity might take some time, use this method to start the work in the background and then exit without calling activityDidFinish: from this method. Instead, call activityDidFinish: from your background thread after the actual work has been completed.
     */
}
@end
