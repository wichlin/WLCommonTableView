//
//  WLCommonTableSectionViewProtocol.h
//  WLCommonTableView
//
//  Created by wichlin on 15/7/13.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol WLCommonTableSectionViewProtocol <NSObject>

@required
+ (CGFloat)sectionHeightWithData:(id)sectionData maxWidth:(CGFloat)maxWidth;

@optional
- (void)updateSectionViewWithData:(id)cellData;

@end
