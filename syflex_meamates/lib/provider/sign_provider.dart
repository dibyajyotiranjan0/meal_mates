import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_meamates/api/repository/api_repository.dart';
import 'package:syflex_meamates/model/userlog_profile.dart';

class signProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  UserLogDetails? userLogDetails;
  // Resturant_product_listt? resturantproducts;
  // ResturantLogin? resturantLogin;
  cvalueTrueFalse() {
    cloading = !cloading;
    notifyListeners();
  }

  DeliveryBoyLoginWithPhone(String number) async {
    cvalueTrueFalse();

    var bht = await SyflexMealmatesRepository().LoginWithPhoneOtp(number);

    // print(bht);
    bht;
    cvalueTrueFalse();
    notifyListeners();
    return bht;
  }

  deliveryBoyLoginProfile(String number, String token) async {
    cvalueTrueFalse();
    var deliveryboyLogin =
        await SyflexMealmatesRepository().deliveryLogDetails(number, token);
    // print(deliveryboyLogin);
    userLogDetails = await UserLogDetails.fromJson(deliveryboyLogin);
    // print(resturantLogin!.messages!.status?[0].toJson());
    // print(userLogDetails!.toJson());
    return cvalueTrueFalse();
    // notifyListeners();
  }

  deliveryBoyoffon(String offon) async {
    cvalueTrueFalse();
    // cloading = true;
    await SyflexMealmatesRepository().deliveryboyOnOff(offon);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var phoneNo = prefs.getString('phone_no');
    var tokenId = prefs.getString('token_id');
    // print(phoneNo);
    if (phoneNo != null) {
      await deliveryBoyLoginProfile(phoneNo, tokenId ?? "");
    }
    return cvalueTrueFalse();
    // cloading = false;
    // notifyListeners();

    // print(resturnat_login);
    // userLogDetails = await UserLogDetails.fromJson(deliveryboyLogin);
    // print(resturantLogin!.messages!.status?[0].toJson());
  }

  deliveryBoyUpdateProfile({
    full_name,
    e_mail,
    contact_number,
    altcontact_no,
  }) async {
    cvalueTrueFalse();

    await SyflexMealmatesRepository().updateDeliveryProfile(
      full_name: full_name,
      e_mail: e_mail,
      contact_number: contact_number,
      altcontact_no: altcontact_no,
    );

    // print(bht);
    // bht;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var phoneNo = prefs.getString('phone_no');
    var tokenId = prefs.getString('token_id');
    deliveryBoyLoginProfile(phoneNo!, tokenId ?? "");
    cvalueTrueFalse();
    notifyListeners();
    // return bht;
  }

  vechicleDtlsUpdate(
      {required vehicle_no,
      required vehicle_type,
      required rc,
      required dl}) async {
    await SyflexMealmatesRepository().vechicleDtlsUpdate(
        vehicle_no: vehicle_no, vehicle_type: vehicle_type, rc: rc, dl: dl);

    // print(bht);
    // bht;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var phoneNo = prefs.getString('phone_no');
    var tokenId = prefs.getString('token_id');
    deliveryBoyLoginProfile(phoneNo!, tokenId ?? "");
    notifyListeners();
    // return bht;
  }

  docmentDtlsUpdate({required adhar_font, required adharback}) async {
    await SyflexMealmatesRepository()
        .DocumentDtlsUpdate(adhar_font: adhar_font, adharback: adharback);

    // print(bht);
    // bht;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var phoneNo = prefs.getString('phone_no');
    var tokenId = prefs.getString('token_id');
    deliveryBoyLoginProfile(phoneNo!, tokenId ?? "");
    notifyListeners();
    // return bht;
  }
  // onOffStsUpdate(String status) async {
  //   cloading = true;
  //   // print("calling To sts update");
  //   await SyflexMealmatesRepository().OnOffStsUpdate(status);
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var phoneNo = prefs.getString('phone_no');
  //   print(phoneNo);
  //   if (phoneNo != null) {
  //     await ResturantLoginWithPhone(phoneNo);
  //   }

  //   cloading = false;
  //   // print("You can end your stsupdate");
  //   // notifyListeners();
  // }

  // EditResturantProduct(String status) async {
  //   await SyflexMealmatesRepository().OnOffStsUpdate(status);
  //   ResturantLoginWithPhone("9874563214");
  //   notifyListeners();
  // }
}
