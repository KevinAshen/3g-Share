//
//  uoLoadingCollectionViewCell.m
//  share
//
//  Created by tuqiangyao on 2018/8/1.
//  Copyright © 2018年 tuqiangyao. All rights reserved.
//

#import "uoLoadingCollectionViewCell.h"

@implementation uoLoadingCollectionViewCell
- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _topImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _topImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_topImage];
    }
    return self;
}
@end
