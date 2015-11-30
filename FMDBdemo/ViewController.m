//
//  ViewController.m
//  FMDBdemo
//
//  Created by 康叶廷 on 15/11/27.
//  Copyright © 2015年 康叶廷. All rights reserved.
//

#import "ViewController.h"
#import "PlayTool.h"
#import "Play.h"
@interface ViewController ()
@property(nonatomic,strong)FMDatabase *db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
- (IBAction)instert:(id)sender {
    for (int i = 0; i<100; i++) {
        Play *play = [[Play alloc]init];
        play.name = [NSString stringWithFormat:@"play:%d",i];
        play.price = arc4random()%1000;
        [PlayTool addPlay:play];
    }
    NSLog(@"插入成功");

}

- (IBAction)selectBtn:(id)sender {
    //点击查询数据库结果
    NSArray *arr = [PlayTool plays];
    for (Play *play in arr) {
        NSLog(@"NAME = %@,PRICE = %f",play.name,play.price);
    }

}

//根据id是删除对应的值
- (IBAction)deleteBtn:(id)sender {
    
    [PlayTool deleteSqlite];
    NSLog(@"已经删除");
}


@end
