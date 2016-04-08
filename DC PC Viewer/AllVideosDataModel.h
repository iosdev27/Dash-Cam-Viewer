//
//  AllVideosDataModel.h
//  DC PC Viewer
//
//  Created by Vin Chopra on 4/5/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AllVideosDataModel : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *allVideosArray;

+ (id)sharedInstance;

@end
