//
//  TVSection.h
//  TVSection
//
//  Created by Max Lunin on 5/27/13.
//  Copyright (c) 2013 Max Lunin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TVSection;

@protocol TVSectionDelegate <NSObject>

@required
-(void)section:( TVSection* )section willSetNewItems:( NSArray* )items;
-(void)section:( TVSection* )section didSetNewItems:( NSArray* )items;

@end

typedef NSUInteger(^TVSectionItemsCounter)(TVSection* section);
typedef id(^TVSectionItemGetter)(TVSection* section, NSUInteger index);

typedef UITableViewCell*(^TVSectionCellGenerator)(TVSection* section, id item, NSUInteger index);
typedef CGFloat(^TVSectionCellHeight)(TVSection* section, id item, NSUInteger index);
typedef void(^TVSectionOnClick)(TVSection* section, id item, NSUInteger index);


/**
 @class TVSection
 @discussion class reptesented tableView section
 
 Usage example:
 @code
 TVSection *section = [TVSection sectionWithItems:@[@1, @2, @3, @4]
                                    cellGenerator:^(TVSection* section, id number, NSUInteger idx)
                      {
                          return [section.tableView dequeueReusableCellWithIdentifier:@"some identifier"];
                      }];
 @endcode
 */
@interface TVSection : NSObject

/// title of section. NSString of UIView
@property (strong, nonatomic) id title;

/// array of items
@property (copy, nonatomic) NSArray* items;

/// block that return count of items
@property (strong, nonatomic) TVSectionItemsCounter itemsCounter;

/// block that return item by index
@property (strong, nonatomic) TVSectionItemGetter itemGetter;

/// block that return UITableViewCell by item and index
@property (strong, nonatomic) TVSectionCellGenerator cellGenerator;

/// block that return height by index
@property (strong, nonatomic) TVSectionCellHeight cellHeightGetter;

// callback that 
@property (strong, nonatomic) TVSectionOnClick onClick;

@property (weak, nonatomic) id<TVSectionDelegate> sectionDelegate;
@property (weak, nonatomic) UITableView* tableView;


/**
 setup title and return self

 @param items array of items
 @param cellGenerator title of section
 
 @return instancetype
 */
+(instancetype)sectionWithItems:( NSArray* )items
                  cellGenerator:( TVSectionCellGenerator )cellGenerator;

/**
 @discussion setup title and return self
 
 @param title - title of section
 @return instancetype
 */
-(instancetype)title:( id )title;


/**
 setup itemsCounter and return self
 
 @param itemsCounter title of section
 
 @return instancetype
 */
-(instancetype)itemsCounter:( TVSectionItemsCounter )itemsCounter;
-(instancetype)itemGetter:( TVSectionItemGetter )itemGetter;
-(instancetype)cellHeight:( CGFloat )cellHeight;
-(instancetype)cellHeightGetter:( TVSectionCellHeight )cellHeightGetter;
-(instancetype)onClick:( TVSectionOnClick )onClickBlock;
-(instancetype)sectionDelegate:( id<TVSectionDelegate> )sectionDelegate;

@end
