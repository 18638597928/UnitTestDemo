//
//  LoginUnitTest.m
//  LoginUnitTest
//
//  Created by VooleDev6 on 14/11/24.
//  Copyright (c) 2014年 voole. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "LoginResult.h"
#import "LoginManager.h"
#import "LoginResultParser.h"

@interface LoginUnitTest : XCTestCase<NSURLSessionDataDelegate>

//@property(nonatomic,strong)XCTestExpectation* loginExpectation;

@end



@implementation LoginUnitTest

//@synthesize loginExpectation;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testLoginFuction{
    
    NSString*username=@"username";
    NSString*password=@"123456";
    
    NSString*urlString=[LoginManager loginRequsetUrlString:username password:password];
    NSURLSessionConfiguration*config=[NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession*session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    XCTestExpectation*expectation =[self expectationWithDescription:@"loginExpectation"];

    NSURLSessionDataTask*task=[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        XCTAssertNotNil(data);
        LoginResultParser*parser=[[LoginResultParser alloc]init];
        LoginResult*result=[parser parse:data];
        XCTAssertEqual(result.resultCode, LoginResultCodeSuccess);
        [expectation fulfill];
        
    }];
    [task resume];
    
  
    
    
}

-(void)testPerformanceLogin{
   
       
    NSString*username=@"username";
    NSString*password=@"123456";
        
    [self measureMetrics:@[XCTPerformanceMetric_WallClockTime] automaticallyStartMeasuring:NO forBlock:^(){
        
        NSString*urlString=[LoginManager loginRequsetUrlString:username password:password];
        NSData*data=[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        [self startMeasuring];
        LoginResultParser*parser=[[LoginResultParser alloc]init];
        LoginResult*result=[parser parse:data];
        XCTAssertEqual(result.resultCode, LoginResultCodeSuccess);
        [self stopMeasuring];
    }];
    
    
}

-(void)testEasyPerformanceLogin{
    [self measureBlock:^{
        [self testLoginFuction];
    }];
}

@end
