//
//  AutolayoutView2.m
//  iOSmaster
//
//  Created by Myridiphis on 02.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "AutolayoutView2.h"

@implementation AutolayoutView2

NSString * text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus porttitor turpis ac leo. Nunc dapibus tortor vel mi dapibus sollicitudin. Curabitur vitae diam non enim vestibulum interdum. Maecenas libero. Ut tempus purus at lorem. Nam sed tellus id magna elementum tincidunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Aenean placerat. Aliquam erat volutpat. Aliquam ante. Donec iaculis gravida nulla. \nInteger imperdiet lectus quis justo. Aliquam in lorem sit amet leo accumsan lacinia. Suspendisse sagittis ultrices augue. Morbi imperdiet, mauris ac auctor dictum, nisl ligula egestas nulla, et sollicitudin sem purus in lacus. Nullam justo enim, consectetuer nec, ullamcorper ac, vestibulum in, elit. Nam quis nulla. Phasellus faucibus molestie nisl. Quisque tincidunt scelerisque libero. Maecenas lorem. Maecenas fermentum, sem in pharetra pellentesque, velit turpis volutpat ante, in pharetra metus odio a lectus. Mauris metus. Suspendisse sagittis ultrices augue. Aliquam id dolor. Pellentesque ipsum. Suspendisse nisl. Pellentesque sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Vivamus porttitor turpis ac leo. Cras elementum. Phasellus enim erat, vestibulum vel, aliquam a, posuere eu, velit.";

- (id) init {
    self = [super init];
    if (self) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor yellowColor];
        [self addSubview:_scrollView];
        
        _label = [[UILabel alloc] init];
        _label.text = text;
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor lightGrayColor];
        [_scrollView addSubview:_label];
        
        _view = [[IntrinsicView alloc] init];
        _view.backgroundColor = [UIColor redColor];
        [_scrollView addSubview:_view];
        
        // autolayout
        NSDictionary * views = NSDictionaryOfVariableBindings(_label, _scrollView, _view, self);
        _label.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _view.translatesAutoresizingMaskIntoConstraints = NO;
        
        /*[self addConstraint:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:150]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:150]];*/
         
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics:nil views:views]];
        
        [_scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_label]-[_view]|" options:0 metrics:nil views:views]];
        [_scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_label(_scrollView)]" options:0 metrics:nil views:views]];
    }
    return self;
}

@end
