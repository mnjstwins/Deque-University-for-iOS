//
//  DQFixedLabelViewController.m
//  iosFireEyesInstructions
//
//  Created by Catherine Fisher on 2/12/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "IACLabelFixedViewController.h"

@interface IACLabelFixedViewController ()

@end

@implementation IACLabelFixedViewController {
    IBOutlet UIButton *_DogDisplay;
    IBOutlet UIButton *_CatDisplay;
    IBOutlet UIButton *_FishDisplay;
    IBOutlet UIImageView *_ImageView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Labels Fixed";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_CatDisplay setAccessibilityLabel:NSLocalizedString(@"CAT", nil)];
    [_DogDisplay setAccessibilityLabel:NSLocalizedString(@"DOG", nil)];
    [_FishDisplay setAccessibilityLabel:NSLocalizedString(@"FISH", nil)];
    
    [_CatDisplay setAccessibilityHint:NSLocalizedString(@"MODIFY_IMAGE", nil)];
    [_FishDisplay setAccessibilityHint:NSLocalizedString(@"MODIFY_IMAGE", nil)];
    [_DogDisplay setAccessibilityHint:NSLocalizedString(@"MODIFY_IMAGE", nil)];
    
    [_CatDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_DogDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    [_FishDisplay addTarget:self action:@selector(displayImage:) forControlEvents:UIControlEventTouchDown];
    
    [_ImageView setImage:[UIImage imageNamed:@"dog"]];
    [_ImageView setAccessibilityHint:@""]; //Sometimes hints aren't needed, this silences the warning.
    [_ImageView setAccessibilityLabel:NSLocalizedString(@"DOG", nil)];
    [_ImageView setIsAccessibilityElement:YES];
}

- (void)displayImage:(id)sender {
    UIButton* button = (UIButton*)sender;
    
    if (button == _CatDisplay) {
        [self updateImage:@"cat"];
    } else if (button == _DogDisplay) {
        [self updateImage:@"dog"];
    } else {
        [self updateImage:@"fish"];
    }
}

- (void)updateImage:(NSString*)name {
    [_ImageView setImage:[UIImage imageNamed:name]];
    [_ImageView setAccessibilityLabel:name];
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end