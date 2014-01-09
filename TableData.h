//
//  TableData.h
//  Ex1.1.1_MVC_tableView
//
//  Created by SDT-1 on 2014. 1. 9..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableData : NSObject
//데이터를 담을 그릇
@property  NSMutableArray *data;

//추가 제거
-(void)addOneData:(id)data;
-(bool)removeOneData:(int)index;
//줄개수
-(int)rowCount;
-(id)showOneData:(int)DataId;

+(TableData *)returnInstance;
@end
