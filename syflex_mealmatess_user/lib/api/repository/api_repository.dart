import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syflex_mealmatess_user/api/model/api_model.dart';
import 'package:syflex_mealmatess_user/api/provider/post_api_helper.dart';
import 'package:syflex_mealmatess_user/api/static/api_url.dart';
import 'package:syflex_mealmatess_user/view/screen/bottom_nav/bottom_navigation_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/otp_verify_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmatess_user/view/screen/sinin_scree.dart';

class SyflexMealmatesRepository {
  GetStarted(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = await prefs.getString('user_id');
    // print(userID);
    userID == null
        ? Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()))
        : HomePage_Open(
                //value["messages"]["status"]["user_id"].toString()
                )
            .then((val) => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Bottom_NavScreen())));
  }

  //Future<LogiScreenModel>
  var Url = ApiUrl();
  static String baseUrl = ApiUrl().base_url;
  loginWithOtp(String phone) async {
    String url = baseUrl + Url.loginPhone;
    FormData formData = FormData.fromMap({
      'contact': phone.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);
    // print(data["status"]);
    return data;
  }

  stooredefaultAddress(address) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("address", jsonEncode(address ?? ""));

    return defaultaddress();
  }

  defaultaddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var defailtAddressData = jsonDecode(prefs.getString('address').toString());

    return defailtAddressData;
  }

  verifyWithOtp(String phone, String token) async {
    String url = baseUrl + Url.verifyOtp;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData formData = FormData.fromMap(
        {'contact': phone.toString(), 'accesstoken': token.toString()});
    var data = await ApiHelper().PostApi(url, formData);
    await prefs.setString(
        'user_id', data["messages"]["status"]["user_id"].toString());
    await prefs.setString('token_id', token.toString());
    // return data;
    // return HomePage_Open();
  }

  userrSaveDatabase({required String phone, required String name}) async {
    try {
      String url = baseUrl + Url.registerDbt;
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      FormData formData = FormData.fromMap({
        'contact': phone.toString(),
        'name': name.toString(),
      });
      var data = await ApiHelper().PostApi(url, formData);
      // await prefs.setString('user_id', data["messages"]["user_id"].toString());

      return data;
    } catch (e) {}
  }

  HomePage_Open() async {
    String url = baseUrl + Url.user_home;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
    });
    var data = await ApiHelper().PostApi(url, formData);
    return data;
  }

  SignupAccount(String phone, String fullName) async {
    String url = baseUrl + Url.register;
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData formData = FormData.fromMap(
        {'contact': phone.toString(), 'name': fullName.toString()});
    var data = await ApiHelper().PostApi(url, formData);
    // await prefs.setString(
    //     'user_id', data["messages"]["status"]["user_id"].toString());

    return data;
  }

  GetCategryProduct(String cat_id) async {
    String url = baseUrl + Url.getproductCatid;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString("user_id");
    FormData formData = FormData.fromMap({'user_id': userId, 'cat_id': cat_id});
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  addToCartProduct(product_id, qty, variation_id, restaurant_id) async {
    String url = baseUrl + Url.addtotoCart;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'product_id': product_id,
      'qty': qty,
      'variation_id': variation_id,
      'restaurant_id': restaurant_id
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  myCart() async {
    String url = baseUrl + Url.viewCart;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  myCartItemDedlet(String cart_id) async {
    String url = baseUrl + Url.removeCart;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = await prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'cart_id': cart_id,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  checkOutOrderSucess(
      {required String addressID,
      required String cuponCode,
      required String cuponPrice,
      required String paymentMode}) async {
    String url = baseUrl + Url.checkoutOrder;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString("user_id");
    // print(userId);
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'cupon_code': cuponCode,
      'cupon_price': cuponPrice,
      'paymentmode': paymentMode,
      'address_id': addressID
    });
    var data = await ApiHelper().PostApi(url, formData);
    return data;
  }

  checkOutOrder(
      {required cupon_code,
      required cupon_price,
      required paymentmode,
      required address_id}) async {
    String url = "https://collegeprojectz.com/mealmate/API/checkout";
    FormData formData = FormData.fromMap({
      'user_id': "3",
      cupon_code: '', //cupon_code,
      cupon_price: '', //cupon_code,
      paymentmode: '', //paymentmode,
      address_id: "80"
    });
    // print("Urlget");
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = await prefs.getString("user_id");
    // print(userId);
    // FormData formData = FormData.fromMap({
    //   'user_id': userId,
    //   cupon_code: '', //cupon_code,
    //   cupon_price: '', //cupon_code,
    //   paymentmode: '', //paymentmode,
    //   address_id: address_id
    // });
    var data = await ApiHelper().PostApi(url, formData);
    // print(data);

    return data;
  }

  addAddress(firstname, lasttname, address1, address2, city, area, zip, email,
      phone) async {
    String url = baseUrl + Url.addAddress;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'firstname': firstname,
      'lasttname': lasttname,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': area,
      'zip': zip,
      'email': email,
      'phone': phone
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  updateAddress(addressid, firstname, lasttname, address1, address2, city, area,
      zip, email, phone) async {
    String url = baseUrl + Url.udateAddress;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'address_id': addressid,
      'firstname': firstname,
      'lasttname': lasttname,
      'address1': address1,
      'address2': address2,
      'city': city,
      'state': area,
      'zip': zip,
      'email': email,
      'phone': phone
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  applyCoupon(String coupon) async {
    String url = baseUrl + Url.applyCoupon;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'coupon_code': coupon,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  deliveryAllLocationAddaddress() async {
    String url = baseUrl + Url.alladdress;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  deliveryLocationAddaddress(String coupon) async {
    String url = baseUrl + Url.addAddress;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'coupon_code': coupon,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  singleResturantFoodItem(String restaurant_id) async {
    String url = baseUrl + Url.getSingleRestaurantItem;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'restaurant_id': restaurant_id,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  deliverylocationupdateAddress(String coupon) async {
    String url = baseUrl + Url.udateAddress;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'coupon_code': coupon,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  getLocationData() async {
    String url = baseUrl + Url.getLocationData;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = prefs.getString("user_id");
    // FormData formData = FormData.fromMap({
    //   'user_id': userId,
    //   'coupon_code': coupon,
    // });
    var data = await ApiHelper().PostApi(url, FormData());

    return data;
  }

  getAllOrderRepo() async {
    String url = baseUrl + Url.getAllOrderdetails;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  viewProfile() async {
    String url = baseUrl + Url.viewProfile;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("user_id");
    FormData formData = FormData.fromMap({
      'user_id': userId,
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }
}
