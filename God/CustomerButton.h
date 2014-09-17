//
//  CustomerButton.h
//  God
//
//  Created by bejoy on 14/9/16.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(int , BType) {
    
    ButtonTypeNone = 1,
    ButtonTypeOne = 2,
    ButtonTypeTwo = 3
};
@interface CustomerButton : UIButton
{
}


@property(nonatomic, assign) BType bType;
@end
