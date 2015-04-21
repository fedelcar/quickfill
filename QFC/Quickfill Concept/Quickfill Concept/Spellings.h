//
//  Spellings.h
//  Quickfill Concept
//
//  Created by Federico on 26/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer;

@interface Spellings : NSManagedObject

@property (nonatomic, retain) NSString * value;
@property (nonatomic, retain) Answer *answerRel;

@end
