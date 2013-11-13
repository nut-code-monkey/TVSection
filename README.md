TVSection
=========

*Install*
```
pod 'TVSection'
```

If you have a heterogeneous data, to be shown in the sections in the UITableView, you can inherit your view controller from *TVSectionTableViewController*.

All that you must do after that is:
```
-(void)viewDidLoad
{
    [super viewDidLoad];
    __weak UITableView* tableView = self.tableView;
    
    TVSection* numberSection = [[TVSection sectionWithItems:@[ @1, @2, @3, @4, @5 ]
                                              cellGenerator:^(TVSection* section, NSNumber* number, NSUInteger idx)
                                 {
                                     UITableViewCell* cellForNumber = [tableView dequeueReusableCellWithIdentifier:@"cellForNumber"];
                                     cellForNumber.textLabel.text = [number stringValue];
                                     return cellForNumber;
                                 }]
                                onClick:^(TVSection *section, NSNumber* number, NSUInteger index)
                                {
                                    NSLog(@"you select first section with number: %@", number);
                                }];
    
    TVSection* stringSection = [[TVSection sectionWithItems:@[ @"string 1", @"string 2", @"string 3"]
                                              cellGenerator:^(TVSection* section, NSString* string, NSUInteger idx)
                                 {
                                     UITableViewCell* cellForString = [tableView dequeueReusableCellWithIdentifier:@"cellForStrings"];
                                     cellForString.textLabel.text = string;
                                     return cellForString;
                                 }]
                                onClick:^(TVSection *section, NSString* string, NSUInteger index)
                                {
                                    NSLog(@"you select second section with string: %@", string);
                                }];
    
    self.sections = @[numberSection, stringSection];
}
```

License
-------
MIT - read LICENCE
