//
//  HelloWorldViewController.m
//  HellowWorld
//
//  Created by jessy giacomoni on 27/06/2013.
//  Copyright (c) 2013 jessy giacomoni. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)ChangeGreeting:(id)sender;

@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    }
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
@end