# Initial Theming + Configuration

Most of these values will be overridden by what you have set up in the [Theming section](https://commerce.paypal.com/settings/theme) of the PayPal Commerce Panel, but by including the `Modest-Config.plist` & `Modest-Assets.xcassets`, you can include an initial setup. 

This is optional.

### Modest-Config.plist

- `skip_initial_onboarding`: 
  - `NO`: The store will initially present an onboarding flow including: login, name, email, shipping address, & billing info.  The user will still be allowed to skip this & go directly to your store.
  - `YES`: The store will skip initial onboarding & present the products list immediately. If a user tries to purchase something without having fully onboarded, we'll present the rest of onboarding to them at that point.
- `font`: A dictionary of font names based on weight (default is system font):
  - `regular_font`
  - `thin_font`
  - `light_font`
  - `medium_font`
  - `bold_font`
- `enable_barcode_scanning`: BOOL that allows the app to scan barcodes & QR codes. 
- `colors`: A dictionary of colors we use in the app. Colors are denoted as hex values (e.g, “#0FA0FA”). They will be dynamically updated based on the settings in your theme in the [Control Panel](https://commerce.paypal.com/settings/theme).
	   1. `primary_button_color`: Onboarding button background, “continue shopping” buttons.
	   1. `accent_color`: Used in product detail, variant selection, receipts, etc as a way to highlight certain elements.
	   1. `buy_button_color`: Buy button background color.
	   1. `header_background_color`: Navigation bar background color.
	   1. `header_action_color`: The color of the buttons in the navigation bar.
	   1. `category_background_color`: The background color of the category selection bar.
	   1. `banner_color`: The background color of the header banner in the receipt.
	   1. `modal_color`: The background color of the sidebar menu, as well as modal overlays.
	   1. `checkmark_color`: The checkmark color across the app.


### Modest-Assets.xcassets

These will be overridden by what you set in the Control Panel.

- `login_background`: Used in the onboarding login prompt screen. (Required size: 320x568 & 640x1136)
- `logo_header`: Used in the navigation bar on the main products list. (Suggested size: 167x30 & 328x60)
