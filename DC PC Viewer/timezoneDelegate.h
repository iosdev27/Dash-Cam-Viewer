//
//  timezoneDelegate.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/30/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol timezoneDelegate <NSObject>

- (void)setSelectedTimeZone:(NSString*)selecteZone;

@end
