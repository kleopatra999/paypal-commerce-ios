#### ModestStoreDelegate

There are currently two cases where you might want to set the `ModestStoreDelegate`:

1. If you present the store modally, and you would like to be notified when the store is dismissed by the user. Then after you configure the client, call:
```objc
[ModestStoreSDK setDelegate:self];
```
And then implement one or both of these protocol methods:
```
-(void)modestStoreWillDismissWithTransitionDuration:(NSTimeInterval)transitionDuration;
-(void)modestStoreDidDismiss;
```

2. If you present the store within a tab bar controller or other such embedded system, and you have custom buttons to trigger purchases, then you’re responsible for displaying the store. After you configure the client, call:
```objc
[ModestStoreSDK setDelegate:self];
```
And then implement this protocol method:
```objc
-(void)modestStoreShouldBeVisible;
```
Within that call, make sure the store is visible. For example, if you have embedded the store within a tab bar controller, you would make sure the store’s view controller is the `selectedViewController`.
