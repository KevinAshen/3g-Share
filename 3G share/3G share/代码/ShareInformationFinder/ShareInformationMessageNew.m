//
//  ShareInformationMessageNew.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationMessageNew.h"

@interface ShareInformationMessageNew () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShareInformationMessageNew

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"新关注的";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    //开始TableView的操作
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 450) style:UITableViewStyleGrouped];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
        NSArray *imageNSArry = [NSArray arrayWithObjects:[UIImage imageNamed:@"sixin_img1"], [UIImage imageNamed:@"sixin_img2"], [UIImage imageNamed:@"sixin_img3"],[UIImage imageNamed:@"sixin_img4"], [UIImage imageNamed:@"guanzhu_img5"],[UIImage imageNamed:@"guanzhu_img6"], nil];
        cell1.imageView.image = imageNSArry[indexPath.section];
        
        NSArray *textNSArry = [NSArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", @"share猛猛", @"share孙哥", nil];
        
        cell1.textLabel.text = textNSArry[indexPath.section];
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIButton *icon1 = [[UIButton alloc] initWithFrame:CGRectMake(230, 30, 60, 30)];
        [icon1 setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateNormal];
        [icon1 addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell1.contentView addSubview:icon1];
    }
    return cell1;
}

- (void)touch:(UIButton *)button
{
    //设置button的Normal属性  和 selected属性后，通过下面简单非语句切换两种状态
    button.selected = !button.selected;
    if(button.selected){
        [button setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateNormal];
    }else{
        [button setImage:[UIImage imageNamed:@"guanzhu_pressed"] forState:UIControlStateNormal];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)leftBarBtnClicked:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
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
