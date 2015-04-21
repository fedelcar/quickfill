//
//  MasterViewController.h
//  Quickfill
//
//  Created by Federico on 18/01/13.
//  Copyright (c) 2013 Federico. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
