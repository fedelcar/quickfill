//
//  List.h
//  Quickfill Concept
//
//  Created by Federico on 26/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer, Category;

@interface List : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * version;
@property (nonatomic, retain) NSMutableArray *answerRel;
@property (nonatomic, retain) Category *categoryRel;
@end

@interface List (CoreDataGeneratedAccessors)

- (void)addAnswerRelObject:(Answer *)value;
- (void)removeAnswerRelObject:(Answer *)value;
- (void)addAnswerRel:(NSSet *)values;
- (void)removeAnswerRel:(NSSet *)values;

@end
