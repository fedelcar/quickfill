//
//  QFCDetailViewController.h
//  jh
//
//  Created by Federico on 24/01/13.
//  Copyright (c) 2013 gralc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QFCDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
