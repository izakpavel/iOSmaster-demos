//
//  MainView.m
//  iOSmaster
//
//  Created by myf on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (instancetype) init {
    self = [super init];
    if (self) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews {
    _tableView.frame = self.bounds;
}
@end
