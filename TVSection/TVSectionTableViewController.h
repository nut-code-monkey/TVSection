//
//  TVSectionTableViewController.h
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TVSectionTableViewController : UIViewController

@property (strong, nonatomic) NSArray* sections;
@property (strong, nonatomic) IBOutlet UITableView* tableView;

@end
