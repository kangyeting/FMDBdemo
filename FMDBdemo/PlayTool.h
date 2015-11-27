//
//  PlayTool.h
//  FMDBdemo
//
//  Created by 康叶廷 on 15/11/27.
//  Copyright © 2015年 康叶廷. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Play.h"
#import "FMDB.h"   
//libsqlite3或3.0

// 实际上libsqlite3.0.dylib本身是个链接，它指向libsqlite3.dylib。也就是说在项目里如果你添加libsqlite3.dylib和添加libsqlite3.0.dylib其实是添加了同一个文件，没有区别，那为什么要添加libsqlite3.dylib呢？其实这个指针总是指向最新的sqlite3动态库，比如说sqlite3库更新了，如果我们引用的是libsqlite3.0.dylib你就不需要做任何修改了。

@interface PlayTool : NSObject

+(void)addPlay:(Play *)paly;

+ (NSArray *)plays;
+ (void )deleteSqlite;
@end
