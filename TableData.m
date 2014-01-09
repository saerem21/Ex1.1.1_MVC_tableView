//
//  TableData.m
//  Ex1.1.1_MVC_tableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "TableData.h"

@implementation TableData

static TableData *instance;

-(id)init{
    self = [super init];
    if (self) {
        self.data = [[NSMutableArray alloc] init];
        //self.data = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    }
    return self;
}



//추가 제거
- (void)addOneData:(id)data
{
    [self.data addObject:data];
}

- (bool)removeOneData:(int)index
{
    [self.data removeObjectAtIndex:index];
    //에러발생을 못잡는 구나...
    return YES;
}


//줄개수
- (int)rowCount
{
    return [self.data count];
}

- (id)showOneData:(int)DataId
{
    return [self.data objectAtIndex:DataId];
}

+ (TableData *)returnInstance
{
    if(nil == instance)instance = [[TableData alloc] init];
    return instance;
}

@end
