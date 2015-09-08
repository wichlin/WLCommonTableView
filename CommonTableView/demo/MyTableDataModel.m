//
//  MyTableDataModel.m
//  CommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "MyTableDataModel.h"

@implementation TableCellDataText

- (NSUInteger)dataType{
    return MyTableViewCellTypeText;
}
- (NSString *)title {
    return self.data;
}

@end

@implementation TableCellDataNumber

- (NSUInteger)dataType{
    return MyTableViewCellTypeNumber;
}

- (NSString *)title {
    return [NSString stringWithFormat:@"%@", self.data];
}

@end