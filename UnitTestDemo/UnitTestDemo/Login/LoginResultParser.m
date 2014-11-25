//
//  LoginResultParser.m
//  UnitTestDemo
//
//  Created by VooleDev6 on 14/11/24.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import "LoginResultParser.h"
#import "LoginResult.h"

@implementation LoginResultParser

-(LoginResult*)parse:(NSData*)data{
    LoginResult*lr=[[LoginResult alloc]init];
    lr.resultCode=LoginResultCodeSuccess;
    sleep(1);
    return lr;
}

@end
