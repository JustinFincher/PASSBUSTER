//
//  PasswordWapper.m
//  Passbuster
//
//  Created by Fincher Justin on 15/10/30.
//  Copyright © 2015年 Fincher Justin. All rights reserved.
//

#import "PasswordWapper.h"
#import "CocoaSecurity.h"
#import "FMDBAPI.h"
#import "FMDB.h"
#import "CocoaSecurity.h"

@implementation PasswordWapper

- (NSString *)getDecryptedPasswordFromCryptedPassword:(NSString *)Password
{
    
    FMDBAPI *FMDBinstance = [[FMDBAPI alloc] init];
    NSString * MainpasswordMD5 = [FMDBinstance getMainPasswordFromFMDB];
    
    CocoaSecurityResult *aes256Decrypt = [CocoaSecurity aesDecryptWithBase64:Password
                                                                      hexKey:MainpasswordMD5
                                                                       hexIv:MainpasswordMD5];
    
    
    return aes256Decrypt.utf8String;
}

- (NSString *)setCryptedPasswordFromDecryptedPassword:(NSString *)Password
{
    
    FMDBAPI *FMDBinstance = [[FMDBAPI alloc] init];
    NSString * MainpasswordMD5 = [FMDBinstance getMainPasswordFromFMDB];
    
    CocoaSecurityResult *aes256 = [CocoaSecurity aesEncrypt:Password
                                                     hexKey:MainpasswordMD5
                                                      hexIv:MainpasswordMD5];
    
    
    return aes256.base64;
}


@end
