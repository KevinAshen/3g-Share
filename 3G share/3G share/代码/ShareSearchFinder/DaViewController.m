//
//  DaViewController.m
//  3G share
//
//  Created by 姜凯文 on 2018/8/1.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "DaViewController.h"
#import "ShareInformationRecommendTableViewCell.h"

@interface DaViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation DaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"搜索";
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];

    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    self.searchBar = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, 300, 30)];
    self.searchBar.text=@"搜索 用户名 作品分类 文章";
    self.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.borderStyle = UITextBorderStyleRoundedRect;
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    //开始TableView的操作
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, 550) style:UITableViewStyleGrouped];
    
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
    
    
    [cell.button2 setImage:[UIImage imageNamed:@"button_zan"] forState:UIControlStateNormal];
    [cell.button2 setTitleColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f] forState:UIControlStateNormal];
    [cell.button2 setTitle:@"25" forState:UIControlStateNormal];
    [cell.button2 setTitle:@"26" forState:UIControlStateSelected];
    [cell.button2 addTarget:self action:@selector(touchZan:) forControlEvents:UIControlEventTouchUpInside];
    cell.button2.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [cell.button3 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
    [cell.button3 setTitleColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f] forState:UIControlStateNormal];
    [cell.button3 setTitle:@"33" forState:UIControlStateNormal];
    [cell.button3 setTitle:@"34" forState:UIControlStateSelected];
    [cell.button3 addTarget:self action:@selector(touchZan:) forControlEvents:UIControlEventTouchUpInside];
    cell.button3.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [cell.button4 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
    [cell.button4 setTitleColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f] forState:UIControlStateNormal];
    [cell.button4 setTitle:@"12" forState:UIControlStateNormal];
    [cell.button4 setTitle:@"13" forState:UIControlStateSelected];
    [cell.button4 addTarget:self action:@selector(touchZan:) forControlEvents:UIControlEventTouchUpInside];
    cell.button4.titleLabel.font = [UIFont systemFontOfSize:11];
    
    
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 必须辞去第一响应者后,键盘才会回缩.
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)touchZan:(UIButton*)button
{
    button.selected = !button.selected;
    
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
