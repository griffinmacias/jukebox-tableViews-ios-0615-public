//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Chris Gonzales on 8/21/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"
#import "FISPlaylist.h"

@interface FISJukeboxViewController ()

@property (strong, nonatomic) FISPlaylist *playlist;
//@property (weak, nonatomic) IBOutlet UITextView *playlistView;
//@property (weak, nonatomic) IBOutlet UITextField *songSelectorField;

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
//    [self setup];
}

//-(void)setup
//{
//    self.playlist = [[FISPlaylist alloc] init];
//    self.playlistView.text = self.playlist.description;
//}

//-(void)dismissKeyboard
//{
//    [self.songSelectorField resignFirstResponder];
//}

//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

//- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
//{
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
//                                         pathForResource:fileName
//                                         ofType:@"mp3"]];
//    NSError *error;
//    self.audioPlayer = [[AVAudioPlayer alloc]
//                    initWithContentsOfURL:url
//                    error:&error];
//    if (error)
//    {
//        NSLog(@"Error in audioPlayer: %@",
//              [error localizedDescription]);
//    } else {
//        [self.audioPlayer prepareToPlay];
//    }
//}


//- (IBAction)playButtonTapped:(id)sender {
//    NSNumber *songNumber = [NSNumber numberWithInteger:[self.songSelectorField.text integerValue]];
//    FISSong *selectedSong = [self.playlist songAtPosition:songNumber];
//    if (selectedSong) {
//        [self setupAVAudioPlayWithFileName:selectedSong.fileName];
//        [self.audioPlayer play];
//    } else {
//        self.songSelectorField.text = nil;
//    }
//    [self dismissKeyboard];
//}
//
//- (IBAction)stopButtonTapped:(id)sender {
//    [self dismissKeyboard];
//    [self.audioPlayer stop];
//}

@end
