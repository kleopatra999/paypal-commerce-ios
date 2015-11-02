//
//  MDSTProduct.h
//  ModestStoreSDK
//
//  Created by Robert Haining on 8/6/14.
//  Copyright (c) 2014 Modest. All rights reserved.
//

#import <Foundation/Foundation.h>

/** MDSTProduct exposes the data you need to display a product in your app. */
@interface MDSTProduct : NSObject

/** This internal id links together product variants into a group. (E.g., Small, Medium, Large, XL Tshirts) */
@property (nonatomic, copy, nullable) NSString *groupID;

/** The name of the product. */
@property (nonatomic, copy, nullable) NSString *name;

/** The description of the product. */
@property (nonatomic, copy, nullable) NSString *productDescription;

/** The lowest price (across all this product's variants).
    If this product only represents one variant, lowPrice & highPrice will be the same.
 */
@property (nonatomic, copy, nullable) NSDecimalNumber *lowPrice;
/** The highest price (across all this product's variants).
 If this product only represents one variant, lowPrice & highPrice will be the same.
 */
@property (nonatomic, copy, nullable) NSDecimalNumber *highPrice;

/** If the product is currently on sale, then the suggested price will be different than the low price above. */
@property (nonatomic, copy, nullable) NSDecimalNumber *lowSuggestedPrice;

/** If the product is currently in stock. */
@property (nonatomic) BOOL inStock;

/** If the product is currently on sale. */
@property (nonatomic) BOOL onSale;

/** The thumbnail image URL. */
@property (nonatomic, copy, nullable) NSURL *thumbnailURL;
/** The full-size image URL. */
@property (nonatomic, copy, nullable) NSURL *imageURL;

@end
