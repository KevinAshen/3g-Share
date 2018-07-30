//
//  ShareInformationTableViewCell.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/30.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationTableViewCell.h"

@implementation ShareInformationTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.image1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image1];
        
        self.label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        
        self.image2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_image2];
    }
    return self;
}

- (void) layoutSubviews {
    _image1.frame = CGRectMake(30, 10, 90, 90);
    
    _label1.frame = CGRectMake(140, 20, 300, 60);
    
    _image2.frame = CGRectMake(140, 80, 150, 20);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
