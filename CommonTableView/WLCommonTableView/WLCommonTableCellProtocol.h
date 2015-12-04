//
//  WLCommonTableCellProtocol.h
//  WLCommonTableView
//
//  Created by wichlin on 15/7/13.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@protocol WLCommonTableCellEventDelegate;

@protocol WLCommonTableCellProtocol <NSObject>

@required
+ (CGFloat)cellHeightWithData:(id)cellData maxWidth:(CGFloat)maxWidth;

@optional
- (void)updateCellWithData:(id)cellData;
- (void)setEventDelegate:(id<WLCommonTableCellEventDelegate>)delegate;

@end


@protocol WLCommonTableCellEventDelegate <NSObject>

@optional
- (void)tableViewCell:(UITableViewCell *)cell triggerEvent:(NSUInteger)eventId cellData:(id)cellData;

@end
