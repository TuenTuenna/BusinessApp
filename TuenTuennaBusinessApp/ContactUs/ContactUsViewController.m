//
//  ContactUsViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "ContactUsViewController.h"
#import "MapPin.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.button1.layer.cornerRadius = 5;
    self.button2.layer.cornerRadius = 5;
    self.button3.layer.cornerRadius = 5;
    self.button4.layer.cornerRadius = 5;
    
    // 맵킷
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    CLLocationCoordinate2D location;
    
    // 위치
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    location.latitude = 37.579432;
    location.longitude = 126.991022;
    
    region.span = span;
    region.center = location;
    
    // 위치로 이동
    [self.mapView setRegion:region animated:YES];
    
    // 맵핀 지도에 표시
    MapPin *annotation = [[MapPin alloc] init];
    annotation.coordinate = location;
    
    [self.mapView addAnnotation:annotation];
    
    
    // 뒤로가기 버튼 아이템 설정
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)directions:(id)sender {
    
    // URL 로 연다.
    // http://maps.apple.com/?daddr=위도,경도
    // 37.579390, 126.991025
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%s,%s", "37.579390", "126.991025"]] options:@{} completionHandler:nil];
    
    
}

- (IBAction)callUs:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:01012341234"] options:@{} completionHandler:nil];
    
}



@end
