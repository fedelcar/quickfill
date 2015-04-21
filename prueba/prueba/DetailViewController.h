//
//  DetailViewController.h
//  prueba
//
//  Created by Federico on 19/01/13.
//  Copyright (c) 2013 Federico. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
- (IBAction)dismissSegue:(id)sender;
@end
