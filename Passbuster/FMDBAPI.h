//
//  FMDBAPI.h
//  Passbuster
//
//  Created by Fincher Justin on 15/10/29.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "PasswordClass.h"

@interface FMDBAPI : NSObject

@property (nonatomic, retain) NSString * dbPath;

- (void)LaunchCheck;
- (BOOL)InsertAccountSessionWithUsername:(NSString *)Username
                            WithPassword:(NSString *)Password
                             WithCompany:(NSString *)Company;
- (BOOL)ChangeAccountSessionWithMainPassword:(NSString *)MainPassword;
- (BOOL)ChangeAppSettingsWithIsFirstOpen:(NSNumber *)isFirstOpen;
- (NSString *)getMainPasswordFromFMDB;

- (BOOL)RemoveAccountSessionWithIndex:(NSNumber *)Index;

- (BOOL)SelfDestroy;
-(BOOL)DatabaseMigratedWithNewPassword:(NSString *)NewPWD;
@end
