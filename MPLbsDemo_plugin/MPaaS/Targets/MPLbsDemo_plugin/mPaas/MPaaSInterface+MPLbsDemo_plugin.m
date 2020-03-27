//
//  MPaaSInterface+MPLbsDemo_plugin.m
//  MPLbsDemo_plugin
//
//  Created by shifei.wkp on 2020/03/26.
//  Copyright © 2020 Alibaba. All rights reserved.
//

#import "MPaaSInterface+MPLbsDemo_plugin.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation MPaaSInterface (MPLbsDemo_plugin)

- (BOOL)enableSettingService
{
    return NO;
}

- (NSString *)userId
{
    return nil;
}

@end

#pragma clang diagnostic pop
