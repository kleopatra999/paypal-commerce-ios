# URL Specs

You will need to use the PayPal Commerce URL scheme on all URLs. For example, if your app is "Acme", your URL scheme might be `pypl-acme://` (you can get your url scheme on the [Control Panel](https://commerce.paypal.com/sdk/ios).

## Product
Link directly to a product detail view.

**Canonical format: `/product/<str:product_linking_id>`**

E.g., to link to the product with a linking id `abcdef12345`: `pypl-acme://product/abcdef12345`

## Product Variant
Link directly to a product detail view, with a specific variant selected.

**Canonical format: `/product/variant/<str:product_variant_sku>`**

E.g., to link to a product variant with a SKU `tshirt-001-blue-xl`: `pypl-acme://product/variant/tshirt-001-blue-xl`

## Category

Link directly to a category view.  

**Canonical format: `/category/<str:fully_qualified_category_slug>`**

**Alternate format: `/category/<int:category_id>`**

E.g., to link to category with slug `tshirts`: `pypl-acme://category/tshirts`

## Search

Link directly to any search result - this accounts not only for the catch all `q` search type but specific facets as well such as `upc` or `name`.  

**Canonical format: `/search?<str:search_type>=<str:search_term>`**

E.g., to link to a search on the query `tshirt`: `pypl-acme://search?q=tshirt` 

or, to link to a search on the upc code `123456`: `pypl-acme://search?upc=123456`

