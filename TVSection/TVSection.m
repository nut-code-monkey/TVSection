//
//  TVSection.m
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import "TVSection.h"

#import <UIKit/UIKit.h>

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
        self.cellHeightGetter = nil;
    }
    return self;
}

+(instancetype)sectionWithItems:( NSArray* )items cellGenerator:( TVSectionCellGenerator )generator
{
    return [[self alloc] initWithItems:items cellGenerator:generator];
}

-(void)setItems:( NSArray* )items
{
    [self.sectionDelegate section:self willSetNewItems:items];
    _items = items;
    self.itemsCounter = ^(TVSection* section){ return section.items.count; };
    self.itemGetter = ^(TVSection* section, NSUInteger index){ return section.items[index]; };
    [self.sectionDelegate section:self didSetNewItems:items];
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

-(TVSectionCellHeight)cellHeightGetter
{
    if ( !_cellHeightGetter)
    {
        _cellHeightGetter = ^(UITableView* table, TVSection* section, NSUInteger index){ return table.rowHeight; };
    }
    return _cellHeightGetter;
}

-(instancetype)setCellHeight:( CGFloat )cellHeight
{
    self.cellHeightGetter = ^(UITableView* table, TVSection* section, NSUInteger index){ return cellHeight; };
    return self;
}

-(instancetype)onClick:( void(^)(TVSection* section, id item, NSUInteger index) )onClickBlock
{
    self.onClick = onClickBlock;
    return self;
}

@end
