//
//  ShareHomeTableViewCell.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/29.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareHomeTableViewCell.h"

@implementation ShareHomeTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.button1 = [[UIButton alloc] init];
        [self.contentView addSubview:_button1];
        
        self.label1 = [[UILabel alloc] init];
        [self.contentView addSubview:_label1];
        
        self.button2 = [[UIButton alloc] init];
        [self.contentView addSubview:_button2];
        
        self.button3 = [[UIButton alloc] init];
        [self.contentView addSubview:_button3];
        
        self.button4 = [[UIButton alloc] init];
        [self.contentView addSubview:_button4];

    }
    return self;
}
- (void) layoutSubviews {
    _button1.frame = CGRectMake(0, 0, 160, 130);
    
    _label1.frame = CGRectMake(180, 5, 150, 80);
    
    _button2.frame = CGRectMake(180, 95, 30, 15);
    
    _button3.frame = CGRectMake(225, 95, 30, 15);
    
    _button4.frame = CGRectMake(270, 95, 30, 15);
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
