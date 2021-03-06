//
//  IACDynamicNotificationsBrokenViewController_test.m
//  Deque University for iOS
//
//  Created by Jennifer Dailey on 5/12/15.
//  Copyright (c) 2015 Deque Systems. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IACDynamicNotificationsBrokenViewController.h"
#import "DEQAsserts.h"

@interface IACDynamicNotificationsBrokenViewController_test : XCTestCase {
@private
    IACDynamicNotificationsBrokenViewController* _viewController;
}
@end

@implementation IACDynamicNotificationsBrokenViewController_test

- (void)setUp {
    [super setUp];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"DynamicNotifications" bundle:nil];
    _viewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"brokenDynamicNotification"];
    [_viewController view];
}

- (void)testInitialSetUp {
    XCTAssert([_viewController.contactList count] == 0);
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertStringEqual(_viewController.textField.placeholder, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
}

- (void)testAccessibilityWhenTextFieldHasText {
    _viewController.textField.text = @"1";
    DEQAssertStringEqual(_viewController.textField.text, @"1");
    DEQAssertStringEqual(_viewController.textField.accessibilityLabel, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertStringEqual(_viewController.textField.placeholder, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
}

- (void)testAccessibilityWhenTextFieldIsEmpty {
    _viewController.textField.text = @"2";
    DEQAssertStringEqual(_viewController.textField.text, @"2");
    DEQAssertStringEqual(_viewController.textField.accessibilityLabel, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertStringEqual(_viewController.textField.placeholder, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
    
    _viewController.textField.text = @"";
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertStringEqual(_viewController.textField.placeholder, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
}

- (void)testSaveWhenTextFieldIsEmpty {
    DEQAssertEmptyString(_viewController.textField.text);
    [_viewController saveItem];
    XCTAssert([_viewController.contactList count] == 0);
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
}

- (void)testSaveWhenTextFieldIsNotEmpty {
    _viewController.textField.text = @"item 1";
    DEQAssertStringEqual(_viewController.textField.text, @"item 1");
    DEQAssertStringEqual(_viewController.textField.accessibilityLabel, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
    [_viewController saveItem];
    XCTAssert([_viewController.contactList count] == 1);
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
    DEQAssertStringEqual(_viewController.contactList[0], @"item 1");
}

- (void)testSaveWhenContactListIsNotEmpty {
    _viewController.textField.text = @"item 2";
    _viewController.contactList[0] = @"item 1";
    DEQAssertStringEqual(_viewController.contactList[0], @"item 1");
    DEQAssertStringEqual(_viewController.textField.text, @"item 2");
    XCTAssert([_viewController.contactList count] == 1);
    [_viewController saveItem];
    XCTAssert([_viewController.contactList count] == 2);
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
    DEQAssertStringEqual(_viewController.contactList[0], @"item 1");
    DEQAssertStringEqual(_viewController.contactList[1], @"item 2");
}

- (void)testClearContactsWhenContactListAndTextFieldAreNotEmpty {
    _viewController.textField.text = @"item 3";
    _viewController.contactList[0] = @"item 1";
    _viewController.contactList[1] = @"item 2";
    DEQAssertStringEqual(_viewController.textField.text, @"item 3");
    XCTAssert([_viewController.contactList count] == 2);
  //  [_viewController textChanged];
    [_viewController clearList];
    XCTAssert([_viewController.contactList count] == 0);
    DEQAssertStringEqual(_viewController.textField.text, @"item 3");
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertStringEqual(_viewController.textField.accessibilityLabel, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
}

- (void)testClearContactsWhenContactListIsEmptyAndTextFieldIsNotEmpty {
    _viewController.textField.text = @"item 3";
    DEQAssertStringEqual(_viewController.textField.text, @"item 3");
    XCTAssert([_viewController.contactList count] == 0);
  //  [_viewController textChanged];
    [_viewController clearList];
    XCTAssert([_viewController.contactList count] == 0);
    DEQAssertStringEqual(_viewController.textField.text, @"item 3");
    DEQAssertStringEqual(_viewController.textField.accessibilityLabel, NSLocalizedString(@"PLACEHOLDER_TEXT", nil));
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
}

- (void)testClearContactsWhenTextFieldAndContactListAreEmpty {
    DEQAssertEmptyString(_viewController.textField.text);
    XCTAssert([_viewController.contactList count] == 0);
    [_viewController clearList];
    XCTAssert([_viewController.contactList count] == 0);
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
}

- (void)testClearContactsWhenContactListIsNotEmptyAndTextFieldIsEmpty {
    _viewController.contactList[0] = @"item 1";
    _viewController.contactList[1] = @"item 2";
    DEQAssertEmptyString(_viewController.textField.text);
    XCTAssert([_viewController.contactList count] == 2);
    [_viewController clearList];
    XCTAssert([_viewController.contactList count] == 0);
    DEQAssertEmptyString(_viewController.textField.text);
    DEQAssertEmptyString(_viewController.textField.accessibilityHint);
    DEQAssertEmptyString(_viewController.textField.accessibilityLabel);
}

@end
