//
//  SectionHeaderView.m
//  CommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "SectionHeaderView.h"
#import "MyTableDataModel.h"

@implementation SectionHeaderView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        CGRect lineFrame = self.bounds;
        lineFrame.origin.y = lineFrame.size.height - 1;
        lineFrame.size.height = 1;
        UIView* seperator = [[UIView alloc] initWithFrame:lineFrame];
        seperator.backgroundColor = [UIColor yellowColor];
        [self addSubview:seperator];
    }
    return self;
}

+ (CGFloat)sectionHeightWithData:(id)sectionData maxWidth:(CGFloat)maxWidth{
    return 10;
}

@end
