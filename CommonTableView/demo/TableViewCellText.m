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
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, weak) id<WLCommonTableCellEventDelegate> delegate;
@property(nonatomic, weak) id<TableCellDataTextProtocol> cellData;
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
        
        CGSize size = {100, 30};
        _button = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - size.width - 20, 5, size.width, size.height)];
        _button.backgroundColor = [UIColor brownColor];
        _button.layer.cornerRadius = 8;
        _button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [_button setTitle:@"click event" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_button];
        
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

- (void)btnClicked:(id)sender {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(tableViewCell:triggerEvent:cellData:)]) {
        [self.delegate tableViewCell:self triggerEvent:MyTableCellEventButtonClick cellData:self.cellData];
    }
}


#pragma mark - cell protocol

+ (CGFloat)cellHeightWithData:(id)cellData maxWidth:(CGFloat)maxWidth{
    return 80;
}
- (void)updateCellWithData:(id<TableCellDataTextProtocol>)cellData{
    _label.text = [cellData title];
    self.cellData = cellData;
}

- (void)setEventDelegate:(id<WLCommonTableCellEventDelegate>)delegate {
    self.delegate = delegate;
}

@end
