# Launch Checklist

There is a lot you can do in the PayPal Commerce iOS SDK. This doc is provided as a way for you to make sure you're ready for the basics.


## Required for basic functionality
- [ ] Add the PayPal Commerce SDK to your project, either via [CocoaPods](../README.md#quick-installation) or [direct download](installation.md).
   - *This allows your users to access your shop in your app.*
   
- [ ] Ensure you are referencing [acknowledgements.md somewhere](../ModestStoreSDK/Modest-Acknowledgements.md). 
   * *Several libraries that we use require attribution in your app.*
   
- [ ] [Configure the SDK in your app delegate](../README.md#add-modeststoresdk-to-your-app-delegate).
   * *This lets PayPal Commerce know which store to show in your app.*
   * **Please be sure to obfuscate your `client id` and `secret`.**
   
- [ ] [Setup the custom url scheme](../README.md#custom-url-scheme-for-user-login).
   * *This is needed to allow our email login system to work for your users. Also, it enables deep-linking to products and categories.*
   
- [ ] [Present the shop](../README.md#present-the-store), either modally or via a tab bar controller.
   * *To show the shop to your users.*

- [ ] [Spotlight Search Index](../README.md#ios-9-spotlight-search-indexing).
   * *So products found via iOS 9 search will open the app in the correct place.*

- [ ] [Info.plist Updates](../README.md#infoplist-updates).
   * *So we can securely communicate with Cloudfront and Facebook and PayPal.*



### Optional, but highly recommended
- [ ] [Enable push notifications](../README.md#push-notification-support).
   * *This lets you broadcast notifications to your users and deep-link them to products and categories.*
   
- [ ] If you want to enable Facebook login, then [set that up](facebook.md).
   * *A quicker authentication mechanism than email.*
   


#### Totally optional
- [ ] [Add a product card to your app](product_cards.md).
   * *This lets you promote products in other parts of your app.*
   
- [ ] [Enable barcode UPC and QR code scanning](barcode.md).
   * *Your users can easily scan, find, and re-purchase products they already have at home or in your brick and mortar store.*




## Special note if you have multiple apps
If you are building multiple iOS apps that will interact with one PayPal Commerce store, then you'll need to setup multiple OAuth clients. This is necessary to keep our email verification system functional. In the PayPal Commerce Panel, there's a section called `Advanced`, and under that is `iOS SDK` ([commerce.paypal.com/channels/ios/sdk](https://commerce.paypal.com/channels/ios/sdk)). There you will see your primary OAuth client, as well as a space to add more. Each will provide you with your PayPal Commerce URL scheme, as well as its own `client id` and `secret`. Checkout [Configuring the Client](../README.md#configure-the-client) for more on where to put those items.
