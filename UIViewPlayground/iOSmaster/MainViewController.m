//
//  ViewController.m
//  iOSmaster
//
//  Created by myf on 28.02.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import "MainViewController.h"
#import "AutolayoutViewController.h"
#import "SliderViewController.h"
#import "MainView.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) MainView * mainView;
@property (nonatomic, strong) NSArray * chapters;
@property (nonatomic, strong) NSArray * viewControllerClasses;
@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _chapters = @[@"Double slider", @"Autolayout"];
        _viewControllerClasses = @[[SliderViewController class], [AutolayoutViewController class]];
        self.title = @"Topics";
    }
    return self;
}

- (void)loadView {
    self.view = _mainView = [[MainView alloc] init];
    _mainView.tableView.delegate = self;
    _mainView.tableView.dataSource = self;
}

#pragma mark - UITableViewDelegate and data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _chapters.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellId = @"chapterCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _chapters[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row<_viewControllerClasses.count) {
        Class controllerClass = _viewControllerClasses[indexPath.row];
        UIViewController * controller = [[controllerClass alloc] init];
        controller.title = _chapters[indexPath.row];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
