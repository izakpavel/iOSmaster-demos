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

// panning
@property (nonatomic, strong) UIView * draggedView;
@property (nonatomic, assign) CGPoint touchOffset;
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
        
        [_minBulletView addGestureRecognizer: [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(bulletPanned:)]];
        [_maxBulletView addGestureRecognizer: [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(bulletPanned:)]];
        
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

- (void) bulletPanned:(UIPanGestureRecognizer *) recognizer {
    NSLog(@"%f\t%f", _min, _max);
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            _draggedView = recognizer.view;
            _touchOffset = [recognizer locationInView:_draggedView];
            break;
        
        case UIGestureRecognizerStateChanged:
            if (_draggedView && _draggedView==recognizer.view && self.frame.size.width>0) {
                CGPoint globalOffset = [recognizer locationInView:self];
                float xRatio = (globalOffset.x-_touchOffset.x)/(self.frame.size.width-_bulletSize);
                NSLog(@"x ratio%f", xRatio);
                xRatio = MAX(MIN(1, xRatio), 0);
                ;
                if (_draggedView==_minBulletView) {
                    _min = MIN(_max, xRatio);
                }
                else {
                    _max = MAX(_min, xRatio);
                }
                [self setNeedsLayout];
            }
            break;
        default:
            _draggedView = nil;
            break;
    }
}
@end
