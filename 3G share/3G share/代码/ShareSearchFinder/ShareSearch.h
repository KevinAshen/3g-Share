//
//  ShareSearch.h
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareSearch : UIViewController<UISearchBarDelegate>
{
    //定义一个textField
    //文本输入区域
    //例如，用户名，密码等需要输入文本文字的内容区域
    //只能输入单行的文字，不能输入或显示多行
    UISearchBar* _searchBar;
}
//定义属性
@property (retain, nonatomic) UISearchBar* searchBar;
@end
