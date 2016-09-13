//
//  AppDelegate.m
//  TabBarShop
//
//  Created by Robert Haining on 7/27/15.
//  Copyright (c) 2015 Braintree, a division of PayPal, Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <PayPalCommerce/PayPalCommerce.h>

@interface AppDelegate () <PayPalCommerceDelegate>
@property (nonatomic, readonly) UITabBarController *tabBarController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //general app setup stuff
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    ViewController *viewController = [[ViewController alloc] init];
    //News icon by iconsmind.com from the Noun Project
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"News" image:[UIImage imageNamed:@"news"] tag:0];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    UIViewController *paypalCommerceViewController = [PayPalCommerce paypalCommerceRootViewController];
    //dollar icon by Luboš Volkov from the Noun Project
    paypalCommerceViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Store" image:[UIImage imageNamed:@"dollar"] tag:1];

    _tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[navigationController, paypalCommerceViewController];
    [self.window setRootViewController:self.tabBarController];
    
    
    
    // the good stuff! let's configure paypal commerce!
    // we're defaulting to a sample store,
    // but you should replace these with your own credentials from commerce.paypal.com
#warning Please obfuscate the client id & secret before shipping. Thanks! -paypal commerce
    NSString *clientId = @"8DmIY2hKQemOaift4FTt3Q";
    NSString *clientSecret = @"s5qxKZPQTZu05lvSJKfsKA48Rt2onnTHefS6FgbIBapQ";
    
    if(!clientId || !clientSecret){
        [NSException raise:@"PayPalCommerceException" format:@"Missing client id + secret"];
        return YES;
    }
    
    [PayPalCommerce setDelegate:self];
    [PayPalCommerce configureWithClientID:clientId clientSecret:clientSecret launchOptions:launchOptions];
    
#warning Please configure Apple Pay if you would like to enable it for your customers.
    /** 
     Make sure to
     1. Setup Apple Pay in the Apple Developer Member Center.
     2. Add your merchant ID to your project.
     3. Configure your Apple Pay merchant ID here.
     */
//    NSString *applePayMerchantID = @"";
//    [PayPalCommerce configureApplePayMerchantID:applePayMerchantID];

    return YES;
    
}


// This lets our login system function properly.
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [PayPalCommerce openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}

// This lets Spotlight Search open the shop to the correct product.
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler {
    [PayPalCommerce continueUserActivity:userActivity restorationHandler:restorationHandler];
    return YES;
}

// If you want PayPal Commerce to be able to send push notifications to your app, we'll need the following methods.
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [PayPalCommerce didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    [PayPalCommerce didFailToRegisterForRemoteNotificationsWithError:error];
}
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    [PayPalCommerce didRegisterUserNotificationSettings:notificationSettings];
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [PayPalCommerce didReceiveRemoteNotification:userInfo];
}

//use this if you're using a tab bar controller to present the PayPal Commerce store to your users
-(void)paypalCommerceRequestsVisibility{
    self.tabBarController.selectedIndex = 1;
}

// In order for Home Screen 3D Touch actions to work properly in iOS 9+ on supported devices:
-(void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    BOOL didPerformAction = [PayPalCommerce performActionForShortcutItem:shortcutItem];
    if(!didPerformAction){
        //if you added any custom 3D Touch shortcuts, you can handle them here
    }
    completionHandler(didPerformAction);
}

@end
