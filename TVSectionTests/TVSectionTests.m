//
//  TVSectionTests.m
//  TVSectionTests
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import "TVSectionTests.h"
#import "TVSection.h"

@implementation TVSectionTests

-(void)testSectionItems
{
    STAssertThrows( [TVSection sectionWithItems:nil cellGenerator:nil], nil );
    STAssertThrows( [TVSection sectionWithItems:@[] cellGenerator:nil], nil );
    TVSectionCellGenerator generator = ^UITableViewCell*(TVSection* section, NSUInteger index){ return nil; };
    STAssertNoThrow( [TVSection sectionWithItems:nil cellGenerator:generator], nil);
    
    NSArray* items = @[];
    TVSection* section = [TVSection sectionWithItems:items cellGenerator:generator];
    STAssertNotNil(section, nil);
    STAssertEqualObjects(section.cellGenerator, generator, nil);
    STAssertEqualObjects(section.items, items, nil);
}

-(void)testSectionNillBlockSetters
{
    TVSectionCellGenerator generator = ^UITableViewCell*(TVSection* section, NSUInteger index){ return nil; };
    
    TVSection* section = [TVSection sectionWithItems:nil cellGenerator:generator];
    STAssertThrows( section.itemsCounter = nil, nil);
    STAssertThrows( section.itemGetter = nil, nil);
    STAssertThrows( section.cellGenerator = nil, nil);
}

-(void)testItemsSetter
{
    TVSectionCellGenerator generator = ^UITableViewCell*(TVSection* section, NSUInteger index){ return nil; };
    TVSection* section = [TVSection sectionWithItems:nil cellGenerator:generator];
    NSArray* items = @[ @1, @2, @3 ];
    
    section.items = items;
    STAssertNotNil( section.itemsCounter, nil);
    if ( section.itemsCounter )
    {
        STAssertEquals( section.itemsCounter(section), items.count, nil);
    }
    
    STAssertNotNil( section.itemGetter, nil);
    if (  section.itemGetter )
    {
        for (NSUInteger i = 0; i < items.count; ++i)
        {
            STAssertEqualObjects( section.itemGetter(section, i), items[i], nil);
        }
    }
}

@end
