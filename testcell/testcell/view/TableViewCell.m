//
//  TableViewCell.m
//  testcell
//
//  Created by 陈威利 on 16/4/20.
//  Copyright © 2016年 陈威利. All rights reserved.
//
#import "TableViewCell.h"
#import "Masonry.h"
#import "CZCountDownView.h"
#import "CollectionViewCell.h"
#import "SDCycleScrollView.h"
@interface TableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation TableViewCell




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configCell];
        
    }
    return self;
}

- (void)configCell
{
    __weak typeof(self) ws = self;
    UIView *mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 360)];
    
    [self.contentView addSubview:mainView];
    mainView.backgroundColor = [UIColor grayColor];
    
    UILabel *titleLabel = [UILabel new];
    [self.contentView addSubview:titleLabel];
    titleLabel.text = @"限时抢购";
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.contentView).offset(0);
        make.left.equalTo(ws.contentView).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);

    }];
    
    CZCountDownView *countDown = [CZCountDownView shareCountDown];
    [mainView addSubview:countDown];
    countDown.timestamp = 1461348066;
    countDown.timerStopBlock = ^{
        NSLog(@"时间停止");
    };
    [countDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.contentView).offset(0);
        make.right.equalTo(ws.contentView).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing=10;
    flowLayout.minimumInteritemSpacing=10;
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;

    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 180) collectionViewLayout:flowLayout];
    [mainView addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collectionViewCell"];
//    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(countDown.mas_bottom).offset(0);
//        make.left.equalTo(ws.contentView).offset(0);
//        make.right.equalTo(ws.contentView).offset(0);
//        make.height.mas_equalTo(180);
//    }];
    collectionView.backgroundColor = [UIColor redColor];
    
//    UIImageView *imageView = [UIImageView new];
//    [mainView addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(ws.contentView).offset(0);
//        make.left.equalTo(ws.contentView).offset(0);
//        make.right.equalTo(ws.contentView).offset(0);
//        make.height.mas_equalTo(150);
//    }];
//    imageView.backgroundColor = [UIColor blueColor];
    NSArray *array = @[@"bk1",@"bk2",@"bk1"];
   // NSArray *onePic = @[@"bk1"];
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView new];
    [mainView addSubview:cycleScrollView];
    cycleScrollView.autoScrollTimeInterval = 5;
    [cycleScrollView setLocalizationImageNamesGroup:array];
    cycleScrollView.placeholderImage = [UIImage imageNamed:@"bk2"];
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.contentView).offset(0);
        make.left.equalTo(ws.contentView).offset(0);
        make.right.equalTo(ws.contentView).offset(0);
        make.height.mas_equalTo(150);
    }];
}

#pragma mark collectionView的代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(70, 80);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0,0,0,0);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    {
        
        static NSString *cellId=@"collectionViewCell";
        
        CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        cell.titleLabel.text = @"1213";
        cell.priceLabel.text = @"rmb";
        
        return cell;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
