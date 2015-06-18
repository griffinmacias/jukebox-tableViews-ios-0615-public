//
//  FISSongTableViewController.h
//  Jukebox-TableViews
//
//  Created by Mason Macias on 6/17/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISPlaylist.h"
#import <AVFoundation/AVFoundation.h>
@interface FISSongViewController : UIViewController
@property (nonatomic, strong) FISPlaylist *playlist;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@end
