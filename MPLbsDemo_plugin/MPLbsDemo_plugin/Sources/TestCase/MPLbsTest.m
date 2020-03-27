//
//  MPLbsTest.m
//  MPLbsDemo
//
//  Created by shifei.wkp on 2019/2/28.
//  Copyright © 2019 alipay. All rights reserved.
//

#import "MPLbsTest.h"
#import <MPBaseTest/MPBaseUtil.h>

@implementation MPLbsTest

+ (void)runAllTestCase {
    [self testLocation];
}

+ (void)testLocation {
    [LBSLocationManager locationWithRequestBlock:^(LBSLocationRequest *request) {
        request.bizType = @"MPAAS-DEMO";
    } onFinishedLocating:^(BOOL success, CLLocation *location, NSError *error) {
        assert(success == YES);
        MPAdapterLog(@"MPAdapter", @"LBS", @"%@", @"定位监测通过");
    }];
}

@end
