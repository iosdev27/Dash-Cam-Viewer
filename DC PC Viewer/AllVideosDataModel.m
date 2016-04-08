//
//  AllVideosDataModel.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 4/5/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "AllVideosDataModel.h"
static AllVideosDataModel *allVideosDataModelSharedInstance = nil;

@interface AllVideosDataModel () {
    @private
    NSString *currentElement;
}

- (void)loadData;
@end

@implementation AllVideosDataModel
{
    NSXMLParser *tripDataParser;
}

@synthesize allVideosArray;

-(id)init
{
    if(allVideosDataModelSharedInstance) {
        self = allVideosDataModelSharedInstance;
    } else if((self=[super init])) {
        allVideosArray = [[NSMutableArray alloc]init];
        
        [self loadData];
       
        allVideosDataModelSharedInstance = self;
    }
    return self;
}

- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DCAppDataSet"
                                                     ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser parse];
}
+ (id)sharedInstance {
    static AllVideosDataModel *allVideosDataModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allVideosDataModel = [[self alloc] init];
    });
    return allVideosDataModel;
}


# pragma -mark NSXMLParser delegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"Video"]) {
        NSMutableDictionary *videoDict = [[NSMutableDictionary alloc]init];
        
        NSLog(@"Video type is :%@", (NSString *)[attributeDict valueForKey:@"type"]);
        NSLog(@"Vide time is :%@", (NSString *)[attributeDict valueForKey:@"time"]);
        NSLog(@"Vide tripID is :%@", (NSString *)[attributeDict valueForKey:@"tripID"]);
        NSLog(@"Vide day is :%@", (NSString *)[attributeDict valueForKey:@"day"]);
        NSLog(@"Vide thumbnail is :%@", (NSString *)[attributeDict valueForKey:@"thumbnail"]);
        NSLog(@"Vide videoName is :%@", (NSString *)[attributeDict valueForKey:@"videoName"]);
        
        [videoDict setObject:(NSString *)[attributeDict valueForKey:@"type"] forKey:@"type"];
        [videoDict setObject:(NSString *)[attributeDict valueForKey:@"time"] forKey:@"time"];
        [videoDict setObject:(NSString *)[attributeDict valueForKey:@"tripID"] forKey:@"tripID"];
        [videoDict setObject:(NSString *)[attributeDict valueForKey:@"day"] forKey:@"day"];
        [videoDict setObject:(NSString *)[attributeDict valueForKey:@"thumbnail"] forKey:@"thumbnail"];
        [videoDict setObject:(NSString *)[attributeDict valueForKey:@"videoName"] forKey:@"videoName"];
        
        [allVideosArray addObject:videoDict];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
}

@end
