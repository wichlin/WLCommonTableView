//
//  TableViewCellText.m
//  CommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "TableViewCellText.h"
#import "MyTableDataModel.h"

@interface TableViewCellText ()
@property(nonatomic, strong) UILabel* label;
@end

@implementation TableViewCellText

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.text = @"textksjdj";
        _label.textColor = [UIColor brownColor];
        [self.contentView addSubview:_label];
        self.contentView.backgroundColor = [UIColor redColor];
        
        CGRect lineFrame = self.bounds;
        lineFrame.origin.y = lineFrame.size.height - 1;
        lineFrame.size.height = 1;
        UIView* seperator = [[UIView alloc] initWithFrame:lineFrame];
        seperator.backgroundColor = [UIColor yellowColor];
        seperator.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self.contentView addSubview:seperator];
    }
    return self;
}

+ (CGFloat)cellHeightWithData:(id)cellData maxWidth:(CGFloat)maxWidth{
    return 80;
}
- (void)updateCellWithData:(id<TabelCellDataTextProtocol>)cellData{
    _label.text = [cellData title];
}

@end
