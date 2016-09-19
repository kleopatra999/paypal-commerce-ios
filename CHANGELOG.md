# PayPal Commerce iOS SDK Changelog

## v2.0.0-beta September 21, 2016
- We now support Xcode 8+ and iOS 10+. As such, we no longer support iOS 7.
- We have updated developer-facing class & method names from Modest to PayPal Commerce. You can generally update "ModestStore" to "PayPalCommerce", and "MDST" to "PPC". Please reach out to us if you have any questions.
- We have made it easier for users to log in with PayPal. We are now using Braintree's v.zero iOS SDK, instead of PayPal's iOS SDK. In order to use this, you will need to add your bundle id as a URL scheme. You can either explicitly type it in via `com.companyname.appname` or you can pull in the variable `$(PRODUCT_BUNDLE_IDENTIFIER)`. If you do not, PayPal login will not work.
- We use a few iOS frameworks that require you to identify their usage in your Info.plist:
```xml
	<key>NSCameraUsageDescription</key>
	<string>Your camera would only be used to let you scan your credit card.</string>
	<key>NSContactsUsageDescription</key>
	<string>Your contacts would only be used to let you import your shipping address.</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>You can save product photos to your library.</string>
```

Additionally, we have fixed a few bugs & polished up a few things, such as:
- Fixed the layout of fullscreen variants selection.
- Fixed a bug where if a user tapped a product card embedded by the 'host app', sometimes the product detail view wasn't loading as expected.
- Improved credit card scanning for expiration dates & cvv.
- Fixed an issue that popped up in iOS 10 where some of our modally presented views were unexpectedly rotating to landscape.
- Fixed a bug where some of our drawers that were presented via pan gesture recognizers would end up in an unexpected state if the presentation was canceled.

## v1.10.0-beta – June 27, 2016
- We now support CocoaPods v1.0+!
- Users can now logout in the Profile. SDK developers can now programmatically log out users as well (for instance, if you have an app-wide logout/reset usage).
- US-based customers can now enter in their zip code before they onboard to get accurate shipping costs.
- If the user has entered their zip code or address, they can now select their shipping method before they purchase.
- The SDK now exposes the ability to search via `sku` – you can either use `+[ModestStoreSDK fetchProductWithSKU:completion:]` or `+[ModestStoreSDK productCardViewWithFrame:productSKU:completion:]`
- Fixed a bug where we weren't properly tracking push notification interactions / app opens (particularly from a fresh session).

## v1.9.0 – March 9, 2016
- Modest is now PayPal Commerce! Check us out at https://paypal.com/commerce
- Please be sure to update your Podfile to use the new repo URL: `pod 'ModestStoreSDK', :git => 'git@github.com:braintree/paypal-commerce-ios.git'`
- Apple Pay merchant IDs are now configured in code – you can configure yours via adding `[ModestStoreSDK configureApplePayMerchantID:@"merchant.com."]` to your app delegate.
- Braintree’s V.zero integration adds increased security for your customers’ credit cards.
- Within your App Transport Security section of your Info.plist, you can now remove the entry for “Cloudfront.net”, and add in one for “loggly.com”. Get the details at [Info.plist](README.md#infoplist-updates).
- Now supports 3D Touch on the Home Screen, but it requires you to update your [Info.plist](README.md#infoplist-updates) and your [App Delegate](README.md#). Also supported is 3D Touch preview from product lists, category list, and purchase history.
- User Interface improvements.
- For Instagram sharing to work properly, please update your [Info.plist](README.md#infoplist-updates).

## v1.8.6 – December 16, 2015
- Fixes bug where subcategory product lists would not load properly. This is related to AFNetworking v2.6.0's update to where they no longer encode / and ? characters in query parameters in GET requests.

## v1.8.5 – November 17, 2015
- Fixes bug where 'open shipments' header in the shipments history view wasn't showing up properly in iOS 9+.

## v1.8.4 – Skipped

## v1.8.3 – Skipped

## v1.8.2 – Skipped

## v1.8.1 – October 29, 2015
- Updates Apple Pay payment sheet to reflect the app name as the merchant on the 'total' line.
- Fixes bug where folks could enter the same promo code twice – this was just a display bug. Upon purchase, it would only get applied once.

## v1.8.0 – October 6, 2015
- *Important note*: iOS 9 introduces the [App Transport Security policy](https://developer.apple.com/library/prerelease/ios/technotes/App-Transport-Security-Technote/). In order for Modest to continue to function properly, you'll need to update your [Info.plist](README.md#infoplist-updates). This will allow us to continue to fetch images that we host on Cloudfront, as well as allow your users to continue to login with Facebook.
- iOS 9 support: Spotlight Search Indexing, Safari View Controller.
    -  For Spotlight Search Indexing to work, please implement in your App Delegate:
    
        ```objc
        - (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler {
            [ModestStoreSDK continueUserActivity:userActivity restorationHandler:restorationHandler];
            return YES;
        }
        ```
- New Purchase & Unbuy Confirmation UI
- Improved SDK headers + docs
- Added compiler to assist with Swift interoperability
- Fixed UI when launched in landscape mode on an iPhone 6 Plus.
- Fixed crash that happened when an existing user tried to verify their email within an Apple Pay transaction.
- Fixed crash from UIActivityViewController on iPad

## v1.7.1 – September 8, 2015
- Disables `allowInvalidCertificates` on Simulator, which was conflicting with recent `AFNetworking` updates to cause an error that prevented the SDK from communicating with the Modest API.

## v1.7.0 – July 30, 2015
- Support for Activity View Controller – share or perform other actions on your products
- Polish
- Added null/nonnull flags for increased interoperability with Swift
- Support for WKWebView on iOS 8+
- Fixed crashes
- Updated Google Analytics & Facebook to their new CocoaPods (if you use these yourself, you may need to update as well in order to avoid duplicate symbol compiler errors).

## v1.6.1 – July 14, 2015
- Fixed a bug where if you recently enabled telephone number as a required field, the user could get stuck in a checkout flow.

## v1.6.0 – July 2, 2015
- PayPal support.
- You can choose your own category images now at https://commerce.paypal.com/categories, plus modify their focal points so we auto-crop the images better.
- Improved SDK documentation.
- Automatically hides empty categories.
- Reduced New Relic logging.
- UI Polish.

## v1.5.1 - June 4, 2015
- Fixed a crash that occurred on iOS 8.3 when an existing user who's not currently onboarded in the current app attempts to purchase something through Apple Pay & completes the email verification loop.
- When choosing an alternate variant after purchase, we'll now show the user negative cost differences, as well as positive cost differences (previously, we only showed positive cost differences, i.e. if the cost was higher).

## v1.5.0 - June 3, 2015
- Upon configuring the Modest client, we will check your configuration (on a background thread). If anything is awry, we will display an alert in the app & print out details in the console. If you're on the Simulator, we'll throw an exception to drive home the point.
- Deep-linked URLs now work. Check out docs/url_specs.md for specs.
- Users can now buy more than one of a product by setting its quantity from the product detail view.
- Modest now supports phone number collection. You can configure this in the Control Panel at commerce.paypal.com.
- Redesigned search UI. Users can now search within categories.

## v1.4.0 – May 5, 2015
- Resigned product detail page.
- New banners on product list pages to inform users of tax, shipping promotions, and current shipment batching timeframes.
- Updated Facebook SDK to v4, which requires some updates to the Modest SDK integration. Please update your app delegate's url open method to use the following, which is required for Facebook login to continue to work:
```
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [ModestStoreSDK openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}
```

## v1.3.1 – April 28, 2015
- Fixed bug where you could get stuck in the UI if you selected Purchases from the sidebar menu, and then unbought your only purchase.
- Fixed bug where if you selected your profile, and then tried to set Apple Pay as your default payment method, and you had a pre-existing default credit card, and there was an error in the API, then you could get stuck in the UI.

## v1.3.0 – April 15, 2015
- Home screen variations (update via the Modest Control Panel)
- Updated category UI

## v1.2.3 – April 9, 2015
- Fixes an issue where the sdk could get stuck thinking it's in an offline state, even though it has an active connection.

## v1.2.2 – April 6, 2015
- Fixed bug where a modal store presented from a landscape-based app would look weird.

## v1.2.1 – March 30, 2015
- PassKit is now an explicitly weak framework in the podspec to prevent crashing in iOS 7.

## v1.2.0 – March 26, 2015
- Redesigned Categories, Purchase Detail.
- New inline ‘Tips’ replace the welcome screen.
- The SDK no longer uses `logo_welcome` or `logo_sidebar`.

## v1.1.1 – February 25, 2015
- Fixed a display issue in the purchase history where the item cost wasn’t incorporating any discounts (the total cost was still correct).
 
## v1.1.0 – February 23, 2015
- Added support for promo codes.
- Added support for sale prices.
- Improved purchase history UI.

## v1.0.1 – February 4, 2015
- Bug fixes.

## v1.0.0 – January 26, 2015
- Lots of bug fixes & UX improvements.
- Please update `logo_small.imageset` to `logo_header.imageset`. We updated this for clarification, and to sync up with our other clients & services.
- Updated email login & checkout UI.
- Fixed bugs in international postal code validation
- Support for multiple promotions.
- No longer supporting `simulator_vendor_identifier` from the config file. You can remove this if you like.

## v0.0.11 – December 3, 2014
- Fixed bug where a user’s locale would determine the currency symbol displayed, even though the price would be in USD.
- Fixed bug where if the `return_to_app` copy is missing from the local config file, we’ll show default copy instead of an empty button on the buy & unbuy confirmation screens.

## v0.0.10 – November 24, 2014
- Themes will now be delivered via API, with an initial local copy baked in in the form of a modified Modest-Config.plist & images. The `colors` dictionary has a new set of keys, and now requires a hex value to represent the color (previously it was an rgb dictionary).
- Now supports international addresses for shipping & billing.

## v0.0.9 – November 6, 2014
- Bug fixes & optimization

## v0.0.8 – October 28, 2014
- New delegate methods to inform apps that present Modest as a modal store when the store is being dismissed by the user (`-(void)modestStoreWillDismissWithTransitionDuration:(NSTimeInterval)transitionDuration` & `-(void)modestStoreDidDismiss`).

## v0.0.7 – October 24, 2014
- Due to bugs in iOS 8, we recommend you set `UIViewControllerBasedStatusBarAppearance` to ‘NO’ in your info plist. This ensures the best UI at this point in time.
- Deprecated config option `google_analytics_id` – this is delivered via the API now.
- New background images: `login_background~iphone6` and `login_background~landscape`.
- If you’re running an embedded or modal store within your app & you do not request onboarding before viewing your store, you do not need to include login_background* images.

## v0.0.6 – October 16, 2014
- Support for iPad, iPhone 6, & iPhone 6+
- Removed `login_background` from parent app’s concern.
- New theme colors: `nav_bar_text_color`, `nav_bar_tint_color`, `browse_shop_color`, `splash_spinner_color`.
- support for ‘deep embed’ of the sdk in another app
- support for a custom google analytics tracker id
- support for shipping promotions
- Deprecated `welcome_section` & `sample_search_term`

## v0.0.5 – October 6, 2014
- Patch to support updated CocoaPods (Card.io & Facebook)

## v0.0.4 – October 1, 2014
- Support for API-supplied navigation links
- Support for Merchandise Promos
- Gift mode for existing users
- Added ‘all products’ to categories list
- Initial push notification support
- New config option `google_analytics_id`: If you want us to send analytics events to your own Google tracker ID, add it here.
- General performance & stability updates & bug fixes.

## v0.0.3 – August 29, 2014
- New home screen UI with the option of categories
- New product detail + fullscreen image gallery
- New sidebar menu
- You can now add links to webpages from that sidebar. For now, you can add to the config file (how-to below). Later, this will be managed from our Portal.
- New product card UI; can now add a card via search
- Gifting (mark as ‘gift’ and add a gift message)
- Scan to buy: set `enable_barcode_scanning` to `true` in your config plist (more below)
- Fixed blip of products list on buy
- SDK header comments & method arguments are clearer
- Fixed missing assets from compiled lib

## v0.0.2 – August 20, 2014
- New profile state if not logged in
- Improved 'Edit Profile' UI
- New config options: checkmark_color, search_hint_color

## v0.0.1 – August 6, 2014
- Initial Release
