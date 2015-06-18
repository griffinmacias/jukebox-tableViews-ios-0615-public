//
//  FISSongTableViewController.m
//  Jukebox-TableViews
//
//  Created by Mason Macias on 6/17/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "FISSongViewController.h"
#import "FISJukeboxViewController.h"

@interface FISSongViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedOutlet;
- (IBAction)segmentedAction:(id)sender;
- (IBAction)playStopButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;





@end

@implementation FISSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.progressView.progress = 0.0;
    
    

    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.playlist.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSUInteger cellRow = indexPath.row;
    FISSong *song = self.playlist.songs[cellRow];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", song.title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", song.artist];
    
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    NSUInteger selectedSong = selectedIndexPath.row;
    
    FISSong *song = self.playlist.songs[selectedSong];
    
                if (selectedSong) {
            [self setupAVAudioPlayWithFileName:song.fileName];
    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(updateTime:) userInfo:nil repeats:YES];
            [self.audioPlayer play];
                    
}

}

-(void)updateTime:(NSTimer *)timer
{
    [self.progressView setProgress:(self.audioPlayer.currentTime / self.audioPlayer.duration)];
}
- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FISJukeboxViewController *destination = segue.destinationViewController;
    
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    NSUInteger selectedSong = selectedIndexPath.row;
    
    FISSong *song = self.playlist.songs[selectedSong];
    
    destination.song = song;
    
    
}

*/

- (IBAction)segmentedAction:(id)sender {
    
    
    if (self.segmentedOutlet.selectedSegmentIndex == 0) {
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        NSArray *descriptors = @[descriptor];
        self.playlist.songs = [[NSMutableArray alloc] initWithArray:[self.playlist.songs sortedArrayUsingDescriptors:descriptors]];
        
       
        
    }
    
    if (self.segmentedOutlet.selectedSegmentIndex == 1) {
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"artist" ascending:YES];
        NSArray *descriptors = @[descriptor];
        self.playlist.songs = [[NSMutableArray alloc] initWithArray:[self.playlist.songs sortedArrayUsingDescriptors:descriptors]];
        
        
    }
    
    if (self.segmentedOutlet.selectedSegmentIndex == 2) {
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"album" ascending:YES];
        NSArray *descriptors = @[descriptor];
        self.playlist.songs = [[NSMutableArray alloc] initWithArray:[self.playlist.songs sortedArrayUsingDescriptors:descriptors]];
        
       
    }
    
    
     [self.tableView reloadData];
    
    
    
    
    
    
}

- (IBAction)playStopButton:(id)sender {
    
        [self.audioPlayer stop];
 
}

@end
