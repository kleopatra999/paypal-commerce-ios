Pod::Spec.new do |s|

  s.name         = "ModestStoreSDK"
  s.version      = "1.10-beta"
  s.summary      = "PayPal Commerce SDK"
  s.homepage     = "https://commerce.paypal.com/"

  s.description  = <<-DESC
                  This library will allow you to embed PayPal Commerce within your own iOS app.
                   DESC

  s.license = {
    "type" => "Commercial",
    "text" => <<-LICENSE
                  Copyright © 2016 PayPal, Inc.
                  All rights reserved.

                    PaymentKit from Stripe

                    The MIT License

                    Copyright (c) 2013- Stripe, Inc. (https://stripe.com)

                    Permission is hereby granted, free of charge, to any person obtaining a copy
                    of this software and associated documentation files (the "Software"), to deal
                    in the Software without restriction, including without limitation the rights
                    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
                    copies of the Software, and to permit persons to whom the Software is
                    furnished to do so, subject to the following conditions:

                    The above copyright notice and this permission notice shall be included in
                    all copies or substantial portions of the Software.

                    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
                    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
                    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
                    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
                    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
                    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
                    THE SOFTWARE.

CHTCollectionViewWaterfallLayout
Copyright (c) 2012 Nelson Tai <chiahsien@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


                 LICENSE
  }

  s.author  = { "PayPal, Inc" => "commerce-sdk@getbraintree.com" }
  
  s.platform = :ios, "7.0"

  s.requires_arc    = true
  
  s.subspec 'Core' do |ss|
    ss.source       = { :git => "git@github.com:braintree/paypal-commerce-ios.git", :tag => "1.9" }

    ss.source_files    = "ModestStoreSDK/*.h"
    ss.public_header_files = "ModestStoreSDK/*.h"
    ss.preserve_paths  = "ModestStoreSDK/*.a"
    ss.xcconfig        =  { 'OTHER_LDFLAGS' => '-all_load', 'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/ModestStoreSDK/ModestStoreSDK' }
    ss.library         = 'ModestStoreSDK'

    ss.resource_bundle = { 'ModestResources' => 'ModestStoreSDK/ModestResources/*' }

    ss.weak_frameworks = "PassKit", "WebKit";

    ss.dependency "Mantle", "~> 1.5"
    ss.dependency "AFNetworking", "~> 2.6"
    ss.dependency "FBSDKLoginKit", '~> 4.6'
    ss.dependency "CGLMail", "~> 0.1.0"
    ss.dependency 'GoogleAnalytics', '~> 3.1'
    ss.dependency 'PayPal-iOS-SDK', '~> 2.12.0'
    ss.dependency 'ECSlidingViewController', '~> 2.0'
    ss.dependency 'libPhoneNumber-iOS', '~> 0.8'
    ss.dependency 'LogglyLogger-CocoaLumberjack', '~> 2.0'
    ss.dependency 'Braintree/Core', '~> 4.0'
    ss.dependency 'Braintree/Card', '~> 4.0'
  end

  s.default_subspecs = 'Core'

end
