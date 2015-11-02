# Facebook

If you would like to include Facebook login in your app, then you'll need to:

1. Set up Facebook on the Control Panel under [General Settings](https://panel.modest.com/stores/shawnimals/settings).
1. Add your Facebook App ID to your `Info.plist` using the key `FacebookAppID`.
1. Add the Facebook URL scheme to your `Info.plist`:
  1. In Xcode, select your Target.
  1. Under URL Types, add a new type (`+` button).
  1. In the URL Scheme field, enter the scheme provided by Facebook (e.g., `fb1234567890`).
1. Updates to `Info.plist`.
  1. Add or update the `LSApplicationQueriesSchemes` array. It should include `fbauth2`. For example:

	```
	<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>fbapi</string>
		<string>fb-messenger-api</string>
		<string>fbauth2</string>
		<string>fbshareextension</string>
	</array>
```  
  1. `NSAppTransportSecurity` allows us to securely communicate with Facebook in iOS 9+.
  
	```
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>cloudfront.net</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
			<key>facebook.com</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
			</dict>
			<key>fbcdn.net</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
			</dict>
			<key>akamaihd.net</key>
			<dict>
				<key>NSIncludesSubdomains</key>
				<true/>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
			</dict>
		</dict>
	</dict>
	```
