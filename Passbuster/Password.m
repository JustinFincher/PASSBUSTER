//
//  Password.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "Password.h"

@implementation Password

@synthesize Company,PasswordString,Username,Index;

- (instancetype)init
{
    self = [super init];
    Company = [[NSString alloc] init];
    PasswordString = [[NSString alloc] init];
    Username = [[NSString alloc] init];
    Index = [[NSString alloc] init];
    return self;
}


@end
