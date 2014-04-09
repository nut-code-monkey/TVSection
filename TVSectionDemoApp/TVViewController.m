//
//  TVViewController.m
//  TVSectionDemoApp
//
//  Created by Max Lunin on 28.05.13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import "TVViewController.h"
#import "TVSection.h"

@interface TVViewController ()

@end

@implementation TVViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    __weak UITableView* tableView = self.tableView;
    
    TVSection* numberSection = [[[TVSection sectionWithItems:@[ @1, @2, @3, @4, @5 ]
                                              cellGenerator:^(TVSection* section, NSNumber* number, NSIndexPath* idx)
                                 {
                                     UITableViewCell* cellForNumber = [tableView dequeueReusableCellWithIdentifier:@"cellForNumber"
                                                                                                      forIndexPath:idx];
                                     cellForNumber.textLabel.text = [number stringValue];
                                     return cellForNumber;
                                 }]
                                onClick:^(TVSection *section, NSNumber* number, NSUInteger index)
                                {
                                    NSLog(@"you select first section with number: %@", number);
                                }] title:@"Numbers"];
    
    TVSection* stringSection = [[[TVSection sectionWithItems:@[ @"string 1", @"string 2", @"string 3"]
                                              cellGenerator:^(TVSection* section, NSString* string, NSIndexPath* idx)
                                 {
                                     UITableViewCell* cellForString = [tableView dequeueReusableCellWithIdentifier:@"cellForStrings"
                                                                                                      forIndexPath:idx];
                                     cellForString.textLabel.text = string;
                                     return cellForString;
                                 }]
                                onClick:^(TVSection *section, NSString* string, NSUInteger index)
                                {
                                    NSLog(@"you select second section with string: %@", string);
                                }] title:@"Strings"];
    
    self.sections = @[numberSection, stringSection];
}

@end
