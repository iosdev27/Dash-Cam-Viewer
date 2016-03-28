//
//  MapVideoView.m
//  DC PC Viewer
//
//  Created by Vin Chopra on 3/25/16.
//  Copyright © 2016 Vin Chopra. All rights reserved.
//

#import "MapVideoView.h"
@import AVFoundation;
@import AVKit;

@implementation MapVideoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        AVPlayerViewController *avpController = [[AVPlayerViewController alloc]init];
//        avpController.view.frame = CGRectMake(0,667/2, 375, 250);
        avpController.view.frame = CGRectMake(0,400, 375, 250);
        
        [self addSubview:avpController.view];
        AVPlayer *myPlayer;
        NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"TCI_1" withExtension:@"MP4"];
        myPlayer = [AVPlayer playerWithURL:videoURL];
        
        avpController.player = myPlayer;
//        [myPlayer play];

    }
    return self;
}


@end
