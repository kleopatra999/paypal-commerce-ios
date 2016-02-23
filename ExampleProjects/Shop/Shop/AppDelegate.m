//
//  AppDelegate.m
//  Shop
//
//  Created by Robert Haining on 10/26/15.
//  Copyright © 2015 Modest. All rights reserved.
//

#import "AppDelegate.h"
#import <ModestStoreSDK/ModestStoreSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //general app setup stuff
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    // the good stuff! let's configure modest!
    // we're defaulting to a sample store,
    // but you should replace these with your own credentials from commerce.paypal.com
#warning Please obfuscate the client id & secret before shipping. Thanks! paypal commerce
    NSString *clientId = @"lsY1JGW_Q_OvdS7jZ_418A";
    NSString *clientSecret = @"VgHSKq6uQdWehZH7sdoMbgPwIIzMqnRdS3mfXGF69FVw";
    
    if(!clientId || !clientSecret){
        [NSException raise:@"ModestException" format:@"Missing client id + secret"];
        return YES;
    }
    
    [ModestStoreSDK configureWithClientID:clientId clientSecret:clientSecret launchOptions:launchOptions];
    [ModestStoreSDK presentStoreApp];

    return YES;

}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    [ModestStoreSDK openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler {
    [ModestStoreSDK continueUserActivity:userActivity restorationHandler:restorationHandler];
    return YES;
}

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
