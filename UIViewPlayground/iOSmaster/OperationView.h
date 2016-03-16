//
//  OperationView.h
//  iOSmaster
//
//  Created by Myridiphis on 16.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperationView : UIView
@property (nonatomic, strong) UITextField * textfield;
@property (nonatomic, strong) UIButton * submitButton;
@property (nonatomic, strong) UILabel * resultLabel;
@property (nonatomic, strong) UIProgressView * progressView;
@end
