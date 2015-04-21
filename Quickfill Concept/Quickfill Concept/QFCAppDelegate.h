//
//  QFCAppDelegate.h
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;

//@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property NSURL *urlServer;
@property NSError *parserError;
@property NSXMLParser *xmlParser;
@property NSString *answerId;
@property NSNumber *answerIdPor;
@property NSString *categoryName;
@property NSString *listName;
@property NSString *versionNumber;
@property NSString *spellingValue;
@property NSMutableArray *hola;
@property BOOL *newVersion;


//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;

@end
