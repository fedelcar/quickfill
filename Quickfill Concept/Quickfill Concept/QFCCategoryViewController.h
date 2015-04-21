//
//  QFCCategoryViewController.h
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globals.h"

@interface QFCCategoryViewController : UITableViewController
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@property (strong, nonatomic) IBOutlet UITableView *table1P;
@property (strong, nonatomic) IBOutlet UITableView *tableMP;

@property (nonatomic, strong) NSArray *trialCategories;


@end
