//
//  QFCMasterViewController.h
//  bdjksdgks
//
//  Created by Federico on 25/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface QFCMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
