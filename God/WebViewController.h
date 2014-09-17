//
//  WebViewController.h
//  M32
//
//  Created by i-Bejoy on 13-12-8.
//  Copyright (c) 2013年 zeng hui. All rights reserved.
//


@interface WebViewController : UIViewController<UIWebViewDelegate>
{
    UIWebView *contentWebView;

}



@property(nonatomic,retain) NSURL *url;

@end
