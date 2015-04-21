//
//  Category.h
//  Quickfill Concept
//
//  Created by Federico on 26/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "List.h"


@interface Category : NSManagedObject

@property (nonatomic, retain) NSString * name;
//@property (nonatomic, retain) List *listRel;
@property (nonatomic, retain) NSMutableArray *listRel;
@end

@interface Category (CoreDataGeneratedAccessors)

- (void)addListRelObject:(NSManagedObject *)value;
- (void)removeListRelObject:(NSManagedObject *)value;
- (void)addListRel:(NSSet *)values;
- (void)removeListRel:(NSSet *)values;

@end
