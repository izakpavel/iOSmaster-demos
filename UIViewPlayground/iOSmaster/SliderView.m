//
//  SliderView.m
//  iOSmaster
//
//  Created by myf on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "SliderView.h"

@implementation SliderView
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _doubleSliderView = [[DoubleSliderView alloc] init];
        [self addSubview:_doubleSliderView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat padding = 10;
    _doubleSliderView.frame = CGRectMake(padding, padding, self.frame.size.width-2*padding, [DoubleSliderView preferredHeight]);
}
@end
