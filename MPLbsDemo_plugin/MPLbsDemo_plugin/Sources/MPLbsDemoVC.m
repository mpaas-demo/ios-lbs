//
//  MPLbsDemoVC.m
//  MPLbsDemo
//
//  Created by shifei.wkp on 2018/12/18.
//  Copyright © 2018 alipay. All rights reserved.
//

#import "MPLbsDemoVC.h"
#import "MPLbsDemoDef.h"
#import "MPLbsTest.h"

@implementation MPLbsDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = AU_COLOR_CLIENT_BG1;
    self.title = @"定位";
    
    CREATE_UI({
        BUTTON_WITH_ACTION(@"开始定位", updateLocation)
        BUTTON_WITH_ACTION(@"执行用例检查", runTest)
    })
    
}

- (void)runTest {
    [MPLbsTest runAllTestCase];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AUNoticeDialog *alert = [[AUNoticeDialog alloc] initWithTitle:@"执行结果" message:@"LBS 用例执行完毕" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    });
}

- (void)updateLocation {
    [LBSLocationManager locationWithRequestBlock:^(LBSLocationRequest *request) {
        request.bizType = @"MPAAS-DEMO";
    } onFinishedLocating:^(BOOL success, CLLocation *location, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *message =[NSString stringWithFormat:@"定位成功, 经度: %.5f, 维度: %.5f, 精确度: %.3f",location.coordinate.longitude, location.coordinate.latitude, location.horizontalAccuracy];
            AUNoticeDialog *alert = [[AUNoticeDialog alloc] initWithTitle:@"定位结果" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        });
    }];
}

@end
