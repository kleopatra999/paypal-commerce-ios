# Barcode scanning (UPC + QR)

#### If your store supports UPC search, you can enable barcode & QR scanning
In the [Config plist](config.md), add `enable_barcode_scanning` set to `true`. In your app, you can ask `[ModestStoreSDK deviceSupportsBarcodeScanning]` to see if the device supports barcode scanning. If it does, you can trigger it directly from your app using `[ModestStoreSDK scanForBarcodes]`. This will present the scanning interface. If it finds any matches, it will present the product detail page, or if there were multiple matches, then a list of products.

If you want to use QR codes, please use this format:

- `http://m.example.com/search/ninja`
- `http://m.example.com/product/123456`
