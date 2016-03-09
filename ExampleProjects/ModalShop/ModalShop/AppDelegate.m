//
//  AppDelegate.m
//  ModalShop
//
//  Created by Robert Haining on 7/27/15.
//  Copyright (c) 2015 Modest. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <ModestStoreSDK/ModestStoreSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //general app setup stuff
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.window setRootViewController:navigationController];
    
    
    
    // the good stuff! let's configure modest!
    // we're defaulting to a sample store,
    // but you should replace these with your own credentials from commerce.paypal.com
#warning Please obfuscate the client id & secret before shipping. Thanks! -paypal commerce
    NSString *clientId = @"iMqZE6a0RYCG1eQQJcIyLw";
    NSString *clientSecret = @"SksO9FxCQXSHT4ZqXTk7UgWUY3lN6HSYe5wmyRfmC5pg";
    
    if(!clientId || !clientSecret){
        [NSException raise:@"ModestException" format:@"Missing client id + secret"];
        return YES;
    }
    
    [ModestStoreSDK configureWithClientID:clientId clientSecret:clientSecret launchOptions:launchOptions];
    
#warning Please configure Apple Pay if you would like to enable it for your customers.
    /**
     Make sure to
     1. Setup Apple Pay in the Apple Developer Member Center.
     2. Add your merchant ID to your project.
     3. Configure your Apple Pay merchant ID here.
     */
//    NSString *applePayMerchantID = @"";
//    [ModestStoreSDK configureApplePayMerchantID:applePayMerchantID];
    
    return YES;

}


// This lets our login system function properly.
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [ModestStoreSDK openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}

// This lets Spotlight Search open the shop to the correct product.
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler {
    [ModestStoreSDK continueUserActivity:userActivity restorationHandler:restorationHandler];
    return YES;
}

// If you want Modest to be able to send push notifications to your app, we'll need the following methods.
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [ModestStoreSDK didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    [ModestStoreSDK didFailToRegisterForRemoteNotificationsWithError:error];
}
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    [ModestStoreSDK didRegisterUserNotificationSettings:notificationSettings];
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [ModestStoreSDK didReceiveRemoteNotification:userInfo];
}

// In order for Home Screen 3D Touch actions to work properly in iOS 9+ on supported devices:
-(void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler{
    BOOL didPerformAction = [ModestStoreSDK performActionForShortcutItem:shortcutItem];
    if(!didPerformAction){
        //if you added any custom 3D Touch shortcuts, you can handle them here
    }
    completionHandler(didPerformAction);
}

@end
