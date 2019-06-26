//
//  ContactUsViewController.h
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactUsViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;


- (IBAction)directions:(id)sender;
- (IBAction)callUs:(id)sender;


@end

NS_ASSUME_NONNULL_END
