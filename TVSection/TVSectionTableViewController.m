//
//  TVSectionTableViewController.m
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import "TVSectionTableViewController.h"

@interface TVSectionTableViewController ()

@end

@implementation TVSectionTableViewController

-(void)setSections:(NSArray *)sections
{
    [self setSections:sections reloadTableView:YES];
}

-(void)setSections:(NSArray *)sections reloadTableView:( BOOL )reloadTableView
{
    _sections = sections;
    for ( TVSection* section in sections )
    {
        section.sectionDelegate = self;
        section.tableView = self.tableView;
    }

    if (reloadTableView)
    {
        [self.tableView reloadData];
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TVSection* tvSection = self.sections[section];
    return tvSection.itemsCounter(tvSection);
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TVSection* section = self.sections[indexPath.section];
    return section.cellGenerator(section, section.itemGetter(section, indexPath.row), indexPath);
}

#pragma mark UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TVSection* section = self.sections[indexPath.section];
    return section.cellHeightGetter(section, section.itemGetter(section, indexPath.row), indexPath.row);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TVSection* section = self.sections[indexPath.section];
    if ( section.onClick )
    {
        section.onClick( section, section.itemGetter(section, indexPath.row), indexPath.row );
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sections[section] title];
}

#pragma mark TVSectionDelegate

-(void)section:( TVSection* )section willSetNewItems:( NSArray* )items
{

}

-(void)section:( TVSection* )section didSetNewItems:( NSArray* )items
{
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:[self.sections indexOfObject:section]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
