//
//  MainPasswordInput.h
//  Passbuster
//
//  Created by Fincher Justin on 15/10/31.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPasswordInput : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *PassInnerView;
@property (weak, nonatomic) IBOutlet UIImageView *PassOuterView;
@property (weak, nonatomic) IBOutlet UITextField *PassTextfield;
@property (weak, nonatomic) IBOutlet UIButton *Confirmbutton;

@end
