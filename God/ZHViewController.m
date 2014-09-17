//
//  ZHViewController.m
//  God
//
//  Created by bejoy on 14/9/16.
//  Copyright (c) 2014年 zeng hui. All rights reserved.
//

#import "ZHViewController.h"
#import "CustomerButton.h"
#import "WebViewController.h"

@interface ZHViewController ()
{
    float currentScale;
    float minScale;
    float maxScale;
}
@end

@implementation ZHViewController


- (void)open:(CustomerButton *)button
{
    switch (button.tag) {
        case 9:
        case 10:
        case 11:
        case 12:
            if (button.bType == ButtonTypeNone) {
                button.bType = ButtonTypeTwo;
            }
            else if  (button.bType == ButtonTypeTwo) {
                button.bType = ButtonTypeNone;
            }
            
            break;
            
        default:
            if (button.bType == ButtonTypeNone) {
                button.bType = ButtonTypeOne;
            }
            else if  (button.bType == ButtonTypeOne) {
                button.bType = ButtonTypeTwo;
            }
            else if  (button.bType == ButtonTypeTwo) {
                button.bType = ButtonTypeNone;
            }
            break;
    }
    
//    更改 当前的照片
    UIImageView *imgView = (UIImageView *)[self.view viewWithTag:1000 + button.tag];
    NSString *path = [NSString stringWithFormat:@""];

    switch (button.bType) {
        case  ButtonTypeNone:
            break;
        case  ButtonTypeOne:
            path = [NSString stringWithFormat:@"传统-%i",  button.tag];
            break;
        case  ButtonTypeTwo:
            path = [NSString stringWithFormat:@"优化-%i", button.tag];
            break;
            
        default:
            break;
    }
    
    imgView.image = [UIImage imageNamed:path];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i = 1; i <= 13; i ++) {
        UIButton *b = (UIButton *)[self.v1 viewWithTag:i];
        [b addTarget:self action:@selector(open:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (int i = 1; i <= 13; i ++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 768 , 1024)];
        imgView.tag = 1000 + i;
        
        [self.v1 addSubview:imgView];
    }

    
    
    
    
    
    self.v2.frame = CGRectMake(768, 0, 768, 1024);
    [self.scrollView addSubview:self.v2];
    
    
    
    
    
    
    [self.scrollView addSubview:self.v1];

    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale=2.0;//最大倍率（默认倍率）
    [self.scrollView setContentSize:CGSizeMake(768*2, 1024)];


    
    
    UITapGestureRecognizer *doubelGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleGesture:)];
    doubelGesture.numberOfTapsRequired=2;
    [self.v1 addGestureRecognizer:doubelGesture];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.v1;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)myScrollView withView:(UIView *)view
{

    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    [self.scrollView setContentSize:CGSizeMake(768*2, 1024)];

}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    
    if(scale == 1)
    {
        self.scrollView.scrollEnabled = YES;
        self.v2.hidden = NO;
        self.scrollView.pagingEnabled = YES;
        [self.scrollView setContentSize:CGSizeMake(768*2, 1024)];

    }
    else {
        
        self.v2.hidden = YES;
        currentScale=scale;
        self.scrollView.pagingEnabled = NO ;

    }

}



#pragma mark -DoubleGesture Action
-(void)doubleGesture:(UIGestureRecognizer *)sender
{
    
    //当前倍数等于最大放大倍数
    //双击默认为缩小到原图
    if (currentScale==maxScale) {
        currentScale=minScale;
        [self.scrollView setZoomScale:currentScale animated:YES];
        return;
    }
    //当前等于最小放大倍数
    //双击默认为放大到最大倍数
    if (currentScale==minScale) {
        currentScale=maxScale;
        [self.scrollView setZoomScale:currentScale animated:YES];
        return;
    }
    
    CGFloat aveScale =minScale+(maxScale-minScale)/2.0;//中间倍数
    
    //当前倍数大于平均倍数
    //双击默认为放大最大倍数
    if (currentScale>=aveScale) {
        currentScale=maxScale;
        [self.scrollView setZoomScale:currentScale animated:YES];
        return;
    }
    
    //当前倍数小于平均倍数
    //双击默认为放大到最小倍数
    if (currentScale<aveScale) {
        currentScale=minScale;
        [self.scrollView setZoomScale:currentScale animated:YES];
        return;
    }
}

- (IBAction)swithContentImage:(UIButton *)sender {
    
    NSString *path = nil;
    
    switch ( sender.tag ) {
        case 1:
            path = @"传统表";
            break;
        case 2:
            path = @"电商表";
            break;
        case 3:
            path = @"上帝表";
            break;
            
        default:
            break;
    }
    
    
    self.contentImgeView.image = [UIImage imageNamed:path];
}

- (IBAction)openPDF:(id)sender {
    

    NSString *path = [[NSBundle mainBundle] pathForResource:@"上帝模式" ofType:@"pdf"];
    
    NSURL *url = [[NSURL alloc] initFileURLWithPath:path];
    
    WebViewController *web = [[WebViewController alloc] init];
    web.url = url;
    
    [self.view addSubview:web.view];
    [self presentViewController:web animated:YES completion:^{
        
    }];
    
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
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait) ;
}
@end
