import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/api/model/home_model.dart';
import 'package:syflex_mealmatess_user/api/model/profilemodel.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';

class UserProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  VieProfileModel? vieProfileModel;
  loadingScreen() {
    cloading = !cloading;
    notifyListeners();
  }

  viewProfle() async {
    loadingScreen();
    var profile = await SyflexMealmatesRepository().viewProfile();
    vieProfileModel = VieProfileModel.fromJson(profile);
    loadingScreen();
  }
  // HomeModel? homeModel;
  // Profile_Resturant? profile_resturant;
  // ResturantAreaSelect? resturantAreaSelect;
  // ResturantCitySelect? resturantCitySelect;
  // ResturantPinSelect? resturantPinSelect;
  // Resturant_product_listt? resturantproducts;
  // GetSingleProductResturant? singleProduct;
  // userHomePage() async {
  //   var productslist = await SyflexMealmatesRepository().Allproduct();
  //   //print(productslist);
  //   homeModel = HomeModel.fromJson(productslist);

  //   isloading = false;
  //   notifyListeners();
  // }
}
