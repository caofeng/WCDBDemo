//
//  TBDB.m
//  WCDBDemo
//
//  Created by Topband on 2019/7/21.
//  Copyright © 2019 深圳拓邦股份有限公司. All rights reserved.
//

#define kDatabaseName @"tbdb.db"
#define kTableName_1 @"user"


#import "TBDB.h"
#import <WCDB/WCDB.h>
//...
#import "TBUser+WCTTableCoding.h"

@interface TBDB ()

@property (nonatomic, strong)WCTDatabase    *database;

@end

@implementation TBDB

static TBDB *manager = nil;
+ (instancetype)share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [TBDB new];
    });
    return manager;
}

- (BOOL)createDatabaseAndTable {
    
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:kDatabaseName];
    // 这个方法可以多次调用 if not exist
    WCTDatabase *db = [[WCTDatabase alloc]initWithPath:path];
    if ([db canOpen]) {
        self.database = db;
        NSLog(@"创建数据库成功");
        // 这个方法可以多次调用 if not exist
        BOOL result = [db createTableAndIndexesOfName:kTableName_1 withClass:TBUser.class];
        if (result) {
            NSLog(@"创建%@表成功",kTableName_1);
            return YES;
        }
        NSLog(@"创建%@表失败",kTableName_1);
        return NO;
    }
    NSLog(@"创建数据库失败");
    return NO;
}

- (BOOL)insertObj:(TBUser *)user {
    BOOL result = [self.database insertObject:user into:kTableName_1];
    if (result) {
        NSLog(@"插入数据成功");
    } else {
        NSLog(@"插入数据失败");
    }
    return NO;
}

- (BOOL)insertMoreObj:(NSArray *)arr {
    return [self.database insertObjects:arr into:kTableName_1];
}

- (BOOL)updateUser:(TBUser *)user {
    
   return [self.database updateRowsInTable:kTableName_1 onProperty:TBUser.name withObject:user where:TBUser.userId == 10];
}

- (NSArray *)fetchAllUser {
    return [self.database getAllObjectsOfClass:TBUser.class fromTable:kTableName_1];
}

- (NSArray *)fetchUserLimit:(NSInteger)count {
    return [self.database getObjectsOfClass:TBUser.class fromTable:kTableName_1 limit:count];
}

- (TBUser *)fetchOneUser {
    
   return [self.database getOneObjectOfClass:TBUser.class fromTable:kTableName_1 where:TBUser.userId == 10];
}

- (BOOL)deleteUser {
    
    return [self.database deleteObjectsFromTable:kTableName_1 where:TBUser.userId == 100];
}

- (BOOL)deleteAllUser {
    return [self.database deleteAllObjectsFromTable:kTableName_1];
}

- (BOOL)deleteTable {
    WCTDelete *deletion = [self.database prepareDeleteFromTable:kTableName_1];
    BOOL result = [deletion execute];
    
    return result;
}

@end
