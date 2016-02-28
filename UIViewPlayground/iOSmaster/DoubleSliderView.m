//
//  DoubleSliderView.m
//  iOSmaster
//
//  Created by myf on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "DoubleSliderView.h"
@interface DoubleSliderView()
@property (nonatomic, strong) UIView * minBulletView;
@property (nonatomic, strong) UIView * maxBulletView;
@property (nonatomic, strong) UIView * trackView;
@end

@implementation DoubleSliderView

+ (CGFloat) preferredHeight {
    return 40;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        _trackHeight = 4;
        _bulletSize = 36;
        
        _min = 0;
        _max = 1;
        
        _trackView = [[UIView alloc] init];
        _trackView.backgroundColor = [UIColor blueColor];
        [self addSubview:_trackView];
        
        _minBulletView = [[UIView alloc] init];
        _minBulletView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_minBulletView];
        
        _maxBulletView = [[UIView alloc] init];
        _maxBulletView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:_maxBulletView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _trackView.frame = CGRectMake(0, (self.frame.size.height-_trackHeight)/2, self.frame.size.width, _trackHeight);
    
    _minBulletView.frame = [self frameForBullet:_minBulletView atRelativePosition:_min];
    _maxBulletView.frame = [self frameForBullet:_maxBulletView atRelativePosition:_max];
}

- (CGRect) frameForBullet:(UIView *) bulletView atRelativePosition:(float) relativePosition {
    CGFloat trackWidth = self.frame.size.width-_bulletSize;
    CGFloat xCoord = trackWidth*relativePosition;
    return CGRectMake(xCoord, (self.frame.size.height-_bulletSize)/2, _bulletSize, _bulletSize);
}
@end
