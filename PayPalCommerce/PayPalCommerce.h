//
//  PayPalCommerce.h
//  PayPalCommerce
//
//  Created by Robert Haining on 3/19/14.
//  Copyright © 2013-2016 Braintree, a division of PayPal, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PPCProductCardView.h"
#import "PPCProduct.h"
#import "PPCProductCardTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PayPalCommerceDelegate;

@interface PayPalCommerce : NSObject

/** Returns the current SDK version. */
+(NSString *)version;

#pragma mark - Configuration
/** Configure the Client with the client id & secret provided to you by PayPal Commerce.
 */
+(void)configureWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret launchOptions:(nullable NSDictionary *)launchOptions;

/** Configure the Client with the client id & secret provided to you by PayPal Commerce.
    If you'd rather not pass your entire launchOptions dictionary, you can pass us the remoteNotification dictionary 
    remoteNotification: the remote notification dictionary from launchOptions
 */
+(void)configureWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret remoteNotification:(nullable NSDictionary *)remoteNotification;


/** Configure Apple Pay Merchant ID. 
    Note that only certain payment gateways are supported, so you'll also need to enable Apple Pay on the PayPal Commerce Control Panel (https://commerce.paypal.com/)
*/
+(void)configureApplePayMerchantID:(nullable NSString *)merchantID;


#pragma mark - Integration
/** If you are a building a standalone store app, use `presentStoreApp`: */
+(void)presentStoreApp;


/** If you are embedding the store in another app, then you can present the store modally via `presentModalStore`: */
+(void)presentModalStore;


/** If you'd like more control over how you display the store, use `paypalCommerceRootViewController`. */
+(UIViewController *)paypalCommerceRootViewController;

#pragma mark - Delegate
/** If you use the `paypalCommerceRootViewController` above, please set the delegate, so the shop will be visible when it needs to. */
+(void)setDelegate:(nullable id<PayPalCommerceDelegate>)delegate;
+(nullable id<PayPalCommerceDelegate>)delegate;


/**
 If you have a general app 'log out' or reset functionality, you can call this method to log out the user from the shop as well.
 */
+(void)logoutUserWithCompletionHandler:(void(^)(BOOL success, NSError *error))completionHandler;



#pragma mark - Client Hooks
/** This allows PayPal Commerce to handle related URLs that come in. Please override this in your App Delegate:
      - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
          [PayPalCommerce openURL:url sourceApplication:sourceApplication annotation:annotation];
          return YES;
      }
    We will only look at URLs prefixed by "mdst", "pypl", and "fb" */
+ (void)openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nullable id)annotation;


/** This allows PayPal Commerce to send push notifications to the app. Please override these in your App Delegate:
   -(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
       [PayPalCommerce didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
   }
   -(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
       [PayPalCommerce didFailToRegisterForRemoteNotificationsWithError:error];
   }
   - (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
       [PayPalCommerce didRegisterUserNotificationSettings:notificationSettings];
   }
 */
+(void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
+(void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
+(void)didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;


/** This allows PayPal Commerce to act on push notifications it sends. We'll only deal with notifications that include a `mdst` key in them.
Please override this in your App Delegate:
   -(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
       [PayPalCommerce didReceiveRemoteNotification:userInfo];
   }
 */
+(void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification;


/** In order for Spotlight Search to work properly in iOS 9+, please add this to your App Delegate:
    - (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler {
        [PayPalCommerce continueUserActivity:userActivity restorationHandler:restorationHandler];
        return YES;
    }
*/
+(void)continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler;


/** In order for Home Screen 3D Touch actions to work properly in iOS 9+ on supported devices, please add this to your App Delegate:
    -(void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
        BOOL didPerformAction = [PayPalCommerce performActionForShortcutItem:shortcutItem];
        if(!didPerformAction){
            //if you added any custom 3D Touch shortcuts, you can handle them here
        }
        completionHandler(didPerformAction);
    }
 
    You'll also need to update your Info.plist with:
        <key>UIApplicationShortcutItems</key>
        <array>
            <dict>
                <key>UIApplicationShortcutItemIconType</key>
                <string>UIApplicationShortcutIconTypeHome</string>
                <key>UIApplicationShortcutItemTitle</key>
                <string>Shop</string>
                <key>UIApplicationShortcutItemType</key>
                <string>com.paypal.commerce.home</string>
            </dict>
            <dict>
                <key>UIApplicationShortcutItemIconType</key>
                <string>UIApplicationShortcutIconTypeSearch</string>
                <key>UIApplicationShortcutItemTitle</key>
                <string>Search</string>
                <key>UIApplicationShortcutItemType</key>
                <string>com.paypal.commerce.search</string>
            </dict>
            <dict>
                <key>UIApplicationShortcutItemIconType</key>
                <string>UIApplicationShortcutIconTypeTime</string>
                <key>UIApplicationShortcutItemTitle</key>
                <string>Purchases</string>
                <key>UIApplicationShortcutItemType</key>
                <string>com.paypal.commerce.order-history</string>
            </dict>
        </array>
 */
+(BOOL)performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem;



#pragma mark - Deep Integration
/** If you'd like to present a product "card" view within your app, use this method.
    Essentially a product card is a UIView that present a thumbnail of the product,
    the name of the product, and the total cost (including shipping & taxes,
    if the user has a shipping address). There's also a 'buy' button that will automatically
    trigger a purchase within the PayPal Commerce store & present the purchase flow & receipt.
    After a purchase, the user has the ability to return immediately to your app, or to stay within the shop.

    This view should be at least 200x80pt, though we recommend at least 250x80pt.
*/
+(PPCProductCardView *)productCardViewWithFrame:(CGRect)frame productGroupID:(NSString *)productGroupID completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;
+(PPCProductCardView *)productCardViewWithProductGroupID:(NSString *)productGroupID completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

+(PPCProductCardView *)productCardViewWithFrame:(CGRect)frame searchTerm:(NSString *)searchTerm completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;
+(PPCProductCardView *)productCardViewWithSearchTerm:(NSString *)searchTerm completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;

+(PPCProductCardView *)productCardViewWithFrame:(CGRect)frame productSKU:(NSString *)productSKU completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;
+(PPCProductCardView *)productCardViewWithSKU:(NSString *)productSKU completion:(nullable void (^)(BOOL success, NSError * __nullable error))completion;



/** If you'd like to present your own UI for a product & purchase, you can do that here.
    Give us a product group id or search term & we'll return you a PPCProduct object or an NSError.
 */
+(void)fetchProductWithGroupID:(NSString *)productGroupID completion:(nullable void (^)(PPCProduct * __nullable product, NSError * __nullable error))completion;

/** To grab the first product for a search term */
+(void)fetchProductWithSearchTerm:(NSString *)searchTerm completion:(nullable void (^)(PPCProduct * __nullable product, NSError * __nullable error))completion;

/** To grab a product via its SKU */
+(void)fetchProductWithSKU:(NSString *)productSKU completion:(nullable void (^)(PPCProduct * __nullable product, NSError * __nullable error))completion;


/** to grab all products for a search term:
    perPage = number of results per page
    page = current page (start at 1) 
 */
+(void)fetchProductListWithSearchTerm:(NSString *)searchTerm
                              perPage:(NSUInteger)perPage
                                 page:(NSUInteger)page
                           completion:(nullable void (^)(NSArray * __nullable productList, NSError * __nullable error))completion;

/** Purchase a product. */
+(void)purchaseProduct:(PPCProduct *)product;






#pragma mark - Barcode Scanning
/** If your store supports barcode scanning & PayPal Commerce has your UPCs embedded in its database,
    you can use these methods to present a scan UI.
    This uses Apple's built-in barcode scanning library. It will also support QR code URLs.
    You should check if the user's device supports barcode scanning first (i.e., whether they have a camera or not).
*/
+(BOOL)deviceSupportsBarcodeScanning;
+(void)scanForBarcodes;



#pragma mark - Deprecated Methods
/** Old method for configuring client.
 @deprecated This delegate method is deprecated, please use configureWithClientID:clientSecret:launchOptions instead. */
+(void)configureWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret splashImage:(nullable UIImage *)splashImage launchURL:(nullable NSURL *)launchURL __attribute__((deprecated));
/** Old method for configuring client.
 @deprecated This delegate method is deprecated, please use configureWithClientID:clientSecret:launchOptions instead. */
+(void)configureWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret splashImage:(nullable UIImage *)splashImage launchOptions:(nullable NSDictionary *)launchOptions __attribute__((deprecated));
/** Old method for configuring client.
 @deprecated This delegate method is deprecated, please use configureWithClientID:clientSecret:launchOptions instead. */
+(void)configureWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret splashImage:(nullable UIImage *)splashImage launchURL:(nullable NSURL *)launchURL remoteNotification:(nullable NSDictionary *)remoteNotification __attribute__((deprecated));
/** Old method for configuring client.
 @deprecated This delegate method is deprecated, please use configureWithClientID:clientSecret:launchOptions instead. */
+(void)configureWithClientID:(NSString *)clientID clientSecret:(NSString *)clientSecret launchURL:(nullable NSURL *)launchURL remoteNotification:(nullable NSDictionary *)remoteNotification __attribute__((deprecated));


@end





#pragma mark - PayPalCommerceDelegate
@protocol PayPalCommerceDelegate <NSObject>

@optional
/** Implement this if you're using a tab bar controller or other non-modal display to present the PayPal Commerce Store to your users */
-(void)paypalCommerceRequestsVisibility;


/** If you have implemented a modal store, this method will inform your app when PayPal Commerce is dismissed by the user */
-(void)paypalCommerceWillDismissWithTransitionDuration:(NSTimeInterval)transitionDuration;
-(void)paypalCommerceDidDismiss;

@end

NS_ASSUME_NONNULL_END
