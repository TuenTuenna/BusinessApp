//
//  ServicesViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "ServicesViewController.h"

@interface ServicesViewController ()

@end

@implementation ServicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.detailModel[0];
    self.detailTitle.text = self.detailModel[0];
    self.detailImage.image = [UIImage imageNamed:self.detailModel[1]];
    self.detailDescription.text =self.detailModel[2];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
