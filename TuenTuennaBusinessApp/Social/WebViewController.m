//
//  WebViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 27..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

// 뷰가 로드되었을때
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 탑 네비게이션 타이틀 설정
    self.navigationItem.title = self.detailModel[0];
    
    // 웹뷰에 url 요청을 한다.
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.detailModel[1]]]];
    
    [self.webView addSubview:self.activityIndicator];
    
    // 로딩 애니메이션 시작
    [self.activityIndicator startAnimating];
    
    self.webView.navigationDelegate = self;
    
    
}

// 웹페이지 로딩이 완료되면
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    // 로딩 애니메이션을 정지한다.
    [self.activityIndicator stopAnimating];
}

// 웹페이지 로딩을 시작하면
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    // 로딩 애니메이션을 시작한다.
    [self.activityIndicator startAnimating];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)refresh:(id)sender {
    [self.webView reload];
}

- (IBAction)stop:(id)sender {
    [self.webView stopLoading];
}

- (IBAction)rewind:(id)sender {
    if([self.webView canGoBack]){
        [self.webView goBack];
    }
}

- (IBAction)forward:(id)sender {
    if([self.webView canGoForward]){
        [self.webView goForward];
    }
}


@end
