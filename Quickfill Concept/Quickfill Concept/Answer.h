//
//  Answer.h
//  Quickfill Concept
//
//  Created by Federico on 26/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "List.h"
#import "Spellings.h"

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) List *listRel;
@property (nonatomic, retain) NSMutableArray *spellingRel;
@end

@interface Answer (CoreDataGeneratedAccessors)

- (void)addSpellingsRelObject:(NSManagedObject *)value;
- (void)removeSpellingsRelObject:(NSManagedObject *)value;
- (void)addSpellingsRel:(NSSet *)values;
- (void)removeSpellingsRel:(NSSet *)values;

@end
