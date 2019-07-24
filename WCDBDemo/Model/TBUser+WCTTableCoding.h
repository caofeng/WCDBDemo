//
//  TBUser+WCTTableCoding.h
//  WCDBDemo
//
//  Created by Topband on 2019/7/21.
//  Copyright © 2019 深圳拓邦股份有限公司. All rights reserved.
//

#import "TBUser.h"
#import <WCDB/WCDB.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBUser (WCTTableCoding)<WCTTableCoding>

//WCDB_PROPERTY用于在头文件中声明绑定到数据库表的字段,写在分类里,不写在.h里面,这样view和controller不会 引入导入<WCDB/WCDB.h>的文件

WCDB_PROPERTY(userId)
WCDB_PROPERTY(age)
WCDB_PROPERTY(name)
WCDB_PROPERTY(height)
WCDB_PROPERTY(borthdayDate)

@end

NS_ASSUME_NONNULL_END
