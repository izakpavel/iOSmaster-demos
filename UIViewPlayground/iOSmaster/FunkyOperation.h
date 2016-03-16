//
//  FunkyOperation.h
//  iOSmaster
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FunkyOperation;

@protocol FunkyOperationDelegate <NSObject>

- (void) funkyOperation:(FunkyOperation *) operation didUpdateProgress:(double) progress;
- (void) funkyOperation:(FunkyOperation *) operation didFinishWithResult:(NSInteger) result;
- (void) funkyOperationWasCancelled:(FunkyOperation *) operation;
@end

@interface FunkyOperation : NSOperation
    @property (nonatomic, assign) NSInteger input;
    @property (nonatomic, readonly) NSInteger result;
    @property (nonatomic, readonly) double progress;
    @property (nonatomic, weak) id<FunkyOperationDelegate> delegate; // delegate methods are called on background thread

- (id) initWithInput:(NSInteger) input delegate:(id<FunkyOperationDelegate>) delegate;
@end
