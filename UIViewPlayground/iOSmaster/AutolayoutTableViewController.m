//
//  AutolayoutTableViewController.m
//  iOSmaster
//
//  Created by Myridiphis on 02.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "AutolayoutTableViewController.h"
#import "AutoLAyoutTableViewCell.h"

@interface AutolayoutTableViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation AutolayoutTableViewController

- (void)loadView {
    self.view = _autolayoutTableView = [[AutoLayoutTableView alloc] init];
    _autolayoutTableView.delegate = self;
    _autolayoutTableView.dataSource = self;
    //_autolayoutTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self prepareData];
}

- (void) prepareData {
    _dataArray = [NSMutableArray array];
    for (NSInteger i=0; i<50; i++) {
        NSMutableString * text = [NSMutableString stringWithString:@""];
        for (NSInteger j=0; j<rand()%80+1; j++) {
            [text appendString:@"lorem "];
        }
        [_dataArray addObject: text];
    }
}

#pragma mark TableViewDelegate and DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoLayoutTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[AutoLayoutTableViewCell cellID]];
    if (!cell) {
        cell = [[AutoLayoutTableViewCell alloc] init];
    }
    cell.firstLabel.text = _dataArray[indexPath.row];
    cell.secondLabel.text = _dataArray[indexPath.row];
    return cell;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 160;
}
*/
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
