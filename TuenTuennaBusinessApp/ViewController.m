//
//  ViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.serviceButton.layer.cornerRadius = 5;
    self.portfolioButton.layer.cornerRadius = 5;
    self.aboutUsButton.layer.cornerRadius = 5;
    self.contactUsButton.layer.cornerRadius = 5;
    self.socialLinksButton.layer.cornerRadius = 5;
    
    // 뒤로가기 버튼 아이템 설정
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    
}

// 각각의 뷰에 Navigate 한다.
- (IBAction)services:(id)sender {
    
    // UITabBarController 로 형변환하여 반환
    [(UITabBarController *) self.tabBarController setSelectedIndex:2];
}

- (IBAction)portforlio:(id)sender {
    // UITabBarController 로 형변환하여 반환
    [(UITabBarController *) self.tabBarController setSelectedIndex:3];
}

- (IBAction)aboutUs:(id)sender {
    // UITabBarController 로 형변환하여 반환
    [(UITabBarController *) self.tabBarController setSelectedIndex:1];
}

- (IBAction)contactUs:(id)sender {
    // UITabBarController 로 형변환하여 반환
    [(UITabBarController *) self.tabBarController setSelectedIndex:4];
}


@end
