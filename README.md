TVSection
=========

If you have a heterogeneous data, to be shown in the sections in the UITableView, you can inherit your view controller from *TVSectionTableViewController*.

All that you must do after that is:
```
-(void)viewDidLoad
{
    [super viewDidLoad];
    __weak UITableView* tableView = self.tableView;
    
    TVSection* numberSection = [TVSection sectionWithItems:@[ @1, @2, @3, @4, @5 ]
                                             cellGenerator:^(TVSection* section, NSNumber* number, NSUInteger idx)
                        {
                            UITableViewCell* cellForNumber = [tableView dequeueReusableCellWithIdentifier:@"cellForNumberItems"];
                            // configure cell for number
                            return cellForNumber;
                        }];

    TVSection* stringSection = [TVSection sectionWithItems:@[ @"1", @"2", @"3", @"4", @"5" ]
                                             cellGenerator:^(TVSection* section, NSString* string, NSUInteger idx)
                         {
                             UITableViewCell* cellForString = [tableView dequeueReusableCellWithIdentifier:@"cellForNumberItems"];
                             // configure cell for string
                             return cellForString;
                         }];
    
    self.sections = @[numberSection, stringSection];
}
```
