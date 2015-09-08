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

@protocol TabelCellDataTextProtocol <NSObject>
- (NSString *)title;
@end

@interface TableCellDataText : NSObject <WLCommonTableCellDataProtocol, TabelCellDataTextProtocol>
@property(nonatomic, strong) NSString* data;
@end


@protocol TabelCellDataNumberProtocol <NSObject>
- (NSString *)title;
@end

@interface TableCellDataNumber : NSObject <WLCommonTableCellDataProtocol, TabelCellDataNumberProtocol>
@property(nonatomic, strong) NSNumber* data;
@end

