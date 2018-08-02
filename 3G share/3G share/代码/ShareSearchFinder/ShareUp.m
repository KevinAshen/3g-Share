//
//  ShareUp.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareUp.h"
#import "LMJDropdownMenu.h"
#import "ShareUpChoose.h"

@interface ShareUp ()<LMJDropdownMenuDelegate, UITextFieldDelegate, UITextViewDelegate>

@end

@implementation ShareUp

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"上传";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    UIButton *chooseButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 170, 100)];
    chooseButton.backgroundColor = [UIColor colorWithRed:0.81f green:0.81f blue:0.81f alpha:1.00f];
    [chooseButton setTitle:@"选择图片" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f] forState:UIControlStateNormal];
    [chooseButton addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseButton];
    
    UIImageView *diImageView = [[UIImageView alloc] initWithFrame:CGRectMake(210, 40, 90, 20)];
    [diImageView setImage:[UIImage imageNamed:@"dizhi"]];
    [self.view addSubview:diImageView];
    
    LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
    dropdownMenu.layer.masksToBounds = YES;
    dropdownMenu.layer.borderWidth = 1;
    dropdownMenu.layer.borderColor = [UIColor blackColor].CGColor;
    [dropdownMenu.layer setMasksToBounds:YES];
    [dropdownMenu.layer setCornerRadius:5];
    [dropdownMenu setFrame:CGRectMake(210, 70, 90, 20)];
    [dropdownMenu setMenuTitles:@[@"设计资料",@"设计师观点",@"设计教程"] rowHeight:30];
    dropdownMenu.tintColor = [UIColor colorWithRed:0.81f green:0.80f blue:0.80f alpha:1.00f];
    dropdownMenu.delegate = self;
    [self.view addSubview:dropdownMenu];
    
    for (int i = 0; i < 4; i++) {
        NSArray *tag1NSArry = [NSArray arrayWithObjects:@"平面设计",  @"网页设计", @"UI/icon", @"插画/手绘", nil];
        UIButton *tag1 = [[UIButton alloc] initWithFrame:CGRectMake(10 + 75 * i, 140, 65, 30)];
        tag1.titleLabel.textAlignment = NSTextAlignmentCenter;
        tag1.layer.masksToBounds = YES;
        tag1.layer.cornerRadius = 3;
        tag1.titleLabel.font = [UIFont systemFontOfSize:14];
        tag1.backgroundColor = [UIColor whiteColor];
        [tag1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tag1 setTitle:tag1NSArry[i] forState:UIControlStateNormal];
        [tag1 addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tag1];
    }
    
    UIButton *tag2 = [[UIButton alloc] initWithFrame:CGRectMake(10, 180, 75, 30)];
    tag2.titleLabel.textAlignment = NSTextAlignmentCenter;
    tag2.layer.masksToBounds = YES;
    tag2.layer.cornerRadius = 3;
    tag2.titleLabel.font = [UIFont systemFontOfSize:14];
    tag2.backgroundColor = [UIColor whiteColor];
    [tag2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tag2 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [tag2 addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tag2];
    
    for (int i = 0; i < 3; i++) {
        NSArray *tag3NSArry = [NSArray arrayWithObjects:@"影视", @"摄影", @"其他", nil];
        UIButton *tag3 = [[UIButton alloc] initWithFrame:CGRectMake(95 + 75 * i, 180, 65, 30)];
        tag3.titleLabel.textAlignment = NSTextAlignmentCenter;
        tag3.layer.masksToBounds = YES;
        tag3.layer.cornerRadius = 3;
        tag3.titleLabel.font = [UIFont systemFontOfSize:14];
        tag3.backgroundColor = [UIColor whiteColor];
        [tag3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tag3 setTitle:tag3NSArry[i] forState:UIControlStateNormal];
        [tag3 addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tag3];
    }
    
    UITextField *nameTextView= [[UITextField alloc] initWithFrame:CGRectMake(0, 240, 320, 30)];
    nameTextView.backgroundColor = [UIColor whiteColor];
    nameTextView.placeholder = @"作品名称";
    nameTextView.delegate = self;
    [self.view addSubview:nameTextView];
    
    UITextView *zuoTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 280, 320, 90)];
    zuoTextView.text = @"请添加作品说明/文章内容......";
    zuoTextView.textColor = [UIColor blackColor];
    zuoTextView.delegate = self;
    [self.view addSubview:zuoTextView];
    
    UIButton *faButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 380, 280, 60)];
    faButton.backgroundColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    faButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [faButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [faButton setTitle:@"发布" forState:UIControlStateNormal];
    [self.view addSubview:faButton];
    
    // 有UITextField
    // 键盘上调事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    
}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
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

-(void)touchBtn1:(UIButton*)button
{
    ShareUpChoose *chooseViewController = [[ShareUpChoose alloc] init];
    
    chooseViewController.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:chooseViewController animated:YES];
    
    
}

- (void)touch:(UIButton *)button {
    button.selected = !button.selected;
    if(button.selected){
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
    }else{
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f]];
    }

}

- (void)leftBarBtnClicked:(UIButton *)btn {
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
