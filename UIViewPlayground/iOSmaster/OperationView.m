//
//  OperationView.m
//  iOSmaster
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "OperationView.h"

@implementation OperationView

- (instancetype) init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _textfield = [[UITextField alloc] init];
        _textfield.backgroundColor = [UIColor lightTextColor];
        _textfield.placeholder = @"Enter number";
        _textfield.accessibilityLabel = @"inputField";
        [self addSubview:_textfield];
        
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setTitle:@"start operation" forState:UIControlStateNormal];
        [_submitButton setBackgroundColor:[UIColor blueColor]];
        [self addSubview:_submitButton];
        
        _progressView = [[UIProgressView alloc] init];
        [self addSubview:_progressView];
        
        _resultLabel = [[UILabel alloc] init];
        //_resultLabel.accessibilityLabel = @"resultLabel";
        [self addSubview:_resultLabel];
    }
    return self;
}

- (void) layoutSubviews {
    CGFloat paddding = 10;
    CGFloat yCoord = paddding;
    CGFloat itemHeight = 40;
    CGFloat itemWidth = self.frame.size.width-2*paddding;

    for (UIView * view in self.subviews) {
        view.frame = CGRectMake(paddding, yCoord, itemWidth, itemHeight);
        yCoord += itemHeight + paddding;
    }
}


@end
