//
//  QFCAppDelegate.m
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import "QFCAppDelegate.h"

#import "QFCMainMenuViewController.h"
#import "QFCCategoryViewController.h"
#import "QFCListViewController.h"
#import "QFCCell.h"
#import "Spellings.h"
#import "List.h"
#import "Answer.h"
#import "Category.h"
#import "Version.h"

@implementation QFCAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize urlServer;
@synthesize parserError;
@synthesize answerId;
@synthesize answerIdPor;
@synthesize categoryName;
@synthesize listName;
@synthesize versionNumber;
@synthesize spellingValue;
@synthesize hola;
@synthesize newVersion;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    categoryLoadArray = [[NSMutableArray alloc]init];
    listLoadArray = [[NSMutableArray alloc]init];
    answerLoadArray= [[NSMutableArray alloc]init];
    spellingLoadArray = [[NSMutableArray alloc]init];
    hola = [[NSMutableArray alloc]init];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:@"file:////Users/Federico/Dropbox/App/Quickfill/server.xml"]];
    
    [xmlParser setDelegate:self];
    [xmlParser setShouldResolveExternalEntities:NO];
    
    BOOL ok = [xmlParser parse];
    if (ok == NO)
        NSLog(@"error");
    else
        NSLog(@"OK");
    
    [self arraysData];

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"QuickFillCD" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"QuickFillCD3.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSLog(@"XMLParser error: %@", [parseError localizedDescription]);
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
    NSLog(@"XMLParser error: %@", [validationError localizedDescription]);
}

-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"didStartDocument");
}

-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"didEndDocument");
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)charactersVal {
    
    charactersVal = [charactersVal stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (![charactersVal isEqualToString:@""] && newVersion)
    
    {

        spellingValue = charactersVal;
    
        NSManagedObjectContext *context = [self managedObjectContext];

        List *listInfo = [NSEntityDescription insertNewObjectForEntityForName:@"List" inManagedObjectContext:context];
        Category *categoryInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:context];
        Answer *answerInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:context];
        Spellings *spellingInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Spelling" inManagedObjectContext:context];
        Version *versionInfo = [NSEntityDescription insertNewObjectForEntityForName:@"Version" inManagedObjectContext:context];
        
        if (![hola containsObject:categoryName]) {
            [categoryInfo setValue:categoryName forKey:@"name"];
            [hola addObject:categoryName];
        }
                
        [listInfo setValue:listName forKey:@"name"];
        [answerInfo setValue:answerIdPor forKey:@"id"];
        [spellingInfo setValue:spellingValue forKey:@"value"];
        [versionInfo setValue:versionNumber forKey:@"number"];
        
        listInfo.categoryRel = categoryInfo;
        answerInfo.listRel = listInfo;
        spellingInfo.answerRel = answerInfo;
        
        [categoryInfo.listRel addObject:listInfo];
        [listInfo.answerRel addObject:answerInfo];
        [answerInfo.spellingRel addObject:spellingInfo];
        
    }
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if (namespaceURI != nil)
        NSLog(@"namespace: %@", namespaceURI);
    
    if (qName != nil)
        NSLog(@"qualifiedName: %@", qName);
    
    NSEnumerator *attribs = [attributeDict keyEnumerator];
    NSString *key, *value;
        
    while((key = [attribs nextObject]) != nil) {
        value = [attributeDict objectForKey:key];

        if ([key isEqualToString:@"currentVersion"]) {
                    
            if ([value isEqualToString:@"1.1"]) {
                NSLog(@"XML.version = %@ (new=no)", value);
            }
                else
            {
                newVersion = true;
                NSLog(@"XML.version = %@ (new=yes)", value);
            
                versionNumber = value;
                                
                //to drop pending changes
                [_managedObjectContext lock];
                [_managedObjectContext reset];
                
                // retrieve the store URL
                NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"QuickFillCD3.sqlite"];
                                
                // remove the file containing the data
                [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
                
                //recreate the store like in the  appDelegate method
                [[_managedObjectContext persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:nil];
                [_persistentStoreCoordinator persistentStoreForURL:storeURL];
               
                [_managedObjectContext unlock];
            }
            
        }
        
        if ([key isEqualToString:@"name"]) {
            listName = value;
        }
        
        if ([key isEqualToString:@"category"]) {
            categoryName = value;            
        }
        
        if ([key isEqualToString:@"id"]) {
            NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            NSNumber *valueNumberConversion = [f numberFromString:value];
            answerIdPor = valueNumberConversion;
        }
        
    }
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
}

-(void) arraysData {

    categoryLoadArray = [[NSMutableArray alloc]init];
    listLoadArray = [[NSMutableArray alloc]init];
    answerLoadArray= [[NSMutableArray alloc]init];
    spellingLoadArray = [[NSMutableArray alloc]init];
    hola = [[NSMutableArray alloc]init];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }

    //list out all the objects currently in the database
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *info in fetchedObjects) {
        if ([info valueForKey:@"name"] != nil) {
            [categoryLoadArray addObject:info];
        }
    }

    fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"List" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *info in fetchedObjects) {
        [listLoadArray addObject:info];

    }

    fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Answer" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *info in fetchedObjects) {
        [answerLoadArray addObject:info];
    }

    fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"Spelling" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (NSManagedObject *info in fetchedObjects) {
        if ([info valueForKey:@"value"]) {
            [spellingLoadArray addObject:info];
        }
    }
}

@end