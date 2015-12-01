//
//  ViewControllerInStoryboard.m
//  CommonTableView
//
//  Created by wichlin on 15/11/25.
//  Copyright © 2015年 wichlin. All rights reserved.
//

#import "ViewControllerInStoryboard.h"
#import "WLCommonTableViewHeader.h"
#import "MyTableDataModel.h"
#import "TableViewCellText.h"
#import "TableViewCellInStoryborad.h"

@interface ViewControllerInStoryboard ()

@end

@implementation ViewControllerInStoryboard


- (void)initTableView{
    WLCommonTableView* commonTableView = (WLCommonTableView *)self.tableView;
    [commonTableView bindCellType:MyTableViewCellTypeText withClass:[TableViewCellInStoryborad class] forCellReuseIdentifierInStoryboard:@"CellInStoryboard"];
    [commonTableView bindCellType:MyTableViewCellTypeNumber withClass:[TableViewCellInStoryborad class] forCellReuseIdentifierInStoryboard:@"CellInStoryboard"];
}

- (void)handleData{
    NSMutableArray *dataSource = [NSMutableArray new];
    TableCellDataText *cellData1 = [[TableCellDataText alloc] init];
    cellData1.data = @"TableCellDataText";
    
    TableCellDataNumber *cellData2 = [[TableCellDataNumber alloc] init];
    cellData2.data = @2;
    
    WLCommonTableSectionData *sectionData = [[WLCommonTableSectionData alloc] init];
    sectionData.headerType = MyTableSectionTypeHeader2;
    sectionData.cellDatas = @[ cellData1, cellData2 ];
    sectionData.footerType = MyTableSectionTypeHeader1;
    [dataSource addObject:sectionData];
    
    WLCommonTableSectionData *sectionData2 = [[WLCommonTableSectionData alloc] init];
    sectionData2.headerType = MyTableSectionTypeHeader1;
    sectionData2.cellDatas = @[ cellData1, cellData2 ];
    sectionData2.footerType = MyTableSectionTypeHeader2;
    [dataSource addObject:sectionData2];
    
    [dataSource addObject:sectionData];
    [dataSource addObject:sectionData2];
    
    WLCommonTableView* commonTableView = (WLCommonTableView *)self.tableView;
    commonTableView.datas = (NSArray<WLCommonTableSectionData> *)dataSource;
    [commonTableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self handleData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
