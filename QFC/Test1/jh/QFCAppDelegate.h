//
//  QFCAppDelegate.h
//  jh
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
