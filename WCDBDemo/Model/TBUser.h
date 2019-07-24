//
//  TBUser.h
//  WCDBDemo
//
//  Created by Topband on 2019/7/21.
//  Copyright © 2019 深圳拓邦股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBUser : NSObject

@property (nonatomic, assign)int        userId;
@property (nonatomic, copy) NSString    *name;
@property (nonatomic, assign)NSInteger  age;
@property (nonatomic, assign)CGFloat    height;
@property (nonatomic, strong)NSDate     *borthdayDate;

@end

NS_ASSUME_NONNULL_END
