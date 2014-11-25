//
//  LoginResultParser.h
//  UnitTestDemo
//
//  Created by VooleDev6 on 14/11/24.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LoginResult;

@interface LoginResultParser : NSObject

-(LoginResult*)parse:(NSData*)data;

@end
