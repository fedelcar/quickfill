//
//  QFCListViewController.h
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
<UISearchBarDelegate, UITableViewDataSource> {
	// Instance variables defined earlier
}
@end

@interface QFCListViewController : UITableViewController

@property (strong, nonatomic) NSString *categoryCalling;
@property (strong, nonatomic) NSMutableDictionary *categoryDictionary;
@property (strong,nonatomic) NSMutableArray *categories;
@property (strong,nonatomic) NSMutableArray *loadingArray;
@property (strong,nonatomic) NSMutableArray *categoriesIDs;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
