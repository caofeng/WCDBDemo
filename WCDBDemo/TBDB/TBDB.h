//
//  TBDB.h
//  WCDBDemo
//
//  Created by Topband on 2019/7/21.
//  Copyright © 2019 深圳拓邦股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBDB : NSObject

+ (instancetype)share;

- (BOOL)createDatabaseAndTable;

/// 插入一条
- (BOOL)insertObj:(TBUser *)user;

- (BOOL)insertMoreObj:(NSArray *)arr;

/// 查询所有
- (NSArray *)fetchAllUser;
/// 查询前几位
- (NSArray *)fetchUserLimit:(NSInteger)count;
/// 查询某一个
- (TBUser *)fetchOneUser;

/// 修改数据
- (BOOL)updateUser:(TBUser *)user;

/// 删除一条数据
- (BOOL)deleteUser;

/// 删除所有用户
- (BOOL)deleteAllUser;

/// 删除一张表
- (BOOL)deleteTable;

@end

NS_ASSUME_NONNULL_END
