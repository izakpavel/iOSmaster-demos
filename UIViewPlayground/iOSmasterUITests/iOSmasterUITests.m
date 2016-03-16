//
//  iOSmasterUITests.m
//  iOSmasterUITests
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface iOSmasterUITests : XCTestCase

@end

@implementation iOSmasterUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOperation {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery * cellQuery = app.tables.cells;
    [[cellQuery elementBoundByIndex:3] tap];
    
    XCUIElement *enterNumberTextField = app.textFields[@"inputField"];
    [enterNumberTextField tap];
    [enterNumberTextField typeText:@"4"];
    
    [app.buttons[@"start operation"] tap];
    
    XCUIElement * resultLabel = app.staticTexts[@"result is: 370473"];
    NSPredicate * expectationPredicate = [NSPredicate predicateWithFormat:@"exists == true"];
    
    [self expectationForPredicate:expectationPredicate evaluatedWithObject:resultLabel handler: nil];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"error: %@", error);
        }
    }];
}

@end
