//
//  IACPathAboutViewController.m
//  DequeU
//
//  Created by Nicholas Andrew Shahin on 6/28/16.
//  Copyright © 2016 Deque Systems. All rights reserved.
//


#import "IACPathFixedViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@import UIKit;

@interface IACPathFixedViewController () {
    AVAudioPlayer* _AudioPlayer;
}
@end

@implementation IACPathFixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_buttonStarSpangledBanner setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonStarSpangledBanner addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    [_buttonAmazingGrace setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonAmazingGrace addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_buttonSinginInTheRain setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonSinginInTheRain addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];

    _buttonStarSpangledBanner.accessibilityPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_buttonStarSpangledBanner.frame.origin.x-153, _buttonStarSpangledBanner.frame.origin.y+74, _buttonStarSpangledBanner.frame.size.width+190, _buttonStarSpangledBanner.frame.size.height) cornerRadius: 4];
    
    _buttonAmazingGrace.accessibilityPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_buttonAmazingGrace.frame.origin.x-153, _buttonAmazingGrace.frame.origin.y+74, _buttonAmazingGrace.frame.size.width+140, _buttonAmazingGrace.frame.size.height) cornerRadius: 4];
    
    _buttonSinginInTheRain.accessibilityPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_buttonSinginInTheRain.frame.origin.x-153, _buttonSinginInTheRain.frame.origin.y+74, _buttonSinginInTheRain.frame.size.width+158, _buttonSinginInTheRain.frame.size.height) cornerRadius: 4];
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
