//
//  ShareInformationMessageLetterLan.h
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareInformationMessageLetterLan : UIViewController

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *messageArray;
@property (nonatomic,retain) NSMutableArray *rowheightArray;
@property (nonatomic,retain) NSNumber *rowheight;
@property (nonatomic,retain) UITextField *text;

@end
