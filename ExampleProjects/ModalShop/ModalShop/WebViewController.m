//
//  WebViewController.m
//  ModalShop
//
//  Created by Robert Haining on 7/27/15.
//  Copyright (c) 2015 Modest. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong, readwrite) UIWebView *webView;
@property (nonatomic, readonly) UIActivityIndicatorView *activityIndicator;
@end

@implementation WebViewController

-(instancetype)initWithURL:(NSURL *)url title:(NSString *)title{
    if(self = [super init]){
        self.url = url;
        self.title = title;
    }
    return self;
}


- (void)loadView {
    [super loadView];
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicator.hidesWhenStopped = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicator];
}

#pragma mark - UIWebView
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [self.activityIndicator stopAnimating];
}


@end
