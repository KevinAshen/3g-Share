//
//  ShareArticle.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareArticle.h"
#import "ShareInformationRecommendTableViewCell.h"

@interface ShareArticle ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation ShareArticle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"文章";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    
    NSArray *array = @[@"精选文章", @"精选文章", @"全部文章"];
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    _segmentedControl.frame = CGRectMake(0, 0, 320, 30);
    _segmentedControl.selectedSegmentIndex = 0;
    _segmentedControl.tintColor = [UIColor whiteColor];
    _segmentedControl.momentary = NO;
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                  forState:UIControlStateNormal];
    [_segmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.45f green:0.45f blue:0.45f alpha:1.00f], NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                  forState:UIControlStateSelected];
    [_segmentedControl setBackgroundColor:[UIColor colorWithRed:0.32f green:0.32f blue:0.32f alpha:1.00f]];
    [_segmentedControl setBackgroundImage:[UIImage imageNamed:@"1111"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedControl setDividerImage:[UIImage imageNamed:@"essay_line"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentedControl addTarget:self action:@selector(roll:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    

    _scrollView.bounces = NO;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, 320, 450)];
    _scrollView.contentSize = CGSizeMake(320 * 3, 450);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = NO;
    _scrollView.bounces = YES;
    _scrollView.bouncesZoom = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 450) style:UITableViewStyleGrouped];
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    _tableView1.tag = 1;
    [self.scrollView addSubview:_tableView1];
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(320, 0, 320, 450) style:UITableViewStyleGrouped];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    _tableView2.tag = 2;
    [self.scrollView addSubview:_tableView2];
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(640, 0, 320, 450) style:UITableViewStyleGrouped];
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    _tableView3.tag = 3;
    [self.scrollView addSubview:_tableView3];
    
    [_tableView1 registerClass:[ShareInformationRecommendTableViewCell class]  forCellReuseIdentifier:@"cell1"];
    [_tableView2 registerClass:[ShareInformationRecommendTableViewCell class]  forCellReuseIdentifier:@"cell2"];
    [_tableView3 registerClass:[ShareInformationRecommendTableViewCell class]  forCellReuseIdentifier:@"cell3"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1) {
        ShareInformationRecommendTableViewCell *cell1 = nil;
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"forIndexPath:indexPath];
        NSArray *button1Image = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_img1"], [UIImage imageNamed:@"list_img2"], [UIImage imageNamed:@"list_img3"], [UIImage imageNamed:@"note_img3"],  [UIImage imageNamed:@"list_img4"], nil];
        NSArray *label1Text = [NSArray arrayWithObjects:@"假日\nshare小白\n原创-插画-练习习作\n15分钟前", @"国外画册欣赏\nshare小王\n平面设计-画册设计\n16分钟前", @"collection扁平化设计\nshare小吕\n平面设计-海报设计\n17分钟前", @"字体故事\nshare小律\n设计文章-设计观点\n18分钟前", @"板式整理术：\n高效解决\nshare小王\n平面设计-版面设计\n18分钟前", nil];
        [cell1.button1 setImage:button1Image[indexPath.section] forState:UIControlStateNormal];
        cell1.label1.font = [UIFont systemFontOfSize:12];
        cell1.label1.textAlignment = NSTextAlignmentLeft;
        cell1.label1.numberOfLines = 0;
        NSString *str = label1Text[indexPath.section];
        NSArray *tempArr = [str componentsSeparatedByString:@"s"];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
        [AttributedStr addAttribute:NSFontAttributeName
                              value:[UIFont systemFontOfSize:20.0]
                              range:NSMakeRange(0, ((NSString *)tempArr[0]).length)];
        cell1.label1.attributedText = AttributedStr;
        [cell1.button2 setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        return cell1;
    } else if (tableView.tag == 2) {
        ShareInformationRecommendTableViewCell *cell2 = nil;
        cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"forIndexPath:indexPath];
        NSArray *button2Image = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_img4"], [UIImage imageNamed:@"list_img2"], [UIImage imageNamed:@"list_img3"], [UIImage imageNamed:@"note_img3"],  [UIImage imageNamed:@"list_img1"], nil];
        NSArray *label2Text = [NSArray arrayWithObjects:@"板式整理术：\n高效解决\nshare小王\n平面设计-版面设计\n18分钟前", @"国外画册欣赏\nshare小王\n平面设计-画册设计\n16分钟前", @"collection扁平化设计\nshare小吕\n平面设计-海报设计\n17分钟前", @"字体故事\nshare小律\n设计文章-设计观点\n18分钟前", @"假日\nshare小白\n原创-插画-练习习作\n15分钟前", nil];
        [cell2.button1 setImage:button2Image[indexPath.section] forState:UIControlStateNormal];
        cell2.label1.font = [UIFont systemFontOfSize:12];
        cell2.label1.textAlignment = NSTextAlignmentLeft;
        cell2.label1.numberOfLines = 0;
        NSString *str2 = label2Text[indexPath.section];
        NSArray *tempArr2 = [str2 componentsSeparatedByString:@"s"];
        NSMutableAttributedString *AttributedStr2 = [[NSMutableAttributedString alloc]initWithString:str2];
        [AttributedStr2 addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:20.0]
                               range:NSMakeRange(0, ((NSString *)tempArr2[0]).length)];
        cell2.label1.attributedText = AttributedStr2;
        [cell2.button2 setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        return cell2;
    } else {
        ShareInformationRecommendTableViewCell *cell3 = nil;
        cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"forIndexPath:indexPath];
        NSArray *button3Image = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_img2"], [UIImage imageNamed:@"list_img1"], [UIImage imageNamed:@"list_img3"], [UIImage imageNamed:@"note_img3"],  [UIImage imageNamed:@"list_img4"], nil];
        NSArray *label3Text = [NSArray arrayWithObjects:@"国外画册欣赏\nshare小王\n平面设计-画册设计\n16分钟前", @"假日\nshare小白\n原创-插画-练习习作\n15分钟前", @"collection扁平化设计\nshare小吕\n平面设计-海报设计\n17分钟前", @"字体故事\nshare小律\n设计文章-设计观点\n18分钟前", @"板式整理术：\n高效解决\nshare小王\n平面设计-版面设计\n18分钟前", nil];
        [cell3.button1 setImage:button3Image[indexPath.section] forState:UIControlStateNormal];
        cell3.label1.font = [UIFont systemFontOfSize:12];
        cell3.label1.textAlignment = NSTextAlignmentLeft;
        cell3.label1.numberOfLines = 0;
        NSString *str3 = label3Text[indexPath.section];
        NSArray *tempArr3 = [str3 componentsSeparatedByString:@"s"];
        NSMutableAttributedString *AttributedStr3 = [[NSMutableAttributedString alloc]initWithString:str3];
        [AttributedStr3 addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:20.0]
                               range:NSMakeRange(0, ((NSString *)tempArr3[0]).length)];
        cell3.label1.attributedText = AttributedStr3;
        [cell3.button2 setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        return cell3;

    }
    
}


- (void)leftBarBtnClicked:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRooterInSection:(NSInteger)section
{
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0.01;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *) tableView:(UITableView *)tableView viewForRooterInSection:(NSInteger)section {
    return nil;
}

- (void) roll: (UISegmentedControl *) sem {
    NSInteger selectindext = _segmentedControl.selectedSegmentIndex;
    if (selectindext == 0) {
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    if (selectindext == 1) {
        [_scrollView setContentOffset:CGPointMake(320, 0) animated:YES];
    }
    if (selectindext == 2) {
        [_scrollView setContentOffset:CGPointMake(640, 0) animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
