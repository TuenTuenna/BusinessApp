//
//  EmailViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "EmailViewController.h"

@interface EmailViewController ()




@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messageField.layer.cornerRadius = 5;
    self.emailSendButton.layer.cornerRadius = 5;
    
    self.navigationItem.title = @"이메일 보내기";
    
    
    self.messageField.delegate = self;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// 소프트 키보드를 없앤다.
- (IBAction)dismissKeyboard:(id)sender {
    
    [self resignFirstResponder];
    
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]]. location == NSNotFound) {
        
        return YES;
    }
    
    [textView resignFirstResponder];
    return NO;
}

// 이메일을 보내는 함수
- (IBAction)sendEmail:(id)sender {

    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    
    // 이메일을 보낸수 있으면
    if([MFMailComposeViewController canSendMail]){
        
        // 받는 사람
        [composer setToRecipients:@[@"kor216465@gmail.com"]];
        // 제목
        [composer setSubject:@"Message from my app!"];
        // 내용
        [composer setMessageBody:[NSString stringWithFormat:@"Name: %@ \nEmail: %@ \n\nMessage: %@",
                                  self.nameField.text,
                                  self.emailField.text,
                                  self.messageField.text] isHTML:NO];
        [self presentViewController:composer animated:YES completion:nil];
        
    } else {
     
        NSLog(@"이메일을 보낼수 없습니다.");
        
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
