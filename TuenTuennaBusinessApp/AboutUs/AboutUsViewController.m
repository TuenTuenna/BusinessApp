//
//  AboutUsViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 버튼 모서리 둥글게 해주고
    self.contactUsButton.layer.cornerRadius = 5;
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// contactUs 버튼이 클릭되었을때
- (IBAction)contactUs:(id)sender {
    
    // 탭 바의 위치를 이동시킨다.
    [(UITabBarController *) self.tabBarController setSelectedIndex:4];
    
}


@end
