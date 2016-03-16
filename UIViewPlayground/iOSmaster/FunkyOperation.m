//
//  FunkyOperation.m
//  iOSmaster
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "FunkyOperation.h"

@implementation FunkyOperation

- (id) initWithInput:(NSInteger) input delegate:(id<FunkyOperationDelegate>) delegate {
    self = [super init];
    if (self) {
        _input = input;
        _delegate = delegate;
    }
    return self;
}

- (void) notifyDelegateWithProgress {
    if (_delegate && [_delegate respondsToSelector:@selector(funkyOperation:didUpdateProgress:)]) {
        [_delegate funkyOperation:self didUpdateProgress:_progress];
    }
}

- (void) notifyDelegateWithResult {
    if (_delegate && [_delegate respondsToSelector:@selector(funkyOperation:didFinishWithResult:)]) {
        [_delegate funkyOperation:self didFinishWithResult:_result];
    }
}

- (void) notifyDelegateOboutCancellation {
    if (_delegate && [_delegate respondsToSelector:@selector(funkyOperationWasCancelled:)]) {
        [_delegate funkyOperationWasCancelled:self];
    }
}

+ (NSInteger) computeLargeNumber:(NSInteger) input {
    return input*111111+123;
}

- (void)main {
    NSInteger maxNumber = [self.class computeLargeNumber:_input];
    NSInteger index = 0;
    NSInteger mod2sum = 0;
    NSInteger mod3sum = 0;
    double lastNotifiedProgress = 0;
    double progressNotificationStep = 0.01; // we will notify cca each 2 percent of computation
    
    [self notifyDelegateWithProgress];
    
    while (index<maxNumber && !self.cancelled) {
        if (index%2==0) {
            mod2sum++;
        }
        if (index%3==0) {
            mod3sum++;
        }
        index++;
        
        _progress = (double)index/(double)maxNumber;
        if (_progress-lastNotifiedProgress>progressNotificationStep) {
            lastNotifiedProgress = _progress;
            [self notifyDelegateWithProgress];
        }
        [NSThread sleepForTimeInterval:0.000001];
    }
    if (!self.cancelled) {
        [self notifyDelegateWithProgress];
        _result = mod2sum+mod3sum;
        [self notifyDelegateWithResult];
    }
    else {
        [self notifyDelegateOboutCancellation];
    }
}

@end
