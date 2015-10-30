//
//  PasswordClass.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "PasswordClass.h"

@implementation PasswordClass

@synthesize PasswordArray;

- (instancetype)init
{
    self = [super init];
    PasswordArray = [[NSMutableArray alloc] init];
    return self;
}


@end

