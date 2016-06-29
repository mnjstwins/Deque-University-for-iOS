//
//  IACPathAboutViewController.m
//  DequeU
//
//  Created by Nicholas Andrew Shahin on 6/28/16.
//  Copyright © 2016 Deque Systems. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "IACViewController.h"

//! The accessible (fixed) verison of the Hints demonstration.
@interface IACPathFixedViewController : IACViewController {
    IBOutlet UIButton* _buttonStarSpangledBanner; ///< The "Star Spangled Banner" button.
    IBOutlet UIButton* _buttonAmazingGrace; ///< The "Amazing Grace" button.
    IBOutlet UIButton* _buttonSinginInTheRain; ///< The "Singing in the Rain" button.
}

@property (readonly) UIButton* buttonStarSpangledBanner;
@property (readonly) UIButton* buttonAmazingGrace;
@property (readonly) UIButton* buttonSinginInTheRain;

//! Plays the corresponding song when one of the buttons is pressed.
/*!
 * \param sender is the id of the button that was pressed.
 * \returns an NSString of the name of the song that is playing. This is returned for testing purposes.
 */
-(NSString*)playMusic:(id)sender;
@end
