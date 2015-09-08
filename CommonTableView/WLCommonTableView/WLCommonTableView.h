//
//  WLCommonTableView.h
//  WLCommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLCommonTableSectionData.h"

@class WLCommonTableView;
@protocol WLCommonTableViewDelegate <NSObject>
@optional
- (void)commonTableView:(WLCommonTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface WLCommonTableView : UITableView
@property(nonatomic, weak) id<WLCommonTableViewDelegate> commontTableDelegate;
@property(nonatomic, strong) NSArray<WLCommonTableSectionData> *datas;
- (void)bindSectionType:(NSUInteger)sectionType withClass:(Class)cls;
- (void)bindCellType:(NSUInteger)cellType withClass:(Class)cls;
@end
