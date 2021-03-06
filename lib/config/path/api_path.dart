class ApiPath {
  ///auth
  static const startHome = "/app/home/start?string=";
  static const signin = "/app/home/signup";
  static const login = "/app/home/login";
  static const getUser = "/app/user/get-user";
  static const updateUser = "/api/v2/auth/user/update";
  static const resetPass = "/api/v2/auth/password/reset";
  static const changePassIsLogin = "/app/user/change-password";

  /// question
  static const addQuestion = "/app/question/add-question";
  static const getQuestion = "/app/home/get-question";
  static const getAnswer="/app/question/get-question-detail";
  /// Wallet
  static const getWallet="/app/wallet/wallet";
  static const getWalletHistory="/app/wallet/my-history";

  ///answer
  static const addAnswer = "/app/question/add-answer";
  static const reportAnswer="/app/question/report-answer";

  ///address
  static const getProvinces = "/api/v2/provinces";
  static const getDistricts = "/api/v2/districts-by-province/";
  static const getWards = "/api/v2/wards-by-district/";
  static const getAddress = "/api/v2/address";
  static const createAddress = "/api/v2/address/create";
  static const updateAddress = "/api/v2/address/edit/";
  static const deleteAddress = "/api/v2/address/delete/";

  ///tranpost
  static const checkPrice = "/api/v2/order/fee";
  static const createOrder = "/api/v2/order/create";
  static const listOrder = "/api/v2/order";
  static const detailOrder = "/api/v2/order/";
  static const updateOrder = "/api/v2/order/update/";
  static const updateAddressOrder = "/api/v2/order/update-address/";
  static const cancelOrder = "/api/v2/order/cancel/";
  static const reportOrder = "/api/v2/order/report";
  static const createBank = "/api/v2/customer-bank/create";
  static const listBank = "/api/v2/customer-bank";
  static const bankName = "/api/v2/bank";

  //banner
  static const listBanner = "/app/home/get-banner";

  /// category
  static const listCategory = "/app/home/get-productcat-showhome";
  static const charity = "/app/home/total-charity";

  /// product
  static const listProduct = "/app/product/get-products";
  static const wishProduct = "/app/user/wish-product";
  static const flashSale = "/blockcheck/getdata/get-data-home";
  static const productcat = "/app/home/get-productcat-showhome2product";
  static const detailProduct = "/app/product/data-page-detail-product";

  /// notifi
  static const listNotifi = "/app/user/get-notifycations";
}
