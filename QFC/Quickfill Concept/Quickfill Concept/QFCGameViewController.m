//
//  QFCGameViewController.m
//  Quickfill Concept
//
//  Created by Federico on 25/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import "QFCGameViewController.h"
#import "Globals.h"
#import "List.h"


@interface QFCGameViewController ()

@end

@implementation QFCGameViewController

{
    double time;
    NSTimer *timer;
}

@synthesize answers;
@synthesize txtInputedAnswers;
@synthesize inputedAnswersArray;


int correctAnswers=0;
BOOL dismissKeyboardBoolean;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    answers = [[NSMutableArray alloc]init];
    
    int i =0;
    do {
        List *tempList = [listLoadArray objectAtIndex: i];
        NSString *tempName = tempList.name ;
        if ([tempName isEqualToString:listCaller]){
            answers = [NSArray arrayWithObjects: tempList.answerRel, nil];
        };
        i++;
    } while (i < [listLoadArray count]);
    NSLog([NSString stringWithFormat:@"%d", [answers count]]);
    
    inputedAnswersArray = [NSMutableArray arrayWithCapacity:[answers count]];
    self.txtInputedAnswers.text = listCaller;
    self.txtInputedAnswers.textAlignment = 1;
    self.txtInputedAnswers.font = [UIFont boldSystemFontOfSize: 30];
    correctAnswers =0;
    self.lblCompletion.text = [NSString stringWithFormat:@"%d / %d", correctAnswers, [answers count] ];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.txtInputedAnswers addGestureRecognizer:tap];
    int diffMultiplier = 1;
    time = [answers count]*10*diffMultiplier;
    timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                target: self
                                                selector:@selector(onTick:)
                                                userInfo: nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) isListComplete:(int)answersInputed {
    if (correctAnswers==[answers count]) {
        NSLog(@"ganaste guacho");
    }
}


- (IBAction)didEndEditing:(id)sender {
    NSString *inputedAnswer = self.txtInput.text;
    if ([answers containsObject:[inputedAnswer capitalizedString]] && !([inputedAnswersArray containsObject:[inputedAnswer capitalizedString]])) {
        NSLog(@"OK");
        self.txtInputedAnswers.text=[NSString stringWithFormat:@"%@%@%@", self.txtInputedAnswers.text,@"\n", [inputedAnswer capitalizedString]];
        [inputedAnswersArray addObject:[inputedAnswer capitalizedString]];
        self.txtInput.text=nil;
        correctAnswers++;
        self.lblCompletion.text = [NSString stringWithFormat:@"%d / %d", correctAnswers, [answers count] ];
        [self isListComplete:correctAnswers];
    } else {
        NSLog(@"Nope");
    }
}

- (void) onTick: (id) sender {
    int minute = (int) time/60;
    int second = time - minute*60;
 
    NSString *timeString = [NSString stringWithFormat:@"%2d:%02d", minute,second ];
    
    
    self.lblTimer.text = timeString ;
    time--;
    if (time <= 0){
        NSLog(@"se acabo el tiempo guacho");
        [timer invalidate];
        timer = nil;
    }

}

- (IBAction)quitButton:(id)sender {
    [self performSegueWithIdentifier:@"ButtholeTransition" sender:self];
    
}

- (IBAction)dismissButton:(id)sender {
     [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return dismissKeyboardBoolean;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.txtInput isFirstResponder] && [touch view] != self.txtInput) {
        [self.txtInput resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];

}

- (void)handleTap:(UITapGestureRecognizer *)tap
{
    dismissKeyboardBoolean=YES;
    [self.txtInput resignFirstResponder];

}

- (IBAction)touchTextField:(id)sender{
    dismissKeyboardBoolean=NO;
}

@end
