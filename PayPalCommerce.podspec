Pod::Spec.new do |s|

  s.name         = "PayPalCommerce"
  s.version      = "2.0.0-beta"
  s.summary      = "PayPal Commerce SDK"
  s.homepage     = "https://commerce.paypal.com/"

  s.description  = <<-DESC
                  This library will allow you to embed PayPal Commerce within your own iOS app.
                   DESC

  s.license = {
    "type" => "Commercial",
    "text" => <<-LICENSE
                    Copyright (c) 2009-2016 Braintree, a division of PayPal, Inc.

                    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

                    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

                    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

                    --

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

                    --

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


                    --

                    BCCKeychain
                    Created by Buzz Andersen on 10/20/08.
                    Based partly on code by Jonathan Wight, Jon Crosby, and Mike Malone.
                    Copyright 2013 Brooklyn Computer Club. All rights reserved.

                    Permission is hereby granted, free of charge, to any person
                    obtaining a copy of this software and associated documentation
                    files (the "Software"), to deal in the Software without
                    restriction, including without limitation the rights to use,
                    copy, modify, merge, publish, distribute, sublicense, and/or sell
                    copies of the Software, and to permit persons to whom the
                    Software is furnished to do so, subject to the following
                    conditions:

                    The above copyright notice and this permission notice shall be
                    included in all copies or substantial portions of the Software.

                    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
                    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
                    OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
                    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
                    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
                    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
                    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
                    OTHER DEALINGS IN THE SOFTWARE.


                 LICENSE
  }

  s.author  = { "PayPal, Inc" => "commerce-sdk@getbraintree.com" }
  
  s.platform = :ios, "8.0"

  s.requires_arc    = true
  
  s.source       = { :git => "https://github.com/braintree/paypal-commerce-ios.git", :tag => "2.0.0-beta" }

  s.source_files    = "PayPalCommerce/*.h"
  s.public_header_files = "PayPalCommerce/*.h"
  s.preserve_paths  = "PayPalCommerce/*.a"
  s.xcconfig        =  { 'OTHER_LDFLAGS' => '-all_load', 'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/PayPalCommerce/PayPalCommerce' }
  s.library         = 'PayPalCommerce'

  s.resource_bundle = { 'PayPalCommerceResources' => 'PayPalCommerce/PayPalCommerceResources/*' }

  s.weak_frameworks = "PassKit", "WebKit";

  s.dependency "Mantle", "~> 1.5"
  s.dependency "AFNetworking", "~> 2.6"
  s.dependency "FBSDKLoginKit", '~> 4.6'
  s.dependency "CGLMail", "~> 0.1.0"
  s.dependency 'GoogleAnalytics', '~> 3.1'
  s.dependency 'ECSlidingViewController', '~> 2.0'
  s.dependency 'libPhoneNumber-iOS', '~> 0.8'
  s.dependency 'LogglyLogger-CocoaLumberjack', '~> 2.0'
  s.dependency 'Braintree/Core', '~> 4.0'
  s.dependency 'Braintree/Card', '~> 4.0'
  s.dependency 'Braintree/PayPalOneTouch', '~> 4.0'
  s.dependency 'CardIO', '~> 5.0'

end
