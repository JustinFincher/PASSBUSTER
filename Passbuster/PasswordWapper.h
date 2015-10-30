//
//  PasswordWapper.h
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordWapper : NSObject
- (NSString *)getDecryptedPasswordFromCryptedPassword:(NSString *)Password;
- (NSString *)setCryptedPasswordFromDecryptedPassword:(NSString *)Password;

- (NSString *)getDecryptedPasswordFromCryptedPassword:(NSString *)Password
                                    WithNewMD5MainPWD:(NSString *)NewMainPWD;
- (NSString *)setCryptedPasswordFromDecryptedPassword:(NSString *)Password
                                    WithNewMD5MainPWD:(NSString *)NewMainPWD;
@end
