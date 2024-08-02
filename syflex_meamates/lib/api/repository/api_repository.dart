import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_meamates/api/provider/post_api_helper.dart';
import 'package:syflex_meamates/api/static/api_url.dart';

class SyflexMealmatesRepository {
  //Future<LogiScreenModel>
  var Url = ApiUrl();
  static String baseUrl = ApiUrl().base_url;

  LoginWithPhoneOtp(String phone) async {
    String url = baseUrl + Url.verifyOtp;
    FormData formData = FormData.fromMap({
      'contact_no': phone.toString(),
    });
    var data;
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    await ApiHelper().PostApi(url, formData).then((value) async {
      // await prefs.setString(
      //     'user_id', value["messages"]["status"]["otp"].toString());
      // print(value["messages"]["status"][0]["contact_no"].toString());
      // await prefs.setString(
      //     'phone_no', phone.toString());
      data = value;
    });
    // data = await ApiHelper().PostApi(url, formData);

    // await prefs.setString(
    //     'user_id', data["messages"]["status"]["id"].toString());
    //print(data);
    return data;
  }

  deliveryboyLogProfile(String phone) async {
    String url = baseUrl + Url.loginPhone;
    String homeurl = baseUrl + Url.allOrderHomepage;
    FormData formData = FormData.fromMap({
      'contact_no': phone.toString(),
    });
    var data;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await ApiHelper().PostApi(url, formData).then((value) async {
      await prefs.setString(
          'user_id', value["messages"]["status"][0]["id"].toString());
      //print(value["messages"]["status"][0]["contact_no"].toString());
      await prefs.setString('phone_no', phone.toString());
      data = value;
    });
    // data = await ApiHelper().PostApi(url, formData);

    // await prefs.setString(
    //     'user_id', data["messages"]["status"]["id"].toString());
    // print(data);
    return data;
  }

  deliveryboyHomedetails(String phone) async {
    String url = baseUrl + Url.allOrderHomepage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');

    FormData formDatahome = FormData.fromMap({'user_id': userId});
    var data;
    await ApiHelper().PostApi(url, formDatahome).then((vaue) => data = vaue);
    return data;
  }

  deliveryboyOnOff(String offon) async {
    String url = baseUrl + Url.deliveryboyOnOff;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap(
        {'user_id': userId.toString(), 'off_on': offon.toString()});

    await ApiHelper().PostApi(url, formData);
  }

  deliveryLogDetails(String phone,String token) async {
    String url = baseUrl + Url.loginPhone;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'contact_no': phone.toString(),
      'accesstoken': token.toString()
    });
    var data;
    await ApiHelper().PostApi(url, formData).then((value) async {
      await prefs.setString(
          'user_id', value["messages"]["status"][0]["id"].toString());
      //print(value["messages"]["status"][0]["contact_no"].toString());
      await prefs.setString('phone_no', phone.toString());
      data = value;
    });
    return data;
  }

  updateDeliveryProfile(
      {full_name, e_mail, contact_number, altcontact_no, img}) async {
    String url = baseUrl + Url.deliveryboyupdateProfile;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    print(userId);
    FormData formData = FormData.fromMap({
      "user_id": userId, "full_name": full_name, "e_mail": e_mail,
      "contact_number": contact_number, "altcontact_no": altcontact_no, //img
    });
    await ApiHelper().PostApi(url, formData);
  }

  newOrdeerDeliveryboy({required String area}) async {
    String url = baseUrl + Url.deliveryboyneworderDtls;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      "user_id": userId,
      "area": "rasulgarh",
    });
    var data;
    await ApiHelper().PostApi(url, formData).then((value) => data = value);
    // print(data);
    return data;
  }

  deliveryboyOderStatusUpdate(
      {required String orderId, required String ststus}) async {
    String url = baseUrl + Url.deliveryboyorderstatusupdate;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap(
        {'user_id': userId.toString(), 'order_id': orderId, 'status': ststus});

    await ApiHelper().PostApi(url, formData);
  }

  allOrdeerDeliveryboy() async {
    String url = baseUrl + Url.allOrderDeliveryboy;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      "user_id": userId,
    });
    var data;
    await ApiHelper().PostApi(url, formData).then((value) => data = value);
    // print(data);
    return data;
  }

  vechicleDtlsUpdate(
      {required vehicle_no,
      required vehicle_type,
      required rc,
      required dl}) async {
    String url = baseUrl + Url.vehicleDtlsupdate;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId.toString(),
      'vehicle_no': vehicle_no,
      'vehicle_type': vehicle_type,
      'rc': await MultipartFile.fromFile(rc),
      'dl': await MultipartFile.fromFile(dl)
    });

    await ApiHelper().PostApi(url, formData);
  }

  DocumentDtlsUpdate({required adhar_font, required adharback}) async {
    String url = baseUrl + Url.deliveryboydocumentDtlsupdate;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = await prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId.toString(),
      'adhar_font': await MultipartFile.fromFile(adhar_font),
      'adharback': await MultipartFile.fromFile(adharback)
    });

    await ApiHelper().PostApi(url, formData);
  }
  // Future HomeScreen() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('user_id');
  //   String url = baseUrl + Url.loginPhone;
  //   String homeUrl = baseUrl + Url.AllOrder_home_page;
  //   FormData formDataHome = FormData.fromMap({
  //     'user_id':
  //         userId.toString(), //value["messages"]["status"]["id"].toString(),
  //   });
  //   var data = await ApiHelper().PostApi(homeUrl, formDataHome);

  //   //return getallOrder.fromJson(data);
  //   return data;
  // }
}
