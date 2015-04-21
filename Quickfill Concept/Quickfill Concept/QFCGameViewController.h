//
//  QFCGameViewController.h
//  Quickfill Concept
//
//  Created by Federico on 25/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QFCGameViewController : UIViewController

- (IBAction)didEndEditing:(id)sender;
- (IBAction)quitButton:(id)sender;
- (IBAction)dismissButton:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *lblTimer;
@property (strong, nonatomic) IBOutlet UILabel *lblCompletion;
@property (strong, nonatomic) IBOutlet UITextView *txtInputedAnswers;
@property (strong, nonatomic) NSMutableArray *inputedAnswersArray;

@property (strong, nonatomic) IBOutlet UITextField *txtInput;
@property (strong, nonatomic) NSMutableArray *answers;

- (IBAction)touchTextField:(id)sender;


@end
