import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; //it need enable for verymuch used
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/model/resturant_login.dart';
import 'package:syflex_mealmates_resturant/model/resturant_product_mdel.dart';

class OffOnstsProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  Resturant_product_listt? resturantproducts;
  ResturantLogin? resturantLogin;
  ResturantLoginWithPhone(String number, String tocon) async {
    cloading = true;
    var resturnat_login =
        await SyflexMealmatesRepository().LoginWithPhone(number, tocon);
    print(resturnat_login);
    resturantLogin = await ResturantLogin.fromJson(resturnat_login);
    // print(resturantLogin!.messages!.status?[0].toJson());
    cloading = false;
    notifyListeners();
  }

  onOffStsUpdate(String status) async {
    cloading = true;
    // print("calling To sts update");
    await SyflexMealmatesRepository().OnOffStsUpdate(status);
    final SharedPreferences prefs =
        await SharedPreferences.getInstance(); //it used verymuch
    var phoneNo = prefs.getString('phone_no');
    var deviceTokon = prefs.getString('device_tocon');
    // print(phoneNo);
    if (phoneNo != null) {
      await ResturantLoginWithPhone(phoneNo, deviceTokon ?? "");
    }

    cloading = false;
    // print("You can end your stsupdate");
    // notifyListeners();
  }

  EditResturantProduct(String status) async {
    await SyflexMealmatesRepository().OnOffStsUpdate(status);
    final SharedPreferences prefs =
        await SharedPreferences.getInstance(); //it used verymuch
    var phoneNo = prefs.getString('phone_no');

    var deviceTokon = prefs.getString('device_tocon');
    ResturantLoginWithPhone(phoneNo!, deviceTokon ?? "");
    notifyListeners();
  }
}
