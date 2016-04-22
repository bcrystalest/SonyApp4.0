//
//  ViewController.m
//  testcell
//
//  Created by 陈威利 on 16/4/20.
//  Copyright © 2016年 陈威利. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "TableViewCell2-MylinerLayout.h"
#import "TableViewCell3-hot.h"
#import "define.h"
#import "HttpTool.h"
#import "homePageModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_testArray;
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)loadData
{
    _dataArray = [NSMutableArray new];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:homePageURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"%@",responseObject);
             NSArray *array = responseObject[@"data"][@"carousel"];
             NSLog(@"%ld",array.count);
             for (NSDictionary *dic in array) {
                 homePageModel *model = [[homePageModel alloc]initWithDictionary:dic error:nil];
                 [_dataArray addObject:model];
                 
             }

             
         }
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
        NSLog(@"%@",error);  //这里打印错误信息
         }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //dispatch_queue_t queue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    [self configUI];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    [self loadData];
    });
    
    
    
}

- (void)configUI
{
    _testArray = @[@"1",@"2",@"3"];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:NSClassFromString(@"TableViewCell") forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:NSClassFromString(@"TableViewCell2_MylinerLayout") forCellReuseIdentifier:@"cell2"];
    [_tableView registerClass:NSClassFromString(@"TableViewCell3_hot") forCellReuseIdentifier:@"cell3"];
    [self.view addSubview:_tableView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    static NSString *cellId2 = @"cell2";
    static NSString *cellId3 = @"cell3";
    if (indexPath.row == 0) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;
    }
    else if (indexPath.row == 1)
    {
        TableViewCell2_MylinerLayout *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
            cell = [[TableViewCell2_MylinerLayout alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId2];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;

    }
    else
    {
        TableViewCell3_hot *cell = [tableView dequeueReusableCellWithIdentifier:cellId3 forIndexPath:indexPath];
            homePageModel *model = _dataArray[indexPath.row];
            //cell.title = model.titlepic;
            cell.priceLabel.text = model.title;
        cell.priceLabel.font = [UIFont systemFontOfSize:11];
        cell.priceLabel.textColor = [UIColor redColor];
        cell.priceLabel.myLeftMargin = 5;
        cell.priceLabel.myBottomMargin = 5;
        [cell.priceLabel sizeToFit];
        cell.priceLabel.reverseFloat = YES;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 360;
    }
    else if(indexPath.row == 1)
    {
        return 360;
    }
    else
    {
        return 320;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
