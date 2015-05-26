//
//  MADataSourceMaker.m
//  Overseas
//
//  Created by YURI_JOU on 15-4-1.
//

#import "MADataSourceMaker.h"

@interface MADataSourceMaker()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIRefreshControl *refreshControl;

@end

@implementation MADataSourceMaker

- (instancetype)initWithTableView:(UITableView *)tableView{
  self = [super init];
  if (self) {
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView addSubview:self.refreshControl];
    [self.refreshControl.superview sendSubviewToBack:self.refreshControl];
    self.tableView = tableView;
  }
  return self;
}

- (UIRefreshControl *)refreshControl{
  if (!_refreshControl) {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor = [MAColorManager sharedManager].defaultForeColor;
    refreshControl.backgroundColor = [MAColorManager sharedManager].defaultBackgroundColor;
    [_refreshControl addTarget:self
                        action:@selector(fetchIntialData)
                  forControlEvents:UIControlEventValueChanged];
    _refreshControl = refreshControl;
  }
  return _refreshControl;
}

- (void)fetchIntialData{
  if (self.fetchDataBlock) {
    self.fetchDataBlock();
  }
}

- (void) ma_setupRefreshControl{
  self.refreshControl = [[UIRefreshControl alloc]init];
  
}

- (void) ma_reloadData{
  [self.tableView reloadData];
  if (self.refreshControl) {
    NSString *dataTime = [[NSDate date] stringWithDateFormatString:@"MMM d,a h:mm "];
    NSString *refreshTip = [NSString stringWithFormat:@"最近更新 %@",dataTime];
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName:[MAColorManager sharedManager].defaultForeColor,
                                 };
    NSAttributedString *attributeString = [[NSAttributedString alloc]initWithString:refreshTip
                                                                         attributes:attributes];
    self.refreshControl.attributedTitle = attributeString;
    [self.refreshControl endRefreshing];
  }
}

- (void)setLoadingView:(UIView *)loadingView{
  self.tableView.tableFooterView = loadingView;
}

- (void)setFinishedView:(UIView *)finishedView{
  self.tableView.tableFooterView = finishedView;
}

- (void)setHeaderView:(UIView *)headerView{
  self.tableView.tableHeaderView = headerView;
}

- (void)setFooterView:(UIView *)footerView{
  self.tableView.tableFooterView = footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  if(!self.sectionsCount) return 1;
  return self.sectionsCount;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
  return [[UIView alloc]init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  return [[UIView alloc]init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSString *identifier = NSStringFromClass(self.cellClass);
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if (!cell) {
    cell = [[self.cellClass alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
  }
  if (self.fillDataForCellBlock) {
    self.fillDataForCellBlock(cell,self.dataArray[indexPath.row]);
  }
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  id object = self.dataArray[indexPath.row];
  if (!self.heightForCellBlock) {
    return self.cellHeight?self.cellHeight:20.0f;
  }
  return self.heightForCellBlock(object);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  id object = self.dataArray[indexPath.row];
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  if (self.cellSeletedBlock) {
    self.cellSeletedBlock(cell,object);
  }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
  if (self.fetchDataBlock) {
    [self.refreshControl beginRefreshing];
    self.fetchDataBlock();
  }
}

- (void)makeTableReload{
  [self ma_reloadData];
}

- (void)startFetch{
  [self.refreshControl beginRefreshing];
  self.fetchDataBlock();
}

- (void)stopFetch{
  [self.refreshControl endRefreshing];
}

@end
