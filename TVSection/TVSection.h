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
typedef CGFloat(^TVSectionCellHeight)(UITableView* table, TVSection* section, NSUInteger index);
typedef void(^TVSectionOnClick)(TVSection* section, id item, NSUInteger index);

@interface TVSection : NSObject

@property (strong, nonatomic) id title;
@property (copy, nonatomic) NSArray* items;
@property (strong, nonatomic) TVSectionItemsCounter itemsCounter;
@property (strong, nonatomic) TVSectionItemGetter itemGetter;

@property (strong, nonatomic) TVSectionCellGenerator cellGenerator;
@property (strong, nonatomic) TVSectionCellHeight cellHeightGetter;
@property (strong, nonatomic) TVSectionOnClick onClick;

@property (weak, nonatomic) id<TVSectionDelegate> sectionDelegate;

+(instancetype)sectionWithItems:( NSArray* )items cellGenerator:(UITableViewCell*(^)(TVSection* section, id item, NSUInteger idx))generator;
-(instancetype)setCellHeight:( CGFloat )cellHeight;
-(instancetype)onClick:( void(^)(TVSection* section, id item, NSUInteger index) )onClickBlock;

@end
