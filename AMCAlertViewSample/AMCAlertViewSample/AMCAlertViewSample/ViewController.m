//
//  ViewController.m
//  AMCAlertViewSample
//
//  Created by Alfonso Miranda Castro on 13/08/13.
//  Copyright (c) 2013 Alfonso Miranda Castro. All rights reserved.
//

#import "ViewController.h"
#import "AMCAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)showAlert:(id)sender {
    
    AMCAlertView *alert = [[AMCAlertView alloc] initWithTittle:@"AMCAlertView" message:@"And so we have a nice alertview for our apps!" delegate:nil buttonTitle:@"OK"];
    [alert show];
    
}

@end
