//
//  PasswordTableViewController.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#import "PasswordTableViewController.h"
#import "PasswordTableViewCell.h"
#import "AddSessionViewController.h"
#import "FMDBAPI.h"
#import "Password.h"
#import "PasswordClass.h"
#import <KVNProgress/KVNProgress.h>
#import "MJRefresh.h"

@interface PasswordTableViewController ()

@property (strong, nonatomic) PasswordClass *AllSession;


@end

@implementation PasswordTableViewController
@synthesize AllSession;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PasswordTableViewCell" bundle:nil] forCellReuseIdentifier:@"PasswordTableViewCell"];
    self.tableView.separatorColor = [UIColor clearColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddSession)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(SearchSession)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    // During startup (-viewDidLoad or in storyboard) do:
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.header beginRefreshing];
    
}

- (void)loadNewData
{
    AllSession = [self GetAllSessionFromFMDB];
    
    if (AllSession) {
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    }

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self loadNewData];
}
// Override to support conditional editing of the table view.
// This only needs to be implemented if you are going to be returning NO
// for some items. By default, all items are editable.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //add code here for when you hit delete
        Password *PasswordInstance = AllSession.PasswordArray[indexPath.row];
        [[[FMDBAPI alloc] init] RemoveAccountSessionWithIndex:[NSNumber numberWithInteger:[PasswordInstance.Index integerValue]]];
        [self loadNewData];
    }
}
- (PasswordClass *)GetAllSessionFromFMDB
{
    PasswordClass *NewPasswordClass = [[PasswordClass alloc] init];
    NSString * doc = PATH_OF_DOCUMENT;
    NSString * path = [doc stringByAppendingPathComponent:@"user.sqlite"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path] == YES)
    {
        
        FMDatabase *db = [FMDatabase databaseWithPath:path];
        db.logsErrors = YES;
        if ([db open])
        {
            FMResultSet *AllSessions = [db executeQuery:@"SELECT * FROM AccountSession"];
            if (AllSessions)
            {
                NSLog(@"SUCCESS get AllSessions");
                while ([AllSessions next])
                {
                    NSLog(@"ONE SESSION");
                    
                    NSString *IndexString = [AllSessions stringForColumnIndex:0];
                    NSLog(@"IndexString %@",IndexString);
                    NSString *CompanyString = [AllSessions stringForColumnIndex:1];
                    NSLog(@"CompanyString %@",CompanyString);
                    NSString *UsernameString = [AllSessions stringForColumnIndex:2];
                    NSLog(@"UsernameString %@",UsernameString);
                    NSString *PasswordString = [AllSessions stringForColumnIndex:3];
                    NSLog(@"PasswordString %@",PasswordString);
                    
                    Password *NewPassword = [[Password alloc] init];
                    NewPassword.Company = [NSString stringWithString:CompanyString];
                    NewPassword.Username = [NSString stringWithString:UsernameString];
                    NewPassword.Index = [NSString stringWithString:IndexString];
                    NewPassword.PasswordString = [NSString stringWithString:PasswordString];
                    [NewPasswordClass.PasswordArray addObject:NewPassword];
                }
                [AllSessions close];
                NSLog(@"%@",[NewPasswordClass debugDescription]);
                return NewPasswordClass;
            }
            
            else
            {
                [db close];
                NSLog(@"ERROR get AllSessions");
                return nil;
            }
            
        }
        else
        {
            NSLog(@"error when open db");
            return nil;
        }
        
    }
    else
    {
        return nil;
    }
    
}


- (void)AddSession
{
    NSLog(@"AddSession");
    AddSessionViewController *NewAddSessionViewController = [[AddSessionViewController alloc] init];
    [self.navigationController pushViewController:NewAddSessionViewController animated:YES];
    
}

-(void)SearchSession
{
    NSLog(@"SearchSession");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return AllSession.PasswordArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PasswordTableViewCell *PasswordCell = [tableView dequeueReusableCellWithIdentifier:@"PasswordTableViewCell" forIndexPath:indexPath];
    Password * PasswordInstance = AllSession.PasswordArray[indexPath.row];
    PasswordCell.CompanyLabel.text = PasswordInstance.Company;
    PasswordCell.UsernameLabel.text = PasswordInstance.Username;
    PasswordCell.PasswordLabel.text = @"****************";
    PasswordCell.PasswordString = PasswordInstance.PasswordString;
    return PasswordCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 132.0f ;
}

@end
