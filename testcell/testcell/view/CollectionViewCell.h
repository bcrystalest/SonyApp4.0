//
//  CollectionViewCell.h
//  testcell
//
//  Created by 陈威利 on 16/4/20.
//  Copyright © 2016年 陈威利. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *collectionImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end
