//
//  WLCommonTableCellProtocol.h
//  WLCommonTableView
//
//  Created by wichlin on 15/7/13.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@protocol WLCommonTableCellProtocol <NSObject>

@required
+ (CGFloat)cellHeightWithData:(id)cellData maxWidth:(CGFloat)maxWidth;

@optional
- (void)updateCellWithData:(id)cellData;

@end
