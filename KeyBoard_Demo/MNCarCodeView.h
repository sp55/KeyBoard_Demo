//
//  MNCarCodeView.h
//  KeyBoard_Demo
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MNCarCodeViewBlock)(NSString *provinceStr);

@interface MNCarCodeView : UIView
+(MNCarCodeView *)sharedMNCarCodeView;
-(void)show;


@property(copy,nonatomic)MNCarCodeViewBlock block;

@end
