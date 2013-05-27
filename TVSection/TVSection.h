//
//  TVSection.h
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TVSection;

typedef NSUInteger(^TVSectionItemsCounter)(TVSection* section);
typedef UITableViewCell*(^TVSectionCellGenerator)(TVSection* section, NSUInteger index);
typedef id(^TVSectionItemGetter)(TVSection* section, NSUInteger index);

@interface TVSection : NSObject

@property (strong, nonatomic) NSArray* items;
@property (strong, nonatomic) TVSectionItemsCounter itemsCounter;
@property (strong, nonatomic) TVSectionItemGetter itemGetter;

@property (strong, nonatomic) TVSectionCellGenerator cellGenerator;

+(id)sectionWithItems:( NSArray* )items cellGenerator:( TVSectionCellGenerator )generator;

@end
