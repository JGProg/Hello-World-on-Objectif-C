//
//  HelloWorldViewController.m
//  HellowWorld
//
//  Created by jessy giacomoni on 27/06/2013.
//  Copyright (c) 2013 jessy giacomoni. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "social/Social.h"
#import "accounts/Accounts.h"


@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *ButtonEnter;

- (IBAction)ChangeGreeting:(id)sender;

- (IBAction)facebook:(id)sender;
- (IBAction)twitter:(id)sender;

@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.Label.text = @"I know to say Hello ;)";
    self.textField.placeholder = @"Enter your name Here :D";
    self.ButtonEnter.titleLabel.text = @"Push here when you have clicked :)";
    self.ButtonEnter.enabled =false;
	// Do any additional setup after loading the view, typically from a nib.

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == self.textField) {
        [theTextField resignFirstResponder];
        self.ButtonEnter.enabled =true;
    }
    /*UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hello World!"
                                                      message:@"Non mais Hello World quoi."
                                                     delegate:self // Call : (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:@"Button 2", @"Button 3", nil];
    [message show];*/
    
    return YES;
}

- (IBAction)ChangeGreeting:(id)sender
{
    self.userName = self.textField.text;
   
    NSString *nameString = self.userName;
    if ([nameString length] == 0) {
        nameString = @"World";
    }
    
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    self.Label.text = greeting;
}



// Working with UIAlertView and UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Button 1"])
    {
        NSLog(@"Button 1 was selected.");
    }
    else if([title isEqualToString:@"Button 2"])
    {
        NSLog(@"Button 2 was selected.");
    }
    else if([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 was selected.");
    }
}


-(IBAction)facebook:(id)sender{
    SLComposeViewController *controllerSLC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [controllerSLC setInitialText:@"Trop cool mon cette app"];
    [controllerSLC addURL:[NSURL URLWithString:@"http://www.jessygiacomoni.fr"]];
    [controllerSLC addImage:[UIImage imageNamed:@"test.jpg"]];
    [self presentViewController:controllerSLC animated:YES completion:Nil];
}


-(IBAction)twitter:(id)sender
{
    SLComposeViewController *controllerSLC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [controllerSLC setInitialText:@"Trop cool mon cette app"];
    [controllerSLC addURL:[NSURL URLWithString:@"http://www.jessygiacomoni.fr"]];
    [controllerSLC addImage:[UIImage imageNamed:@"test.jpg"]];
    [self presentViewController:controllerSLC animated:YES completion:Nil];
}
@end