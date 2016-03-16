//
//  OperationViewController.m
//  iOSmaster
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "OperationViewController.h"
#import "FunkyOperation.h"

@interface OperationViewController () <FunkyOperationDelegate>
@property (nonatomic, strong) NSOperationQueue * operationQueue;
@end

@implementation OperationViewController

- (void)loadView {
    self.view = _operationView = [[OperationView alloc] init];
    [_operationView.submitButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    _operationQueue = [[NSOperationQueue alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_operationQueue cancelAllOperations];
}

#pragma mark button action

- (void) buttonPressed:(id) sender {
    _operationView.resultLabel.text = @"";
    NSInteger number = (NSInteger)[_operationView.textfield.text floatValue];
    [_operationQueue addOperation:[[FunkyOperation alloc] initWithInput:number delegate:self]];
    _operationView.submitButton.enabled = NO;
}

#pragma mark - funky operation delegate

- (void)funkyOperation:(FunkyOperation *)operation didFinishWithResult:(NSInteger)result {
    // called on bg thread
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _operationView.resultLabel.text = [NSString stringWithFormat:@"result is: %d", result];
        _operationView.submitButton.enabled = YES;
    }];
}

- (void) funkyOperation:(FunkyOperation *)operation didUpdateProgress:(double)progress {
    // called on bg thread
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _operationView.progressView.progress = progress;
    }];
}

- (void)funkyOperationWasCancelled:(FunkyOperation *)operation {
    // called on bg thread
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _operationView.submitButton.enabled = YES;
        _operationView.resultLabel.text = @"operation cancelled";
    }];
}

@end
