//
//  AddSessionViewController.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "AddSessionViewController.h"
#import "CocoaSecurity.h"
#import "PasswordWapper.h"
#import "FMDBAPI.h"

@interface AddSessionViewController ()

@end

@implementation AddSessionViewController

@synthesize CompanyTextfield,UsernameTextfield,PasswordTextfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(SaveSession)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)SaveSession
{
    NSString *Company = [CompanyTextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *Username = [UsernameTextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *Password = [PasswordTextfield.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *AESedPassword = [[[PasswordWapper alloc]init]setCryptedPasswordFromDecryptedPassword:Password];

    BOOL isSuccess = [[[FMDBAPI alloc] init]InsertAccountSessionWithUsername:Username WithPassword:AESedPassword WithCompany:Company];
    if (isSuccess)
    {
        NSLog(@"SUCCESS insert a session with COMPANY = %@ USERNAME = %@ PASSWORD = %@",Company,Username,Password);
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"ERROR insert a session with COMPANY = %@ USERNAME = %@ PASSWORD = %@",Company,Username,Password);
    }
    
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
