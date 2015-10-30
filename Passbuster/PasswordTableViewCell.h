//
//  PasswordTableViewCell.h
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *BackgroundViw;
@property (weak, nonatomic) IBOutlet UILabel *CompanyLabel;
@property (weak, nonatomic) IBOutlet UILabel *UsernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *PasswordLabel;


@end
