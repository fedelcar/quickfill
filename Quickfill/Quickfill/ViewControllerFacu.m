//
//  ViewControllerFacu.m
//  Quickfill
//
//  Created by Federico on 18/01/13.
//  Copyright (c) 2013 Federico. All rights reserved.
//

#import "ViewControllerFacu.h"

@interface ViewControllerFacu ()

@end
@implementation UIViewController
- (IBAction)openSegue:(id)sender {
  [self performSegueWithIdentifier:@"toSettings" sender:self];
}
@end





@implementation ViewControllerFacu


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
