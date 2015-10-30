//
//  PasswordTableViewCell.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "PasswordTableViewCell.h"

@implementation PasswordTableViewCell
@synthesize BackgroundViw,PasswordLabel,UsernameLabel,CompanyLabel;

- (void)awakeFromNib {
    // Initialization code
    
    BackgroundViw.layer.cornerRadius = 4;
    BackgroundViw.backgroundColor = [UIColor whiteColor];
    BackgroundViw.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    BackgroundViw.layer.shadowOffset = CGSizeMake(0,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    BackgroundViw.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    BackgroundViw.layer.shadowRadius = 2;//阴影半径，默认3
    BackgroundViw.layer.masksToBounds = NO;
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
