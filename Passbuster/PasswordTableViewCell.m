//
//  PasswordTableViewCell.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "PasswordTableViewCell.h"
#import "AddSessionViewController.h"
#import "PasswordWapper.h"
@implementation PasswordTableViewCell
@synthesize BackgroundViw,PasswordLabel,UsernameLabel,CompanyLabel;
@synthesize PasswordString,isVisble;

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
    isVisble = [NSNumber numberWithInt:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    if (self.selected == selected) return;
    
    
    [super setSelected:selected animated:animated];
    
    if (selected == YES)
    {

    }
}

- (UIViewController *)viewController {
    /// Finds the view's view controller.
    
    // Traverse responder chain. Return first found view controller, which will be the view's view controller.
    UIResponder *responder = self;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    // If the view controller isn't found, return nil.
    return nil;
}

- (IBAction)WholeButtonPressed:(id)sender
{
    if (isVisble == [NSNumber numberWithInt:1])
    {
        isVisble = [NSNumber numberWithInt:0];
        self.PasswordLabel.text = @"****************";
    }
    else if (isVisble == [NSNumber numberWithInt:0])
    {
        isVisble = [NSNumber numberWithInt:1];
        self.PasswordLabel.text = [[[PasswordWapper alloc] init] getDecryptedPasswordFromCryptedPassword:PasswordString];
    }
}
@end
