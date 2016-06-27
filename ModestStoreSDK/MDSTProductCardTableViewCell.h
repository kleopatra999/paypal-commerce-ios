//
//  MDSTProductCardTableViewCell.h
//  ModestStoreSDK
//
//  Created by Robert Haining on 9/8/14.
//  Copyright (c) 2014 Modest. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDSTProductCardView.h"

@interface MDSTProductCardTableViewCell : UITableViewCell

@property (nonatomic, readonly, nullable) MDSTProductCardView *productCardView;

/** load with a product group id & optional completion handler
 */
-(void)loadProductWithProductGroupID:(nonnull NSString *)productGroupID
                          completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** load with a search term & optional completion handler
 */
-(void)loadProductWithSearchTerm:(nonnull NSString *)searchTerm
                      completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** load with a product sku & optional completion handler
 */
-(void)loadProductWithProductSKU:(nonnull NSString *)productSKU
                      completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

@end
