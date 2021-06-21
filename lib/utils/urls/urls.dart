class Urls {
  static const String DOMAIN = "https://dev.minbaladeh.world";
  static const String BASE_API = DOMAIN + "/api/";

  static const String CATEGORIES_API =
      BASE_API + 'categories/get-all-categories-with-child';
  static const String BRANDS_API = BASE_API + 'brands/get-all-brands';

  //HOME SCREEN
  static const String LATEST_ARRIVALS =
      BASE_API + 'products/homepage-products/4';
  static const String GOOD_FOOD_FROM_HOME =
      BASE_API + 'products/homepage-products/1';
  static const String GOOD_THINGS_FROM_HOME =
      BASE_API + 'products/homepage-products/2';
//TODO : change the id to 3 when back to main server
  static const String FRUITS_VEGETABLES =
      BASE_API + 'products/homepage-products/3';
  static const String HOME_BANNERS = BASE_API + 'panels/get-panels-by-group';

  //PRODUCTS
  static const String PRODUCTS = BASE_API + 'get-products';
  //Product details
  static const String PRODUCT_DETAILS =
      BASE_API + 'products/get-product-by-url/';

  //ORDER HISTORY
  static const String ORDERS_HISTORY = BASE_API + 'orders/get';
  static const String ORDER_DETAILS = BASE_API + 'orders/get-details/';

  //SOCIAL AUTH
  static const String SOCIAL_AUTH = BASE_API + 'members/social-signin';
  //Forgot Password
  static const String FORGOT_PASS = BASE_API + 'members/request-password';
  static const String SET_PASS = BASE_API + "members/set-password";

  //Contact us
  static const String CONTACT_US = BASE_API + 'contact-us-request';
  //CheckOrderStatus 

   static const String ORDER_STATUS = BASE_API + 'orders/check-order-paid/';
}
