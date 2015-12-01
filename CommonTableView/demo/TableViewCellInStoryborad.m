//
//  TableViewCellInStoryborad.m
//  CommonTableView
//
//  Created by wichlin on 15/11/25.
//  Copyright © 2015年 wichlin. All rights reserved.
//

#import "TableViewCellInStoryborad.h"
#import "MyTableDataModel.h"

@interface TableViewCellInStoryborad ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation TableViewCellInStoryborad

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeightWithData:(id)cellData maxWidth:(CGFloat)maxWidth{
    return 100;
}

- (void)updateCellWithData:(id<TabelCellDataNumberProtocol>)cellData{
    self.label.text = [cellData title];
}

@end
