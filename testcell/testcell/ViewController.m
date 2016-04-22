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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_testArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _testArray = @[@"1",@"2",@"3"];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:NSClassFromString(@"TableViewCell") forCellReuseIdentifier:@"cell"];
    [tableView registerClass:NSClassFromString(@"TableViewCell2_MylinerLayout") forCellReuseIdentifier:@"cell2"];
    [tableView registerClass:NSClassFromString(@"TableViewCell3_hot") forCellReuseIdentifier:@"cell3"];
    [self.view addSubview:tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    static NSString *cellId2 = @"cell2";
    static NSString *cellId3 = @"cell3";
    if (indexPath.row == 0) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
        if (cell == nil)
        {

         cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        }
        
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;
    }
    else if (indexPath.row == 1)
    {
        TableViewCell2_MylinerLayout *cell = [tableView dequeueReusableCellWithIdentifier:cellId2 forIndexPath:indexPath];
        if (cell == nil)
        {
            
            cell = [[TableViewCell2_MylinerLayout alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId2];
        }

        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;

    }
    else
    {
        TableViewCell3_hot *cell = [tableView dequeueReusableCellWithIdentifier:cellId3 forIndexPath:indexPath];
        if (cell == nil)
        {
            
            cell = [[TableViewCell3_hot alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId3];
        }
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;
    }
}

- (void)loadData
{

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
