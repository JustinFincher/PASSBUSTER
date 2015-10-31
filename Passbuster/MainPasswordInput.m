//
//  MainPasswordInput.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/31.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "FMDBAPI.h"
#import "CocoaSecurity.h"
#import "MainPasswordInput.h"

@interface MainPasswordInput ()
@property (nonatomic) int direction;
@property (nonatomic) int shakes;
@end

@implementation MainPasswordInput
@synthesize PassInnerView,PassOuterView,PassTextfield,Confirmbutton;
@synthesize direction,shakes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    Confirmbutton.backgroundColor = [UIColor whiteColor];
    Confirmbutton.layer.cornerRadius = 4;
    Confirmbutton.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    Confirmbutton.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    Confirmbutton.layer.shadowOpacity = 0.2;//阴影透明度，默认0
    Confirmbutton.layer.shadowRadius = 3;//阴影半径，默认3
    Confirmbutton.layer.masksToBounds = NO;
    [Confirmbutton setTitle:@"DONE" forState:UIControlStateNormal];
    [Confirmbutton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [Confirmbutton addTarget:self action:@selector(Login) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)Login
{
    NSString *Password = PassTextfield.text;
    NSString *MainPassword_Trimmed = [Password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    CocoaSecurityResult *MainPassword_md5 = [CocoaSecurity md5:MainPassword_Trimmed];
    NSString *MD5RealPWD = [[[FMDBAPI alloc]init]getMainPasswordFromFMDB];
    
    if ([MainPassword_md5.hex isEqualToString:MD5RealPWD])
    {
        [UIView animateWithDuration:1.0f animations:^(void)
        {
            PassInnerView.transform = CGAffineTransformMakeRotation(90.0f);
        }
                         completion:^(BOOL finished){[self dismissViewControllerAnimated:YES completion:^(void){}];}];
        
    }
    else
    {
        direction = 1;
        shakes = 0;
        [self shake:self.PassTextfield];
    }
}

-(void)shake:(UIView *)theOneYouWannaShake
{
    [UIView animateWithDuration:0.03 animations:^
     {
         theOneYouWannaShake.transform = CGAffineTransformMakeTranslation(5*direction, 0);
     }
                     completion:^(BOOL finished)
     {
         if(shakes >= 10)
         {
             theOneYouWannaShake.transform = CGAffineTransformIdentity;
             return;
         }
         shakes++;
         direction = direction * -1;
         [self shake:theOneYouWannaShake];
     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
