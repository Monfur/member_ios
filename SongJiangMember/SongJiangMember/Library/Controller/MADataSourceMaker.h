//
//  MADataSourceMaker.h
//  Overseas
//
//  Created by YURI_JOU on 15-4-1.
//

#import <Foundation/Foundation.h>

@interface MADataSourceMaker : NSObject

@property (nonatomic, assign)NSInteger cellsCount;
@property (nonatomic, assign)CGFloat cellHeight;
@property (nonatomic, assign)NSInteger sectionsCount;

@property (nonatomic, strong)Class cellClass;


@property (nonatomic, strong)UIView *loadingView;
@property (nonatomic, strong)UIView *finishedView;
@property (nonatomic, strong)UIView *footerView;
@property (nonatomic, strong)UIView *headerView;

@property (nonatomic, strong)NSArray *dataArray;

//custom the cell with data
@property (nonatomic, copy) void(^fillDataForCellBlock)(UITableViewCell *cell,id object);
//fetch data from server
@property (nonatomic, copy) void(^fetchDataBlock)(void);
//set height for cell
@property (nonatomic, copy) CGFloat(^heightForCellBlock)(id object);
//selected cell action
@property (nonatomic, copy) void(^cellSeletedBlock)(UITableViewCell *cell,id object);

- (instancetype)initWithTableView:(UITableView *)tableView;
- (void)makeTableReload;
- (void)startFetch;
- (void)stopFetch;

@end
