//
//  TableViewCell3-hot.m
//  testcell
//
//  Created by 陈威利 on 16/4/21.
//  Copyright © 2016年 陈威利. All rights reserved.
//

#import "TableViewCell3-hot.h"

@interface TBDataModel2 : NSObject

@property(nonatomic, strong) NSString *image;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *price;
@property(nonatomic, strong) NSString *subImage;//某些特别标注的图片(如特价,限时等)
@end


@implementation TBDataModel2

@end

@implementation TableViewCell3_hot

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configCell];
        
    }
    return self;
}

- (void)configCell
{
    //    __weak typeof(self) ws = self;
    TBDataModel2 *d1_2 = [TBDataModel2 new];
    d1_2.image = @"p1-11";
    d1_2.title = @"热销";
    d1_2.price = @"$100";
    d1_2.subImage = @"p1-36";
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 210)];
    view.backgroundColor = [UIColor yellowColor];
    
 
    UILabel *titleLabel = [UILabel new];
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(0);
        make.left.equalTo(view.mas_left).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    titleLabel.text = @"热销榜单";
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 290)];
    self.rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    self.rootLayout.myLeftMargin = self.rootLayout.myRightMargin = 0;
    self.rootLayout.gravity = MyMarginGravity_Horz_Fill;
    self.rootLayout.backgroundColor = [UIColor colorWithWhite:0xe7/255.0 alpha:1];
    self.rootLayout.IntelligentBorderLine = [[MyBorderLineDraw alloc] initWithColor:[UIColor lightGrayColor]]; //智能边界线
    [subView addSubview:self.rootLayout];
    [view addSubview:subView];
    view.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:view];

    MyFloatLayout *layout1 = [MyFloatLayout floatLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    layout1.backgroundColor = [UIColor whiteColor];
    layout1.wrapContentHeight = YES;
    layout1.IntelligentBorderLine = [[MyBorderLineDraw alloc] initWithColor:[UIColor lightGrayColor]];
    [self.rootLayout addSubview:layout1];
    NSArray *array = @[@"1",@"2",@"2",@"2",@"3",@"2",@"3"];
    for (NSInteger i = 0; i<array.count; i++) {
        
        if ([array[i] isEqualToString:@"1"]) {
            MyBaseLayout *itemLayout = [self create1_1:d1_2 withFlagOrNot:YES];
            itemLayout.heightDime.equalTo(@(290));
            itemLayout.widthDime.equalTo(layout1.widthDime).multiply(0.4);
            [layout1 addSubview:itemLayout];
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                            initWithTarget:self
                                                            action:@selector(handlePan:)];
            [itemLayout addGestureRecognizer:tapGestureRecognizer];
        }
        else if([array[i] isEqualToString:@"2"])
        {
            MyBaseLayout *itemLayout = [self create1_1:d1_2 withFlagOrNot:YES];
            itemLayout.heightDime.equalTo(@(145));
            itemLayout.widthDime.equalTo(layout1.widthDime).multiply(0.2);
            [layout1 addSubview:itemLayout];
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                            initWithTarget:self
                                                            action:@selector(handlePan:)];
            [itemLayout addGestureRecognizer:tapGestureRecognizer];
        }
        else if([array[i] isEqualToString:@"3"])
        {
            MyBaseLayout *itemLayout = [self create1_1:d1_2 withFlagOrNot:NO ];
            itemLayout.heightDime.equalTo(@(145));
            itemLayout.widthDime.equalTo(layout1.widthDime).multiply(0.2);
            [layout1 addSubview:itemLayout];
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                            initWithTarget:self
                                                            action:@selector(handlePan:)];
            [itemLayout addGestureRecognizer:tapGestureRecognizer];
        }
    }

}

- (MyFloatLayout *)create1_1:(TBDataModel2 *)dataModel withFlagOrNot:(BOOL)flag
{
    MyFloatLayout *imageLayout = [MyFloatLayout floatLayoutWithOrientation:MyLayoutViewOrientation_Horz];
    
    UILabel *priceLabel = [UILabel new];
    _priceLabel = priceLabel;
    
    [imageLayout addSubview:_priceLabel];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"123";
    titleLabel.font = [UIFont systemFontOfSize:11];
    titleLabel.textColor = [UIColor lightGrayColor];
    titleLabel.myLeftMargin = 5;
    [titleLabel sizeToFit];
    titleLabel.reverseFloat = YES;
    [imageLayout addSubview:titleLabel];
    
    if (flag == YES) {
        UIImageView *subImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dataModel.subImage]];
        subImageView.myLeftMargin = 5;
        subImageView.myTopMargin = 5;
        subImageView.myHeight = 20;
        [subImageView sizeToFit];
        [imageLayout addSubview:subImageView];
    }
    

    
    /**
     最后添加底部背景图
     别问我为什么
     
     */
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dataModel.image]];
    imageView.weight = 1;
    imageView.widthDime.equalTo(imageLayout.widthDime);
    [imageLayout addSubview:imageView];

    
    return imageLayout;
}

- (void) handlePan:(UITapGestureRecognizer*) recognizer
{
    NSLog(@"1213");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
