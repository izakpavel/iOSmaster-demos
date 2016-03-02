//
//  AutolayoutView.m
//  iOSmaster
//
//  Created by Myridiphis on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "AutolayoutView.h"

@implementation AutolayoutView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _topLabel = [[UILabel alloc] init];
        _topLabel.text = @"topLabel";
        _topLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:_topLabel];
        
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.text = @"bottom label underneath";
        _bottomLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:_bottomLabel];
        
        _fillerView = [[UIView alloc] init];
        _fillerView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_fillerView];
        
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomButton setTitle:@"set labels" forState:UIControlStateNormal];
        _bottomButton.backgroundColor = [UIColor blueColor];
        [self addSubview:_bottomButton];
        
        // set autolayout dictionary
        NSDictionary * views = NSDictionaryOfVariableBindings(_topLabel, _bottomLabel, _fillerView, _bottomButton);
        NSDictionary * metrics = @{@"padding":@(10)};
        
        // turn of trasnlating of autoresizing mask
        _topLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _bottomButton.translatesAutoresizingMaskIntoConstraints = NO;
        _fillerView.translatesAutoresizingMaskIntoConstraints = NO;
        
        
        // set autolayout rules
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[_topLabel]-[_fillerView]-padding-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[_bottomLabel]-[_fillerView]-padding-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[_bottomButton]-padding-|" options:0 metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[_topLabel(<=30)]-[_bottomLabel]->=0-[_bottomButton(30)]-padding-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[_fillerView]->=0-[_bottomButton(44)]-padding-|" options:0 metrics:metrics views:views]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_topLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_bottomLabel attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_bottomLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_fillerView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        
        // TODO scrollview
        // TODO table
        // TODO animate
        
    }
    return self;
}

@end
