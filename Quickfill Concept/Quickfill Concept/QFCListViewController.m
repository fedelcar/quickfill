//
//  QFCListViewController.m
//  Quickfill Concept
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import "QFCListViewController.h"
#import "QFCCategoryViewController.h"
#import "QFCListViewController.h"
#import "QFCCell.h"
#import "Globals.h"
#import "Spellings.h"
#import "List.h"
#import "Answer.h"
#import "Category.h"


@interface QFCListViewController ()

@end



@implementation QFCListViewController
@synthesize categoryCalling;
@synthesize categoryDictionary;
@synthesize categoriesIDs;
@synthesize loadingArray;

    

     


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    loadingArray = [NSMutableArray array];
    loadingAnswerArray = [NSMutableArray array];


    int i =0;
    
    do {
        List *tempList = [listLoadArray objectAtIndex:i];

        
        Category *tempCat = tempList.categoryRel;
        NSString *temp2=tempCat.name;
        if ([temp2 isEqualToString:categoryCaller]) {
            [loadingArray addObject:tempList.name];
            [loadingAnswerArray addObject:tempList.answerRel];
        }
        i++;
    } while (i<[listLoadArray count]);


  //  int c = [loadingArray count];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [loadingArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[QFCCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier ];
        
    }
    cell.textLabel.text=[loadingArray objectAtIndex:indexPath.row];

    // Configure the cell...
    
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    QFCCell *cell = (QFCCell*)[self.tableView cellForRowAtIndexPath: indexPath];
    listCaller = cell.textLabel.text;
    [self performSegueWithIdentifier: @"VaginaTransition" sender: self];
    
    // Navigation logic may go here. Create and push another view controller.
    /*
   //   *detailViewController = [[ alloc] initWithNibName:@"" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
