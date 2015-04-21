//
//  Globals.h
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#ifndef Quickfill_Concept_Globals_h
#define Quickfill_Concept_Globals_h

NSManagedObjectContext *managedObjectContext;
NSMutableArray *categories;
NSMutableArray *sportArray;
NSMutableArray *geographyArray;
NSString *categoryCaller;
NSString *listCaller;
NSMutableArray *categoryLoadArray;
NSMutableArray *listLoadArray;
NSMutableArray *answerLoadArray;
NSMutableArray *spellingLoadArray;
NSMutableArray *loadingArray;
NSManagedObjectContext *context;
NSMutableArray *loadingAnswerArray;


typedef enum{
    Sports, Geography, defaultEnum
} Categories;


#endif
