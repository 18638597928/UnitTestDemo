//
//  LoginResult.h
//  UnitTestDemo
//
//  Created by VooleDev6 on 14/11/24.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    LoginResultCodeSuccess=0,
    LoginResultCodeIncorrectPassword=1,
    LoginResultCodeUnknownUserName=2
    
} LoginResultCode;

@interface LoginResult : NSObject{
}

@property(nonatomic)LoginResultCode resultCode;

@end
