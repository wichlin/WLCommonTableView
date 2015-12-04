//
//  MyTableDataModel.h
//  CommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "WLCommonTableViewHeader.h"

typedef NS_ENUM(NSUInteger, MyTableViewCellType) {
    MyTableViewCellTypeText,
    MyTableViewCellTypeNumber,
};

typedef NS_ENUM(NSUInteger, MyTableSectionType) {
    MyTableSectionTypeHeader1,
    MyTableSectionTypeHeader2,
};

typedef NS_ENUM(NSUInteger, MyTableCellEventType) {
    MyTableCellEventButtonClick,
};

@protocol TableCellDataTextProtocol <NSObject>
- (NSString *)title;
@end

@interface TableCellDataText : NSObject <WLCommonTableCellDataProtocol, TableCellDataTextProtocol>
@property(nonatomic, strong) NSString* data;
@end


@protocol TableCellDataNumberProtocol <NSObject>
- (NSString *)title;
@end

@interface TableCellDataNumber : NSObject <WLCommonTableCellDataProtocol, TableCellDataNumberProtocol>
@property(nonatomic, strong) NSNumber* data;
@end

