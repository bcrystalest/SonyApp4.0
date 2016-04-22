//
//  homePageModel.h
//  testcell
//
//  Created by 陈威利 on 16/4/22.
//  Copyright © 2016年 陈威利. All rights reserved.
//

#import "JSONModel.h"

@interface homePageModel : JSONModel
//限时抢购-->collectionView所需要的数据
@property (nonatomic,copy)NSString<Optional> *flashSaleImageUrl;
@property (nonatomic,copy)NSString<Optional> *flashSaleTitle;
@property (nonatomic,copy)NSString<Optional> *flashSalePrice;
//限时抢购KV imageURL
@property (nonatomic,copy)NSArray<Optional> *flashSaleKVImageUrlArray;


//索尼会员 imageURLArray
@property (nonatomic,copy)NSArray<Optional> *sonyMemberImageUrlArray;


//热销榜单
#warning 
//因为热销榜单的图片元素比较多,因此先写个字典,其余另行设计
@property (nonatomic,copy)NSDictionary<Optional> *TopSellingImageUrlDic;


@end
