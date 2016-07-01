//
//  MNCarCodeView.m
//  KeyBoard_Demo
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "MNCarCodeView.h"
#import "UIView+Ext.h"

@interface MNCarCodeView ()
@property(strong,nonatomic)UIView *carView;
@property(nonatomic,strong)UIView *bgView;

@end


@implementation MNCarCodeView



+(MNCarCodeView *)sharedMNCarCodeView
{

    static MNCarCodeView *carView = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (carView == nil) {
            carView =[[MNCarCodeView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        }
    });
    return carView;

}



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {

        [self initUI];
    }
    return self;
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:[MNCarCodeView sharedMNCarCodeView]];
}

-(void)dismiss{
    [[MNCarCodeView sharedMNCarCodeView] removeFromSuperview];
}


-(void)initUI
{
    
    
    self.backgroundColor = [UIColor clearColor];
    
    CGFloat kWidth =[UIScreen mainScreen].bounds.size.width;
    CGFloat kHeight =[UIScreen mainScreen].bounds.size.height;
    
    _bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _bgView.backgroundColor =[UIColor clearColor];
    [self addSubview:_bgView];
    
    NSArray *carArr = @[@"京", @"津", @"渝", @"沪", @"冀", @"晋", @"辽", @"吉", @"黑", @"苏", @"浙", @"皖", @"闽", @"赣", @"鲁", @"豫", @"鄂", @"湘", @"粤", @"琼", @"川", @"贵", @"云", @"陕", @"甘", @"青", @"蒙", @"桂", @"宁", @"新", @"藏", @"台", @"港", @"澳"];
    
    
    CGFloat kBtnWidth =(kWidth-40)/7;
    CGFloat kMargin  = 5;
    
    
    _carView =[[UIView alloc]initWithFrame:CGRectMake(0, kHeight-(kMargin+5*(kBtnWidth+kMargin)), kWidth, (kMargin+5*(kBtnWidth+kMargin)))];
    _carView.backgroundColor =[UIColor lightGrayColor];
    [_bgView addSubview:_carView];

    
    
    
    
   
    
    for (NSInteger i=0; i<carArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(kMargin+i%7*(kBtnWidth+kMargin), kMargin+i/7*(kBtnWidth+kMargin),kBtnWidth , kBtnWidth);
        [btn setTitle:carArr[i] forState:UIControlStateNormal];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor redColor]];
        [_carView addSubview:btn];
    }
    
    
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
    
}
-(void)btnAction:(UIButton *)btn
{
    [self dismiss];

    _block(btn.titleLabel.text);
}



@end
