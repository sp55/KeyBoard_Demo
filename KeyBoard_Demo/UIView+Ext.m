//
//  UIView+Ext.m
//  KeyBoard_Demo
//
//  Created by admin on 16/6/30.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "UIView+Ext.h"

@implementation UIView (Ext)


- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

@end
