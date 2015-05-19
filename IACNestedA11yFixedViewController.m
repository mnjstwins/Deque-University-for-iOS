//
//  IACNestedA11yFixedViewController.m
//  Accessibility 101
//
//  Created by Jennifer Dailey on 5/15/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import "IACNestedA11yFixedViewController.h"
#import "IACConstants.h"
#import "IACUtilities.h"

@interface IACNestedA11yFixedViewController ()

@property UIColor* backgroundColorView;

@end

@implementation IACNestedA11yFixedViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.backgroundColorView = [IACUtilities colorWithHexString:GREEN];
    self.view.backgroundColor = self.backgroundColorView;
}

@end
