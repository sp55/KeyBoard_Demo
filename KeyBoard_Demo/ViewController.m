//
//  ViewController.m
//  KeyBoard_Demo
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "MNCarCodeView.h"
@interface ViewController ()
@property(strong,nonatomic)UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(100, 100, 40, 40);
    [self.btn setTitle:@"沪" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor blackColor]];
    [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
}
-(void)btnAction
{
    
    NSLog(@"===---");

    
    
    MNCarCodeView *carView= [MNCarCodeView sharedMNCarCodeView];
    [carView show];
    
    
    __weak ViewController *weakSelf = self;
    
    carView.block = ^(NSString *provinceStr){
        NSLog(@"===%@",provinceStr);
        [weakSelf.btn setTitle:provinceStr forState:UIControlStateNormal];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
