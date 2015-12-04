//
//  TableViewCellText2.m
//  CommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "TableViewCellText2.h"
#import "MyTableDataModel.h"

@interface TableViewCellText2 ()
@property(nonatomic, strong) UILabel* label;
@end


@implementation TableViewCellText2
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.text = @"textksjdj";
        _label.textColor = [UIColor redColor];
        [self.contentView addSubview:_label];
        self.contentView.backgroundColor = [UIColor greenColor];
    }
    return self;
}

+ (CGFloat)cellHeightWithData:(id)cellData maxWidth:(CGFloat)maxWidth{
    return 50;
}
- (void)updateCellWithData:(id<TableCellDataNumberProtocol>)cellData{
    _label.text = [cellData title];
}

@end
