//
//  IACChildrenAboutViewController.m
//  DequeU
//
//  Created by Nicholas Andrew Shahin on 6/28/16.
//  Copyright © 2016 Deque Systems. All rights reserved.
//


#import "IACChildrenBrokenViewController.h"
#import "IACUtilities.h"
#import "IACConstants.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface IACChildrenBrokenViewController () {
    AVAudioPlayer* _AudioPlayer;
}
@end

@implementation IACChildrenBrokenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_buttonStarSpangledBanner setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonStarSpangledBanner addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    [_buttonAmazingGrace setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonAmazingGrace addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    [_buttonSinginInTheRain setAccessibilityHint:NSLocalizedString(@"PLAYS_MUSIC", nil)];
    [_buttonSinginInTheRain addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    _buttonStarSpangledBanner.accessibilityPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_buttonStarSpangledBanner.frame.origin.x+23, _buttonStarSpangledBanner.frame.origin.y+50, _buttonStarSpangledBanner.frame.size.width*2, _buttonStarSpangledBanner.frame.size.height + 64) cornerRadius: 4];
    
    _buttonAmazingGrace.accessibilityPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_buttonAmazingGrace.frame.origin.x+114, _buttonAmazingGrace.frame.origin.y+54, _buttonAmazingGrace.frame.size.width*2, _buttonAmazingGrace.frame.size.height+64) cornerRadius: 4];
    
    _buttonSinginInTheRain.accessibilityPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_buttonSinginInTheRain.frame.origin.x+230, _buttonSinginInTheRain.frame.origin.y+46, _buttonSinginInTheRain.frame.size.width*1.4, _buttonSinginInTheRain.frame.size.height+74) cornerRadius: 4];
    
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
