//
//  TVSectionTableViewController.h
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVSection.h"

@interface TVSectionTableViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource, TVSectionDelegate>

@property (strong, nonatomic) NSArray* sections;
@property (strong, nonatomic) IBOutlet UITableView* tableView;

-(void)setSections:(NSArray *)sections reloadTableView:( BOOL )reloadTableView;

@end
