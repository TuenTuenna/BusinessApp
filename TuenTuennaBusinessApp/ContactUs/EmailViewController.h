//
//  EmailViewController.h
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <MessageUI/MessageUI.h>


NS_ASSUME_NONNULL_BEGIN

@interface EmailViewController : UIViewController
        <MFMailComposeViewControllerDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextView *messageField;
@property (weak, nonatomic) IBOutlet UIButton *emailSendButton;

- (IBAction)dismissKeyboard:(id)sender;

- (IBAction)sendEmail:(id)sender;


@end

NS_ASSUME_NONNULL_END
