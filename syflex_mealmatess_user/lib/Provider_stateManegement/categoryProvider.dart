import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/api/model/category_model.dart';
import 'package:syflex_mealmatess_user/api/model/getAllOrder_screen.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';

import '../api/model/login_otp_model.dart';
import '../api/model/mycart_model.dart';

class ViewUserProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  GetCategoryModel? categoryModel;
  MyCartModel? myCartModel;
  LoginOtpModel? loginOtpModel;
  GetAllOrderModel? getAllOrderModel;
  // ResturantAreaSelect? resturantAreaSelect;
  // ResturantCitySelect? resturantCitySelect;
  // ResturantPinSelect? resturantPinSelect;
  // Resturant_product_listt? resturantproducts;
  // GetSingleProductResturant? singleProduct;
  loadingircle() {
    cloading = !cloading;
    notifyListeners();
  }

  userlogin({required String phone, required String token}) async {
    loadingircle();
    var logPhone = await SyflexMealmatesRepository()
        .verifyWithOtp(phone.toString(), token.toString());
    loadingircle();
    return logPhone;
  }

  loginToOtpprovider({required String phone}) async {
    loadingircle();
    var logiinOtp = await SyflexMealmatesRepository().loginWithOtp(phone);
    //print(productslist);
    // loginOtpModel = LoginOtpModel.fromJson(logiinOtp);
    //viewCartItem();

    loadingircle();
    return logiinOtp;
    // notifyListeners();
  }

  verifywithOTPAndGetHome(
      {required String phone, required String token}) async {
    loadingircle();
    var logiinOtpHome =
        await SyflexMealmatesRepository().verifyWithOtp(phone, token);
    loadingircle();
    return logiinOtpHome;
  }

  userSignup({
    required String number,
    required String name,
  }) async {
    loadingircle();
    var signupUser = await SyflexMealmatesRepository()
        .SignupAccount(number.toString(), name.toString());
    loadingircle();
    return signupUser;
  }

  userSignupWithOtp({
    required String number,
    required String name,
  }) async {
    loadingircle();
    var signupUser = await SyflexMealmatesRepository()
        .userrSaveDatabase(phone: number, name: name);
    loadingircle();
    return signupUser;
  }

  categoryProvider(String cat_id) async {
    var productslist =
        await SyflexMealmatesRepository().GetCategryProduct(cat_id);
    //print(productslist);
    categoryModel = GetCategoryModel.fromJson(productslist);

    isloading = false;
    notifyListeners();
  }

  addToCartItem({product_id, qty, variation_id, restaurant_id}) async {
    cloading = true;
    await SyflexMealmatesRepository()
        .addToCartProduct(product_id, qty, variation_id, restaurant_id);
    //print(productslist);
    // categoryModel = GetCategoryModel.fromJson(productslist);

    cloading = false;
    notifyListeners();
  }

  viewCartItem() async {
    cloading = true;
    var itemList = await SyflexMealmatesRepository().myCart();
    //print(productslist);
    myCartModel = MyCartModel.fromJson(itemList);

    cloading = false;
    notifyListeners();
  }

  removeCartItem({required String cart_item}) async {
    cloading = true;
    await SyflexMealmatesRepository().myCartItemDedlet(cart_item);
    //print(productslist);
    // myCartModel = MyCartModel.fromJson(itemList);
    viewCartItem();

    cloading = false;
    notifyListeners();
  }

  getAllOrderPrvider() async {
    cloading = true;
    var orderlist = await SyflexMealmatesRepository().getAllOrderRepo();
    //print(productslist);
    // // myCartModel = MyCartModel.fromJson(itemList);
    // viewCartItem();
    getAllOrderModel = GetAllOrderModel.fromJson(orderlist);

    cloading = false;
    notifyListeners();
  }
}
