//
//  DoubleSliderView.h
//  iOSmaster
//
//  Created by myf on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleSliderView : UIView
@property (nonatomic, assign) float min;
@property (nonatomic, assign) float max;

@property (nonatomic, assign) NSInteger trackHeight;
@property (nonatomic, assign) NSInteger bulletSize;

+ (CGFloat) preferredHeight;
@end
