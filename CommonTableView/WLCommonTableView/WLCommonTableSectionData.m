//
//  WLCommonTableSectionData.m
//  WLCommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "WLCommonTableSectionData.h"

@implementation WLCommonTableSectionData
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headerType = WLCommonTableSectionTypeNone;
        self.footerType = WLCommonTableSectionTypeNone;
    }
    return self;
}
@end
