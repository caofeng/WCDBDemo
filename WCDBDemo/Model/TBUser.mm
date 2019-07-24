//
//  TBUser.m
//  WCDBDemo
//
//  Created by Topband on 2019/7/21.
//  Copyright © 2019 深圳拓邦股份有限公司. All rights reserved.
//

#import "TBUser.h"
#import <WCDB/WCDB.h>

@implementation TBUser

WCDB_IMPLEMENTATION(TBUser)
WCDB_SYNTHESIZE(TBUser, userId)
WCDB_SYNTHESIZE(TBUser, age)
WCDB_SYNTHESIZE(TBUser, name)
WCDB_SYNTHESIZE(TBUser, height)
WCDB_SYNTHESIZE(TBUser, borthdayDate)

//...

@end
