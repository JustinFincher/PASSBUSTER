//
//  PasswordTableViewController.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "PasswordTableViewController.h"
#import "PasswordTableViewCell.h"
#import "AddSessionViewController.h"
@interface PasswordTableViewController ()

@end

@implementation PasswordTableViewController

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
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PasswordTableViewCell *PasswordCell = [tableView dequeueReusableCellWithIdentifier:@"PasswordTableViewCell" forIndexPath:indexPath];

    
    
    return PasswordCell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 132.0f ;
}

@end
