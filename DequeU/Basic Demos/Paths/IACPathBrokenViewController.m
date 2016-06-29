//
//  IACPathAboutViewController.m
//  DequeU
//
//  Created by Nicholas Andrew Shahin on 6/28/16.
//  Copyright © 2016 Deque Systems. All rights reserved.
//


#import "IACPathBrokenViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface IACPathBrokenViewController () {
    AVAudioPlayer* _AudioPlayer;
}
@end

@implementation IACPathBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_buttonStarSpangledBanner setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonStarSpangledBanner addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    [_buttonAmazingGrace setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonAmazingGrace addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_buttonSinginInTheRain setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonSinginInTheRain addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (NSString*)playMusic:(id)sender {
    
    NSLog(@"Trying to play music");
    
    if ([_AudioPlayer isPlaying]) [_AudioPlayer stop];
    
    UIButton* button = (UIButton*)sender;
    NSString* song = nil;
    
    if (button == _buttonStarSpangledBanner) {
        song = @"SSB";
    } else if (button == _buttonAmazingGrace) {
        song = @"AG";
    } else {
        song = @"SIR";
    }
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:song ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    NSError* error;
    _AudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    
    if (error) NSLog(@"Error: %@", error);
    
    _AudioPlayer.numberOfLoops = 0;
    _AudioPlayer.volume = 1;
    
    [_AudioPlayer performSelector:@selector(stop) withObject:_AudioPlayer afterDelay:3];
    
    [_AudioPlayer play];
    
    return song;
}

@end
