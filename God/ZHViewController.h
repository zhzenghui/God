//
//  ZHViewController.h
//  God
//
//  Created by bejoy on 14/9/16.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHViewController : UIViewController< UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIView *v1;
@property (strong, nonatomic) IBOutlet UIView *v2;
@property (weak, nonatomic) IBOutlet UIImageView *contentImgeView;

- (IBAction)swithContentImage:(id)sender;
- (IBAction)openPDF:(id)sender;

@end
