//
//  TVSectionTests.m
//  TVSectionTests
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import "TVSectionTests.h"
#import "TVSection.h"

@interface TVSectionTests ()

@property (strong, nonatomic) TVSection* section;

@end

@implementation TVSectionTests

-(void)setUp
{
    [super setUp];
    
    self.section = [TVSection sectionWithItems:nil cellGenerator:^UITableViewCell*(TVSection* section, id item, NSUInteger index){ return nil; }];
}

-(void)tearDown
{
    [super tearDown];
    self.section = nil;
}

-(void)testSectionItems
{
    STAssertThrows( [TVSection sectionWithItems:nil cellGenerator:nil], nil );
    STAssertThrows( [TVSection sectionWithItems:@[] cellGenerator:nil], nil );
    
    TVSectionCellGenerator generator = ^UITableViewCell*(TVSection* section, id item, NSUInteger index){ return nil; };

    STAssertNoThrow( [TVSection sectionWithItems:nil cellGenerator:generator], nil);
    
    NSArray* items = @[];
    TVSection* section = [TVSection sectionWithItems:items cellGenerator:generator];
    STAssertNotNil(section, nil);
    STAssertEqualObjects(section.cellGenerator, generator, nil);
    STAssertEqualObjects(section.items, items, nil);
}

-(void)testSectionNillBlockSetters
{
    STAssertThrows( self.section.itemsCounter = nil, nil);
    STAssertThrows( self.section.itemGetter = nil, nil);
    STAssertThrows( self.section.cellGenerator = nil, nil);
}

-(void)testItemsSetter
{
    NSArray* items = @[ @1, @2, @3 ];
    
    self.section.items = items;
    STAssertNotNil( self.section.itemsCounter, nil);
    if ( self.section.itemsCounter )
    {
        STAssertEquals( self.section.itemsCounter(self.section), items.count, nil);
    }
    
    STAssertNotNil( self.section.itemGetter, nil);
    if (  self.section.itemGetter )
    {
        for (NSUInteger i = 0; i < items.count; ++i)
        {
            STAssertEqualObjects( self.section.itemGetter(self.section, i), items[i], nil);
        }
    }
}

@end
