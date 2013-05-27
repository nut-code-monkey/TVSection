//
//  TVSection.m
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import "TVSection.h"

@implementation TVSection

-(void)dealloc
{
    _itemsCounter = nil;
    _itemGetter = nil;
    _cellGenerator = nil;
}

-(id)initWithItems:( NSArray* )items cellGenerator:( TVSectionCellGenerator )generator
{
    NSParameterAssert(generator);
    self = [super init];
    if ( self )
    {
        self.items = items;
        self.cellGenerator = generator;
    }
    return self;
}

+(id)sectionWithItems:( NSArray* )items cellGenerator:( TVSectionCellGenerator )generator
{
    return [[self alloc] initWithItems:items cellGenerator:generator];
}

-(void)setItems:(NSArray *)items
{
    _items = items;
    self.itemsCounter = ^(TVSection* section){ return section.items.count; };
    self.itemGetter = ^(TVSection* section, NSUInteger index){ return section.items[index]; };
}

-(void)setItemsCounter:(TVSectionItemsCounter)itemsCounter
{
    NSParameterAssert(itemsCounter);
    _itemsCounter = itemsCounter;
}

-(void)setItemGetter:(TVSectionItemGetter)itemGetter
{
    NSParameterAssert(itemGetter);
    _itemGetter = itemGetter;
}

-(void)setCellGenerator:(TVSectionCellGenerator)cellGenerator
{
    NSParameterAssert(cellGenerator);
    _cellGenerator = cellGenerator;
}

@end