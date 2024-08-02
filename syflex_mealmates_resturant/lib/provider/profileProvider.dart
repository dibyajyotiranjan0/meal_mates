import 'package:flutter/material.dart';
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/model/profileResturant.dart';
import 'package:syflex_mealmates_resturant/model/resturant_area.dart';
import 'package:syflex_mealmates_resturant/model/resturant_city.dart';
import 'package:syflex_mealmates_resturant/model/resturant_pin.dart';

class ViewProfileResturantProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  Profile_Resturant? profile_resturant;
  ResturantAreaSelect? resturantAreaSelect;
  ResturantCitySelect? resturantCitySelect;
  ResturantPinSelect? resturantPinSelect;
  // Resturant_product_listt? resturantproducts;
  // GetSingleProductResturant? singleProduct;
  // getproduct() async {
  //   var productslist = await SyflexMealmatesRepository().Allproduct();
  //   //print(productslist);
  //   resturantproducts = Resturant_product_listt.fromJson(productslist);

  //   isloading = false;
  //   notifyListeners();
  // }

  viewProfileAndResturant() async {
    cloading = true;
    var productslist =
        await SyflexMealmatesRepository().vviewProfileResturant();
    // print(productslist);
    profile_resturant = Profile_Resturant.fromJson(productslist);
    // getCityName();
    // cloading = false;
    // isloading = false;
    notifyListeners();
  }

  updateProfieProvider(
      {user_id, full_name, e_mail, contact_number, altcontact_no, img}) async {
    cloading = true;
    await SyflexMealmatesRepository()
        .updateProfile(full_name, e_mail, contact_number, altcontact_no, img);
    viewProfileAndResturant();
    cloading = false;
    notifyListeners();
  }

  updateResturantProvider(
      {restaurant_name,
      restaurant_type,
      city_id,
      area_id,
      pin,
      address1}) async {
    cloading = true;
    await SyflexMealmatesRepository().updateResturant(
        restaurant_name, restaurant_type, city_id, area_id, pin, address1);
    viewProfileAndResturant();
    cloading = false;
    notifyListeners();
  }

  updateResturantDocumentProvider(
      {reg_num,
      gst,
      adhar_no,
      reg_proof,
      gst_img,
      adhar_font,
      adhar_back}) async {
    cloading = true;
    await SyflexMealmatesRepository().updateResturantDocument(
        reg_num, gst, adhar_no, reg_proof, gst_img, adhar_font, adhar_back);
    viewProfileAndResturant();
    cloading = false;
    notifyListeners();
  }

  getCityName() async {
    // cloading = true;
    var city = await SyflexMealmatesRepository().GetCityResturant();
    resturantCitySelect = ResturantCitySelect.fromJson(city);
    resturantCitySelect!.messages!.status!.allCity!
        .map((e) => print(e.toJson()));
    // viewProfileAndResturant();
    // cloading = false;
    notifyListeners();
  }

  getAreaName(city_id) async {
    cloading = true;
    var area = await SyflexMealmatesRepository().getAreaResturant(city_id);
    resturantAreaSelect = ResturantAreaSelect.fromJson(area);
    // getPinName(area_id)
    // viewProfileAndResturant();
    cloading = false;
    notifyListeners();
  }

  getPinName(area_id) async {
    cloading = true;
    var pin = await SyflexMealmatesRepository().getPinRersturant(area_id);
    resturantPinSelect = ResturantPinSelect.fromJson(pin);
    // viewProfileAndResturant();
    cloading = false;
    notifyListeners();
  }

  // getSingleProductStsUpdate(String product_id, String status) async {
  //   cloading = true;
  //   await SyflexMealmatesRepository().ProductStatusUpdate(product_id, status);
  //   getSingleproduct(product_id);
  //   // getproduct();
  //   cloading = false;
  //   notifyListeners();
  // }
}
