//
//  TableViewCell2-MylinerLayout.m
//  testcell
//
//  Created by 陈威利 on 16/4/21.
//  Copyright © 2016年 陈威利. All rights reserved.
//

#import "TableViewCell2-MylinerLayout.h"
#import "Masonry.h"

@interface TBDataModel : NSObject

@property(nonatomic, strong) NSString *image;

@end

@implementation TBDataModel

@end

@implementation TableViewCell2_MylinerLayout

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
    
    TBDataModel *d1_1 = [TBDataModel new];
    d1_1.image = @"p1-11";

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 320)];
    
    UILabel *titleLabel = [UILabel new];
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(0);
        make.left.equalTo(view.mas_left).offset(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    titleLabel.text = @"索尼会员";
    
    
    
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
    NSArray *array = @[@"1",@"2",@"2",@"2",@"2",@"1"];
    for (NSInteger i = 0; i<array.count; i++) {
        
        if ([array[i] isEqualToString:@"1"]) {
            MyBaseLayout *itemLayout = [self create1_1:d1_1];
            itemLayout.heightDime.equalTo(@(80));
            itemLayout.widthDime.equalTo(layout1.widthDime).multiply(1);
            [layout1 addSubview:itemLayout];
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                            initWithTarget:self
                                                            action:@selector(handlePan:)];
            [itemLayout addGestureRecognizer:tapGestureRecognizer];
        }
        else if([array[i] isEqualToString:@"2"])
        {
            MyBaseLayout *itemLayout = [self create1_1:d1_1];
            itemLayout.heightDime.equalTo(@(80));
            itemLayout.widthDime.equalTo(layout1.widthDime).multiply(0.5);
            [layout1 addSubview:itemLayout];
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                            initWithTarget:self
                                                            action:@selector(handlePan:)];
            [itemLayout addGestureRecognizer:tapGestureRecognizer];
        }
        
    }
    
}

- (MyFloatLayout *)create1_1:(TBDataModel *)dataModel
{
    MyFloatLayout *imageLayout = [MyFloatLayout floatLayoutWithOrientation:MyLayoutViewOrientation_Horz];
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
