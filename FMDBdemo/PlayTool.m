//
//  PlayTool.m
//  FMDBdemo
//
//  Created by 康叶廷 on 15/11/27.
//  Copyright © 2015年 康叶廷. All rights reserved.
//

#import "PlayTool.h"

@implementation PlayTool
static FMDatabase *_db;

//创建sqlite数据库文件 命名为yt
+(void)initialize{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingString:@"yt.sqlite"];
    _db = [FMDatabase databaseWithPath:filePath];
    
    [_db open];//记得打开数据库!
    
    //创建表格
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS yt_play (id integer PRIMARY KEY,name text NOT NULL,price real)"];
}

//插入play的值
+(void)addPlay:(Play *)play{
    [_db executeUpdateWithFormat:@"INSERT INTO yt_play(name,price) VALUES (%@,%f);",play.name,play.price];
    
}

//根据id是删除对应的值
+ (void)deleteSqlite{
  
    [_db executeUpdate:@"DELETE FROM yt_play WHERE id < 70 "];

    
}




//查询结果给 dateArr;
+ (NSArray *)plays{
    
    FMResultSet *set = [_db executeQuery:@"SELECT *FROM yt_play;"];//查询命令
    NSMutableArray *dateArr = [NSMutableArray array];
    while (set.next) {
        Play *play = [[Play alloc]init];
        play.name = [set stringForColumn:@"name"];
        play.price = [set doubleForColumn:@"price"];
        [dateArr addObject:play];
    }
    return dateArr;
}


@end
