//
//  WLCommonTableView.m
//  WLCommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "WLCommonTableView.h"
#import "WLCommonTableViewHeader.h"

@interface ClassTypeItem : NSObject
@property(nonatomic) Class cls;
+ (ClassTypeItem *)itemWithClass:(Class)cls;
@end

@implementation ClassTypeItem
+ (ClassTypeItem *)itemWithClass:(Class)cls{
    ClassTypeItem *item = [[ClassTypeItem alloc] init];
    item.cls = cls;
    return item;
}
@end

@interface WLCommonTableView ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSMutableDictionary *bindedSectionTypeDict;
@property(nonatomic, strong) NSMutableDictionary *bindedCellTypeDict;
@end

@implementation WLCommonTableView
- (void)dealloc
{
    self.delegate = nil;
    self.dataSource = nil;
}

- (void)initParams{
    self.bindedSectionTypeDict = [NSMutableDictionary new];
    self.bindedCellTypeDict = [NSMutableDictionary new];
    self.delegate = self;
    self.dataSource = self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initParams];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initParams];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self){
        [self initParams];
    }
    return self;
}

- (void)setValue:(Class)cls forKey:(NSUInteger)key toDictionary:(NSMutableDictionary *)dict{
    NSNumber *aKey = [NSNumber numberWithUnsignedInteger:key];
    if (cls == NULL){
        [dict removeObjectForKey:aKey];
        return;
    }
    ClassTypeItem *typeItem = [ClassTypeItem itemWithClass:cls];
    [dict setObject:typeItem forKey:aKey];
}

- (void)bindSectionType:(NSUInteger)sectionType withClass:(Class)cls{
    NSAssert((cls != NULL && [cls conformsToProtocol:@protocol(WLCommonTableSectionViewProtocol) ]), @"section view assert");
    [self setValue:cls forKey:sectionType toDictionary:self.bindedSectionTypeDict];
}

- (void)bindCellType:(NSUInteger)cellType withClass:(Class)cls{
    NSAssert((cls != NULL && [cls conformsToProtocol:@protocol(WLCommonTableCellProtocol)]), @"cell view assert");
    [self setValue:cls forKey:cellType toDictionary:self.bindedCellTypeDict];
    [self registerClass:cls forCellReuseIdentifier:[NSString stringWithFormat:@"%u", (unsigned int)cellType]];
}

- (ClassTypeItem *)classTypeForKey:(NSUInteger)key fromDictionaty:(NSDictionary *)dict{
    ClassTypeItem *typeItem = [dict objectForKey:[NSNumber numberWithUnsignedInteger:key]];
    return typeItem;
}

- (BOOL)isDataValid{
    BOOL valid = YES;
    for (WLCommonTableSectionData *sectionData in self.datas){
        if (![sectionData isKindOfClass:[WLCommonTableSectionData class]]){
            valid = NO;
            break;
        }
        for (id cellData in sectionData.cellDatas){
            if (![cellData conformsToProtocol:@protocol(WLCommonTableCellDataProtocol)]){
                valid = NO;
                break;
            }
        }
    }
    return valid;
}

- (WLCommonTableSectionData *)sectionDataInSection:(NSUInteger)section{
    if (section < [self.datas count]){
        WLCommonTableSectionData *sectionData = [self.datas objectAtIndex:section];
        return sectionData;
    }
    return nil;
}

- (id<WLCommonTableCellDataProtocol>)cellDataAtIndexPath:(NSIndexPath *)index{
    WLCommonTableSectionData *sectionData = [self sectionDataInSection:index.section];
    if (index.row < [sectionData.cellDatas count]){
        id cellData = [sectionData.cellDatas objectAtIndex:index.row];
        return cellData;
    }
    return nil;
}

#pragma mark - 重载reloadData函数
- (void)reloadData{
    NSAssert([self isDataValid], @"data is not valid");
    if ([self isDataValid]){
        [super reloadData];
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section < self.datas.count){
        WLCommonTableSectionData *data = [self.datas objectAtIndex:section];
        if ([data isKindOfClass:[WLCommonTableSectionData class]]){
            return [data.cellDatas count];
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id<WLCommonTableCellDataProtocol> cellData = [self cellDataAtIndexPath:indexPath];
    NSString* reuseId = [NSString stringWithFormat:@"%u", (unsigned int)[cellData dataType]];
    UITableViewCell<WLCommonTableCellProtocol> *cell = (UITableViewCell<WLCommonTableCellProtocol> *)[tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    [cell updateCellWithData:cellData];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.datas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id<WLCommonTableCellDataProtocol> cellData = [self cellDataAtIndexPath:indexPath];
    ClassTypeItem *typeItem = [self classTypeForKey:[cellData dataType] fromDictionaty:self.bindedCellTypeDict];
    CGFloat height = [typeItem.cls cellHeightWithData:cellData maxWidth:tableView.bounds.size.width];
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    WLCommonTableSectionData *sectionData = [self sectionDataInSection:section];
    ClassTypeItem *typeItem = [self classTypeForKey:sectionData.headerType fromDictionaty:self.bindedSectionTypeDict];
    CGFloat height = 0;
    if (typeItem){
        height = [typeItem.cls sectionHeightWithData:sectionData.headerData maxWidth:tableView.bounds.size.width];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    WLCommonTableSectionData *sectionData = [self sectionDataInSection:section];
    ClassTypeItem *typeItem = [self classTypeForKey:sectionData.footerType fromDictionaty:self.bindedSectionTypeDict];
    CGFloat height = 0;
    if (typeItem){
        height = [typeItem.cls sectionHeightWithData:sectionData.footerData maxWidth:tableView.bounds.size.width];
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WLCommonTableSectionData *sectionData = [self sectionDataInSection:section];
    ClassTypeItem *typeItem = [self classTypeForKey:sectionData.headerType fromDictionaty:self.bindedSectionTypeDict];
    UIView<WLCommonTableSectionViewProtocol> *view = nil;
    if (typeItem){
        CGRect frame = {0, 0, tableView.frame.size.width, 0};
        frame.size.height = [self tableView:self heightForHeaderInSection:section];
        view = [[typeItem.cls alloc] initWithFrame:frame];
        if (sectionData.headerData && [view respondsToSelector:@selector(updateSectionViewWithData:)]){
            [view updateSectionViewWithData:sectionData.headerData];
        }
    }
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    WLCommonTableSectionData *sectionData = [self sectionDataInSection:section];
    ClassTypeItem *typeItem = [self classTypeForKey:sectionData.footerType fromDictionaty:self.bindedSectionTypeDict];
    UIView<WLCommonTableSectionViewProtocol> *view = nil;
    if (typeItem){
        CGRect frame = {0, 0, tableView.frame.size.width, 0};
        frame.size.height = [self tableView:self heightForFooterInSection:section];
        view = [[typeItem.cls alloc] initWithFrame:frame];
        if (sectionData.footerData && [view respondsToSelector:@selector(updateSectionViewWithData:)]){
            [view updateSectionViewWithData:sectionData.footerData];
        }
    }
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.commontTableDelegate && [self.commontTableDelegate respondsToSelector:@selector(commonTableView:didSelectRowAtIndexPath:)]){
        [self.commontTableDelegate commonTableView:self didSelectRowAtIndexPath:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
