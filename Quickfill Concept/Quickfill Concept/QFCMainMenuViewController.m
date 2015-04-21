//
//  QFCMainMenuViewController.m
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import "QFCMainMenuViewController.h"

@interface QFCMainMenuViewController ()

@end

@implementation QFCMainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) timerEvent {
    
}

- (void)viewDidLoad
{
    
//    NSMethodSignature *methodsignature = [NSMethodSignature ];
//    NSInvocation *invocacion = [NSInvocation invocationWithMethodSignature:methodsignature];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 invocation:invocacion repeats:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissButton:(id)sender {
    
  [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
