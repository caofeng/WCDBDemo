//
//  ViewController.m
//  WCDBDemo
//
//  Created by Topband on 2019/7/21.
//  Copyright © 2019 深圳拓邦股份有限公司. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TBDB.h"
#import "TBUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titleArr = @[@"增",@"删",@"改",@"查",@"查所有"];
    
    for (int i = 0; i < titleArr.count; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(50);
            make.top.mas_equalTo(100+70*i);
        }];
    }
}

- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        case 100:
        {
            NSLog(@"增");
            for (int i = 0; i < 10000; ++i) {
                TBUser *user = [[TBUser alloc]init];
                user.userId = i;
                user.name = @"张三";
                user.height = 180;
                user.age = 100;
                user.borthdayDate = [NSDate date];
                [[TBDB share]insertObj:user];
            }
            NSLog(@"==总数据量:=%lu",(unsigned long)[[TBDB share]fetchAllUser].count);
        }
            break;
        case 101:
        {
            NSLog(@"删");
            [[TBDB share]deleteUser];
            NSLog(@"==总数据量:=%lu",(unsigned long)[[TBDB share]fetchAllUser].count);
        }
            break;
        case 102:
        {
            NSLog(@"改");
            
            TBUser *user = [[TBUser alloc]init];
            user.userId = 10;
            user.name = @"李四";
            user.height = 170;
            user.age = 50;
            [[TBDB share]updateUser:user];
            
            
        }
            break;
        case 103:
        {
            NSLog(@"查");
            TBUser *user = [[TBDB share]fetchOneUser];
            NSLog(@"===%d",user.userId);
            NSLog(@"===%@",user.name);
            NSLog(@"===%f",user.height);
            NSLog(@"===%ld",(long)user.age);
            NSLog(@"===%@",user.borthdayDate);

        }
            break;
        case 104:
        {
            NSArray *arr = [[TBDB share]fetchAllUser];
            for (TBUser *user in arr) {
                NSLog(@"===%d===%@===%f===%ld",user.userId,user.name,user.height,(long)user.age);
            }
        }
            break;
            
        default:
            break;
    }
}


@end
