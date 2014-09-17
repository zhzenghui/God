//
//  WebViewController.m
//  M32
//
//  Created by i-Bejoy on 13-12-8.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//

#import "WebViewController.h"


@interface WebViewController ()

@end

@implementation WebViewController

- (void)back:(UIButton *)button
{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    contentWebView = [[UIWebView alloc] init];
    contentWebView.frame = CGRectMake(0, 0, 1024, 768);
    contentWebView.delegate = self;
    contentWebView.scalesPageToFit = YES;
    [self.view addSubview:contentWebView];
    
    
    
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(1024-100, 0, 100, 100);
//    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];

    [contentWebView loadRequest:[NSURLRequest requestWithURL:self.url]];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}

// 是否支持转屏
- (BOOL)shouldAutorotate
{
    return YES;
}

// 支持的屏幕方向，此处可直接返回 UIInterfaceOrientationMask 类型
// 也可以返回多个 UIInterfaceOrientationMask 取或运算后的值
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return ((toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) |
            (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft));
}
@end
