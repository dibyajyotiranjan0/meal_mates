import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmatess_user/api/model/all_address-model.dart';
import 'package:syflex_mealmatess_user/api/model/category_model.dart';
import 'package:syflex_mealmatess_user/api/model/home_model.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';

import '../api/model/login_otp_model.dart';
import '../api/model/mycart_model.dart';

class CheckoutOrderProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  Map? defailtAddressData;
  AllAddressModel? allAddressModel;
  UserHomeModel? userHomeModel;
  Map? CuponCode;
  int cartItemPrice = 0;
  int deliveryFee = 100;
  int discountPrice = 0;
  int total = 0;
  String? addressIdUserprovider;
  // ResturantCitySelect? resturantCitySelect;
  // ResturantPinSelect? resturantPinSelect;
  // Resturant_product_listt? resturantproducts;
  // GetSingleProductResturant? singleProduct;
  GetHomeProvider() async {
    cloading = true;
    var itemList = await SyflexMealmatesRepository().HomePage_Open();
    userHomeModel = await UserHomeModel.fromJson(itemList);

    cloading = false;
    notifyListeners();
  }

  allAddress() async {
    cloading = true;
    var itemList =
        await SyflexMealmatesRepository().deliveryAllLocationAddaddress();
    //print(productslist);
    allAddressModel = AllAddressModel.fromJson(itemList);

    cloading = false;
    notifyListeners();
  }

  addressDetails(address, {required cartItem}) async {
    cloading = true;

    defailtAddressData =
        await SyflexMealmatesRepository().stooredefaultAddress(address);
    //print(productslist);
    // myCartModel = MyCartModel.fromJson(itemList);
    // viewCartItem();

    defaultaddress(cartItem: cartItem);
    cloading = false;
    //;
    notifyListeners();
  }

  checkOutOrderProvider(
      {required address_id,
      required cuponCode,
      required cuponPrice,
      required paymentMode}) async {
    cloading = true;

    await SyflexMealmatesRepository().checkOutOrderSucess(
        addressID: address_id,
        cuponCode: cuponCode,
        cuponPrice: cuponPrice,
        paymentMode: paymentMode);
    //print(productslist);
    // allAddressModel = AllAddressModel.fromJson(itemList);

    cloading = false;
    notifyListeners();
  }

  defaultaddress({required cartItem}) async {
    cloading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    defailtAddressData = jsonDecode(prefs.getString('address').toString());
    addressIdUserprovider = await defailtAddressData!["address_id"];
    priceCalculate(cartItem: cartItem);
    cloading = false;
    notifyListeners();
  }

  CuponCodeStore(pin, {required cartItem}) async {
    cloading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("pincode", jsonEncode(pin ?? ""));
    cuponCodeShows(cartItem: cartItem);
    cloading = false;
    notifyListeners();
  }

  cuponCodeShows({required cartItem}) async {
    cloading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    CuponCode = jsonDecode(prefs.getString('pincode').toString());
    if (CuponCode != null && CuponCode!.isNotEmpty) {
      discountPrice = int.parse(await CuponCode!["cupon_price"]);
      // cuponCde = await CuponCode!["cupon_code"];
    } else {
      discountPrice = 0;
    }
    priceCalculate(cartItem: cartItem);
    cloading = false;
    notifyListeners();
  }

  addAddress(
      {required firstname,
      required lasttname,
      required address1,
      required address2,
      required city,
      required area,
      required zip,
      required email,
      required phone}) async {
    cloading = true;
    await SyflexMealmatesRepository().addAddress(firstname, lasttname, address1,
        address2, city, area, zip, email, phone);
    //print(productslist);
    // myCartModel = MyCartModel.fromJson(itemList);
    //viewCartItem();
    allAddress();
    cloading = false;
    notifyListeners();
  }

  updateAddress(
      {required address_id,
      required firstname,
      required lasttname,
      required address1,
      required address2,
      required city,
      required area,
      required zip,
      required email,
      required phone}) async {
    cloading = true;
    await SyflexMealmatesRepository().updateAddress(address_id, firstname,
        lasttname, address1, address2, city, area, zip, email, phone);
    //print(productslist);
    // myCartModel = MyCartModel.fromJson(itemList);
    //viewCartItem();
    allAddress();
    cloading = false;
    notifyListeners();
  }

  priceCalculate({required cartItem}) {
    cloading = true;
    if (cartItem != null) {
      cartItemPrice = 0;

      for (var i = 0; i < cartItem.length; i++) {
        var pr =
            int.parse(cartItem[i].salesPrice!) * int.parse(cartItem[i].qty!);
        cartItemPrice = cartItemPrice + pr;
      }
    }

    total = cartItemPrice + deliveryFee - discountPrice;
    cloading = false;
    notifyListeners();
    // setState(() {});
  }
}
