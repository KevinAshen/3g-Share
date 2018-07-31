//
//  ShareInformationRecommend.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationRecommend.h"
#import "ShareInformationRecommendTableViewCell.h"

@interface ShareInformationRecommend ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShareInformationRecommend

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"我推荐的";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    //开始TableView的操作
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 520) style:UITableViewStyleGrouped];
    
    //注册
    [self.tableView registerClass:[ShareInformationRecommendTableViewCell class]  forCellReuseIdentifier:@"cell1"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareInformationRecommendTableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"forIndexPath:indexPath];
    
    NSArray *button1Image = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_img1"], [UIImage imageNamed:@"list_img2"], [UIImage imageNamed:@"list_img3"], [UIImage imageNamed:@"note_img3"],  [UIImage imageNamed:@"list_img4"], nil];
    
    NSArray *label1Text = [NSArray arrayWithObjects:@"假日\nshare小白\n原创-插画-练习习作\n15分钟前", @"国外画册欣赏\nshare小王\n平面设计-画册设计\n16分钟前", @"collection扁平化设计\nshare小吕\n平面设计-海报设计\n17分钟前", @"字体故事\nshare小律\n设计文章-设计观点\n18分钟前", @"板式整理术：\n高效解决\nshare小王\n平面设计-版面设计\n18分钟前", nil];
    
    
    [cell.button1 setImage:button1Image[indexPath.section] forState:UIControlStateNormal];
    
    cell.label1.font = [UIFont systemFontOfSize:12];
    cell.label1.textAlignment = NSTextAlignmentLeft;
    cell.label1.numberOfLines = 0;
    
    NSString *str = label1Text[indexPath.section];
    NSArray *tempArr = [str componentsSeparatedByString:@"s"];
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
    
    [AttributedStr addAttribute:NSFontAttributeName
     
                          value:[UIFont systemFontOfSize:20.0]
     
                          range:NSMakeRange(0, ((NSString *)tempArr[0]).length)];
    
    cell.label1.attributedText = AttributedStr;
    
    
    [cell.button2 setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
    
    
    return cell;
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
