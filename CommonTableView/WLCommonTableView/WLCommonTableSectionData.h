//
//  WLCommonTableSectionBaseData.h
//  WLCommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WLCommonTableSectionType){
    WLCommonTableSectionTypeNone = NSUIntegerMax,
};

@protocol WLCommonTableSectionData
@end

@interface WLCommonTableSectionData : NSObject
@property(nonatomic) NSUInteger headerType;
@property(nonatomic, strong) id headerData;
@property(nonatomic, strong) NSArray* cellDatas;
@property(nonatomic) NSUInteger footerType;
@property(nonatomic, strong) id footerData;
@end
