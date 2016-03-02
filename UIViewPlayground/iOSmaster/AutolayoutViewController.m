//
//  AutolayoutViewController.m
//  iOSmaster
//
//  Created by myf on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "AutolayoutViewController.h"

@implementation AutolayoutViewController
- (void)loadView {
    self.view = _autolayoutView = [[AutolayoutView2 alloc] init];
    //[_autolayoutView.bottomButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonPressed:(id) sender {
    //_autolayoutView.topLabel.text = @"top label changed";
    //_autolayoutView.bottomLabel.text = @"changed";
}
@end
