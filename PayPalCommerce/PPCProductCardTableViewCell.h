//
//  PPCProductCardTableViewCell.h
//  PayPalCommerce
//
//  Created by Robert Haining on 9/8/14.
//  Copyright © 2013-2016 Braintree, a division of PayPal, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPCProductCardView.h"

@interface PPCProductCardTableViewCell : UITableViewCell

@property (nonatomic, readonly, nullable) PPCProductCardView *productCardView;
@property (nonatomic) PPCCallToActionMode callToActionMode;

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
