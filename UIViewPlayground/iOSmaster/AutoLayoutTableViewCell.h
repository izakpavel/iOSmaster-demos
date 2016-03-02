//
//  AutoLAyoutTableViewCell.h
//  iOSmaster
//
//  Created by Myridiphis on 02.03.16.
//  Copyright © 2016 trinerdis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLayoutTableViewCell : UITableViewCell
    @property (nonatomic, strong) UILabel * firstLabel;
    @property (nonatomic, strong) UILabel * secondLabel;

    + (NSString *) cellID;
@end
