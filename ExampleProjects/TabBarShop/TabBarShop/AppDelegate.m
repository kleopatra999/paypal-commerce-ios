//
//  AppDelegate.m
//  TabBarShop
//
//  Created by Robert Haining on 7/27/15.
//  Copyright (c) 2015 Modest. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <ModestStoreSDK/ModestStoreSDK.h>

@interface AppDelegate () <ModestStoreDelegate> 
@property (nonatomic, readonly) UITabBarController *tabBarController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    //general app setup stuff
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    
    ViewController *viewController = [[ViewController alloc] init];
    //News icon by iconsmind.com from the Noun Project
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"News" image:[UIImage imageNamed:@"news"] tag:0];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBar.barTintColor = [UIColor blackColor];
    navigationController.navigationBar.tintColor = [UIColor colorWithRed:218/255.0 green:168/255.0 blue:216/255.0 alpha:1];
    navigationController.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] };
    
    UIViewController *modestViewController = [ModestStoreSDK modestRootViewController];
    //dollar icon by Luboš Volkov from the Noun Project
    modestViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Store" image:[UIImage imageNamed:@"dollar"] tag:1];

    _tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[navigationController, modestViewController];
    [self.window setRootViewController:self.tabBarController];
    
    
    
    // the good stuff! let's configure modest!
    // we're defaulting to a sample store,
    // but you should replace these with your own credentials from panel.modest.com
#warning Please obfuscate the client id & secret before shipping. Thanks! –modest
    NSString *clientId = @"9mclWAIlTRKemRLrfMlsyg";
    NSString *clientSecret = @"-FekZqjxRLWrIhIIib1MVQaqu3gAdATWarVFCmiQ8VdA";
    
    if(!clientId || !clientSecret){
        [NSException raise:@"ModestException" format:@"Missing client id + secret"];
        return YES;
    }
    
    [ModestStoreSDK setDelegate:self];
    [ModestStoreSDK configureWithClientID:clientId clientSecret:clientSecret launchOptions:launchOptions];
    
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

//use this if you're using a tab bar controller to present the Modest Store to your users
-(void)modestStoreShouldBeVisible{
    self.tabBarController.selectedIndex = 1;
}

@end
