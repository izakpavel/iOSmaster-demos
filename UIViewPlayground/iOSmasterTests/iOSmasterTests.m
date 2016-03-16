//
//  iOSmasterTests.m
//  iOSmasterTests
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FunkyOperation.h"

@interface iOSmasterTests : XCTestCase

@end

@implementation iOSmasterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLargeNumber {
    NSInteger largeNumber = [FunkyOperation computeLargeNumber:2];
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual(largeNumber, 222345);
}

/* OLD way with waiting
- (void) testFunkyOperation {
    NSDate *timeoutDate = [NSDate dateWithTimeIntervalSinceNow:5.0];
    NSOperationQueue * operationQueue = [[NSOperationQueue alloc] init];
    FunkyOperation * funkyOperation = [[FunkyOperation alloc] initWithInput:2 delegate:nil];
    __block FunkyOperation * weakOperation = funkyOperation;
    __block BOOL operationFinished = NO;
    [funkyOperation setCompletionBlock:^{
        operationFinished = YES;
        NSInteger result = weakOperation.result;
        XCTAssertEqual(result, 185288);
    }];
    
    [operationQueue addOperation:funkyOperation];
    
    // OLD way
    while (operationFinished == NO && ([timeoutDate timeIntervalSinceNow] > 0)) {
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.01, YES);
    }
    
    if (operationFinished == NO) {
        XCTFail(@"Operation timeOut");
    }
}
*/

- (void) testFunkyOperation {
    XCTestExpectation * expectation = [self expectationWithDescription:@"Funky Operation Finished"];
    
    NSOperationQueue * operationQueue = [[NSOperationQueue alloc] init];
    FunkyOperation * funkyOperation = [[FunkyOperation alloc] initWithInput:2 delegate:nil];
    __block FunkyOperation * weakOperation = funkyOperation;
    [funkyOperation setCompletionBlock:^{
        [expectation fulfill];
        NSInteger result = weakOperation.result;
        XCTAssertEqual(result, 185288);
    }];
    
    [operationQueue addOperation:funkyOperation];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
