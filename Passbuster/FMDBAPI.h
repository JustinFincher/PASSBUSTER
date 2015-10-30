//
//  FMDBAPI.h
//  Passbuster
//
//  Created by Fincher Justin on 15/10/29.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBAPI : NSObject

@property (nonatomic, retain) NSString * dbPath;

- (void)LaunchCheck;
- (BOOL)InsertAccountSessionWithUsername:(NSString *)Username
                           WithPassword:(NSString *)Password;
- (BOOL)ChangeAccountSessionWithMainPassword:(NSString *)MainPassword;
- (BOOL)ChangeAppSettingsWithIsFirstOpen:(NSNumber *)isFirstOpen;

@end
