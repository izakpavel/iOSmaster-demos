//
//  AutoLAyoutTableViewCell.m
//  iOSmaster
//
//  Created by Myridiphis on 02.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "AutoLAyoutTableViewCell.h"

@implementation AutoLAyoutTableViewCell

- (instancetype) init {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self.class cellID]];
    if (self) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.numberOfLines = 0;
        _firstLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:_firstLabel];
        _firstLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.numberOfLines = 0;
        _secondLabel.backgroundColor = [UIColor yellowColor];
        _secondLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:_secondLabel];
        _secondLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSDictionary * views = NSDictionaryOfVariableBindings(_firstLabel, _secondLabel);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_firstLabel]-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[_secondLabel]-|" options:0 metrics:nil views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_firstLabel]-[_secondLabel]-|" options:0 metrics:nil views:views]];
        
    }
    return self;
}

+ (NSString *) cellID {
    return @"CellId";
}

@end
