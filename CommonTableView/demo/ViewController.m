//
//  ViewController.m
//  CommonTableView
//
//  Created by wichlin on 15/7/3.
//  Copyright (c) 2015年 wichlin. All rights reserved.
//

#import "ViewController.h"
#import "WLCommonTableViewHeader.h"
#import "MyTableDataModel.h"
#import "TableViewCellText.h"
#import "TableViewCellText2.h"
#import "SectionHeaderView.h"
#import "SectionheaderView2.h"

@interface ViewController ()
@property(nonatomic, strong) WLCommonTableView* tableView;
@end

@implementation ViewController

- (void)initTableView{
    self.tableView = [[WLCommonTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    [self.tableView bindCellType:MyTableViewCellTypeText withClass:[TableViewCellText class]];
    [self.tableView bindCellType:MyTableViewCellTypeNumber withClass:[TableViewCellText2 class]];
    [self.tableView bindSectionType:MyTableSectionTypeHeader1 withClass:[SectionHeaderView class]];
    [self.tableView bindSectionType:MyTableSectionTypeHeader2 withClass:[SectionheaderView2 class]];
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
    
    
    self.tableView.datas = (NSArray<WLCommonTableSectionData> *)dataSource;
    [self.tableView reloadData];
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
