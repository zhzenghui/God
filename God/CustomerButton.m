//
//  CustomerButton.m
//  God
//
//  Created by bejoy on 14/9/16.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "CustomerButton.h"

@implementation CustomerButton

- (void)awakeFromNib
{
   
    _bType = ButtonTypeNone;
    
//    self.backgroundColor = [UIColor redColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}
 
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
