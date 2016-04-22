//
//  TableViewCell3-hot.h
//  testcell
//
//  Created by 陈威利 on 16/4/21.
//  Copyright © 2016年 陈威利. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLayout.h"
#import "Masonry.h"
@interface TableViewCell3_hot : UITableViewCell
@property(nonatomic, strong) MyLinearLayout *rootLayout;
@property(nonatomic, weak) NSString *image;
//@property(nonatomic, weak) NSString *title;
//@property(nonatomic, weak) NSString *price;
@property(nonatomic, strong) UILabel *priceLabel;
@property(nonatomic, weak) NSString *subImage;//某些特别标注的图片(如特价,限时等)
@end
