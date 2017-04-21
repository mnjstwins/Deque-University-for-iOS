//
//  DQAppDelegate.m
//  Deque University for iOS
//
//  Created by Catherine Fisher on 2/5/14.
//  Copyright (c) 2014 Deque Systems. All rights reserved.
//

#import "DQAppDelegate.h"
#import "GAI.h"
#import <A11yAnalysisFramework/A11yAnalysisFramework.h>

@implementation DQAppDelegate

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [Attest getInstance];
}

@end
