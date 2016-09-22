//
//  PPCProductCardView.h
//  PayPalCommerce
//
//  Created by Robert Haining on 7/17/14.
//  Copyright © 2013-2016 Braintree, a division of PayPal, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPCProduct.h"

typedef enum{
    PPCCTABuy=0,
    PPCCTAView=1,
    PPCCTANone=2
} PPCCallToActionMode;

/** The Product Card View provides a standard UIView for displaying a product within your app. Simply create this object
 and add it to your own view, and we'll asynchronously grab the product details & update the view.
 */
@interface PPCProductCardView : UIView

/** This is an internal id links together product variants into a group. (E.g., Small, Medium, Large, XL Tshirts)
 */
@property (nonatomic, readonly, nullable) NSString *productGroupID;

/** The search term used to find a product
 */
@property (nonatomic, readonly, nullable) NSString *productSearchTerm;

/** The product SKU used to fetch a product
 */
@property (nonatomic, readonly, nullable) NSString *productSKU;

/** The actual product object. Includes name, description, etc.
 */
@property (nonatomic, readonly, nullable) PPCProduct *product;

/** Has the product loaded into the view.
 */
@property (nonatomic, readonly) BOOL didLoad;

/** Any load error.
 */
@property (nonatomic, readonly, nullable) NSError *loadError;

/** Completion handler for when the product finishes loading.
 */
@property (nonatomic, copy, nullable) void (^completion)(BOOL success, NSError * __nullable error);

//UI
@property (nonatomic, readonly, nonnull) UIImageView *thumbnailView;
@property (nonatomic, readonly, nonnull) UILabel *productNameLabel;
@property (nonatomic, readonly, nonnull) UILabel *priceLabel;
@property (nonatomic, readonly, nonnull) UILabel *salePriceLabel;

@property (nonatomic) PPCCallToActionMode callToActionMode;
@property (nonatomic, readonly, nullable) UIButton *callToActionButton;
@property (nonatomic, readonly, nullable) UIButton *callToActionWrapper;

@property (nonatomic, readonly, nonnull) UILabel *soldoutLabel;
@property (nonatomic, readonly, nonnull) UILabel *errorLabel;


/** init with a frame, along with a product group id & optional completion handler.
    This view should be at least 200x80pt, though we recommend at least 250x80pt.
 */
-(nullable instancetype)initWithFrame:(CGRect)frame
                       productGroupID:(nonnull NSString *)productGroupID
                           completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** init with a product group id & optional completion handler.
 This view should be at least 200x80pt, though we recommend at least 250x80pt.
 */
-(nullable instancetype)initWithProductGroupID:(nonnull NSString *)productGroupID
                                    completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** init with a frame, along with a search term & optional completion handler.
 This view should be at least 200x80pt, though we recommend at least 250x80pt.
 */
-(nullable instancetype)initWithFrame:(CGRect)frame
                           searchTerm:(nonnull NSString *)searchTerm
                           completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** init with a search term & optional completion handler.
 This view should be at least 200x80pt, though we recommend at least 250x80pt.
 */
-(nullable instancetype)initSearchTerm:(nonnull NSString *)searchTerm
                            completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** init with a frame, along with a product SKU & optional completion handler.
 This view should be at least 200x80pt, though we recommend at least 250x80pt.
 */
-(nullable instancetype)initWithFrame:(CGRect)frame
                           productSKU:(nonnull NSString *)productSKU
                           completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

/** init with a product SKU & optional completion handler.
 This view should be at least 200x80pt, though we recommend at least 250x80pt.
 */
-(nullable instancetype)initWithProductSKU:(nonnull NSString *)productSKU
                                completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

@end

