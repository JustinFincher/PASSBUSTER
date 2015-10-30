//
//  Tabbar.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#import "Tabbar.h"
#import "FMDB.h"
#import "IntroAnimator.h"


@interface Tabbar ()

@end

@implementation Tabbar

- (void)viewWillAppear:(BOOL)animated
{
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [self IntroCheck];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)IntroCheck
{
    NSString * doc = PATH_OF_DOCUMENT;
    NSString * path = [doc stringByAppendingPathComponent:@"user.sqlite"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path] == YES)
    {
        FMDatabase * db = [FMDatabase databaseWithPath:path];
        if ([db open])
        {
            int isFirstOpen = [db intForQuery:@"SELECT isFirstOpen FROM AppSettings WHERE id = 1"];
            NSLog(@"isFirstOpen = %d",isFirstOpen);
            if (isFirstOpen == 1)
            {
                NSLog(@"Will go to intro page");
                
                IntroAnimator *IntroAnimatorPage = [[IntroAnimator alloc]init];
                [self presentViewController:IntroAnimatorPage animated:YES completion:^(void){}];
            }
            else
            {
                NSLog(@"IntroCheck : isFirstOpen = 0");
                [db close];
            }
        }
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
