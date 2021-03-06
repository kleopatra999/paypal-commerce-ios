//
//  PPCError.h
//  PayPalCommerce
//
//  Created by Robert Haining on 10/23/14.
//  Copyright © 2013-2016 Braintree, a division of PayPal, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** PayPal Commerce errors returned to you will be in this domain. */
extern NSString * const PPCErrorDomain;

/** If a call fails due to missing content. 
 */
extern NSInteger const PPCMissingContentError;

/** If a call fails due to invalid content.
 */
extern NSInteger const PPCInvalidContentError;

/** If a call fails due to a lack of a current session.
 */
extern NSInteger const PPCNoSessionError;

@interface PPCError : NSObject

/** Returns true if this error is due to being offline.
 */
+(BOOL)isErrorOffline:(nullable NSError *)error;

/** Displays an alert with this error.
 */
+(void)displayAlertWithError:(nullable NSError *)error;

/** Displays an alert with this error & an optional title.
 */
+(void)displayAlertWithError:(nullable NSError *)error title:(nullable NSString *)title;

@end

NS_ASSUME_NONNULL_END
