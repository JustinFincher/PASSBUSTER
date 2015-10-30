//
//  SettingsTableViewController.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "FMDBAPI.h"
#import "CocoaSecurity.h"

@interface SettingsTableViewController ()<UIAlertViewDelegate>

@end

@implementation SettingsTableViewController

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //Code.....
    if ([alertView.title  isEqual: @"NEW PASS!"])
    {
        if (buttonIndex == 1)
        {
            NSLog(@"WILL CHANGE MAIN PWD");
            UITextField *textField = [alertView textFieldAtIndex:0];
            
            
            NSString *MainPassword = textField.text;
            NSString *MainPassword_Trimmed = [MainPassword stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            //全部解密重新加密
            if ([[[FMDBAPI alloc] init]DatabaseMigratedWithNewPassword:MainPassword_Trimmed])
            {
                //修改系统主密码
                CocoaSecurityResult *MainPassword_md5 = [CocoaSecurity md5:MainPassword_Trimmed];
                NSLog(@"MainPsssword MD5 = %@",MainPassword_md5.hex);
                if ([[[FMDBAPI alloc] init]ChangeAccountSessionWithMainPassword:MainPassword_md5.hex])
                {
                    NSLog(@"SettingsTableViewController : SetPassword Complete.");
                }
            };

        }
    }
}


- (IBAction)ResetPassword:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"NEW PASS!"
                              message:@"Please enter your new pass word:"
                              delegate:self
                              cancelButtonTitle:@"Cancel"
                              otherButtonTitles:@"Ok", nil];
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    /* Display a numerical keypad for this text field */
    UITextField *textField = [alertView textFieldAtIndex:0];
    textField.secureTextEntry = YES;
    
    [alertView show];
}
- (IBAction)DestroyDatabase:(id)sender
{
    if ([[[FMDBAPI alloc] init] SelfDestroy])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Self Destroy Complete"
                                                                       message:@"Will exit now."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action)
        {
            [NSException raise:@"Self Destroy" format:@"Self Destroy"];
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
