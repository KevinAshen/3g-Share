//
//  ShareInformationMessageLetterLan.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationMessageLetterLan.h"
#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width


@interface ShareInformationMessageLetterLan () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation ShareInformationMessageLetterLan

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"与share小兰对话";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    // 设置输入框
    _text = [[UITextField alloc] initWithFrame:CGRectMake(W * 0.07, W * 0.01, W * 0.75, H * 0.06)];
    _text.borderStyle=UITextBorderStyleRoundedRect;
    _text.delegate = self;
    
    // 设置发送按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:69/255.0 green:141/255.0 blue:203/255.0 alpha:1];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(W * 0.82 + W * 0.01, W * 0.01, W * 0.15, H * 0.06);
    btn.layer.borderWidth=1;
    btn.layer.cornerRadius=10;
    
    // 设置输入背景色
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, H - 44 - 64, W, 44)];
    view.backgroundColor=[UIColor blackColor];
    view.tag=101;
    [view addSubview:_text];
    [view addSubview:btn];
    
    // 设置 TableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H - 44 * 2) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_tableView];
    [self.view addSubview:view];
    [self.view bringSubviewToFront:view];
    
    // 设置聊天信息数值
    _messageArray = [NSMutableArray arrayWithObjects:@"你拍的真不错！", @"谢谢，已关注你。", @"好专业的照片，非常喜欢这种风格，期待你更好的作品。", @"嗯嗯，好的。",nil];
    _rowheightArray = [NSMutableArray array];
    for (NSString *str in _messageArray){
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(W * 0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        
        int height = size.height + W * 0.15;
        _rowheight = [NSNumber numberWithInt:height];
        [_rowheightArray addObject:_rowheight];
    }
    
    // 键盘回收事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)send{
    [_messageArray addObject:_text.text];
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    // 自适应高度，并计算
    CGSize size = [_text.text boundingRectWithSize:CGSizeMake(W * 0.6, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    int height = size.height + W * 0.15;
    _rowheight = [NSNumber numberWithInt:height];
    [_rowheightArray addObject:_rowheight];
    // 插入一条新的cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_messageArray.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    // 更新tableView
    [_tableView reloadData];
    // 滚动界面
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    // 清空 textField
    _text.text = @"";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 必须辞去第一响应者后,键盘才会回缩.
    [textField resignFirstResponder];
    return YES;
}

// 实现点击空白处以回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_text resignFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _messageArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    } else {
        //删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 一人一句话
    if(indexPath.row % 2 != 0){
        // 设置头像
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img2"]];
        imageView.frame = CGRectMake(W * 0.01, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        // 设置聊天气泡
        UIImageView *imageviewbubble = [[UIImageView alloc] init];
        imageviewbubble.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:0.5];
        //        UIImage *image = [UIImage imageNamed:@"对话框1"];
        //        UIEdgeInsets edge = UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.8, image.size.height * 0.8, image.size.width * 0.5);
        //        image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
        //        imageviewbubble.image = image;
        
        // 设置对话框
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        // 自适应高度
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.16, W * 0.05, size.width, size.height);
        imageviewbubble.frame = CGRectMake(W * 0.13, W * 0.01, size.width + W * 0.10, size.height + W * 0.10);
        [cell.contentView addSubview:imageviewbubble];
        [cell.contentView addSubview:label];
        
        
    }
    else{
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1"]];
        imageView.frame = CGRectMake(W - W * 0.11, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W*0.6, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        
        label.frame = CGRectMake(W - W * 0.14 - size.width, W * 0.05, size.width, size.height);
        
        UIImageView *imageviewbubble = [[UIImageView alloc]init];
        imageviewbubble.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:0.5];
        //        UIImage *image = [UIImage imageNamed:@"对话框"];
        imageviewbubble.frame = CGRectMake(W * 0.8 - size.width, W * 0.01, size.width + W * 0.08, size.height + W * 0.10);
        //        UIEdgeInsets edge = UIEdgeInsetsMake(image.size.height * 0.5, image.size.width*0.5, image.size.height*0.8, image.size.width*0.8);
        //        image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
        //        imageviewbubble.image = image;
        [cell.contentView addSubview:imageviewbubble];
        [cell.contentView addSubview:label];
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = _rowheightArray[indexPath.row];
    int rowheight = [height intValue];
    return rowheight + W * 0.05;
}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height - 64);}];
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
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
