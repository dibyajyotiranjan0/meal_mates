import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmates_resturant/api/provider/post_api_helper.dart';
import 'package:syflex_mealmates_resturant/api/static/api_url.dart';
import 'package:syflex_mealmates_resturant/home_screen.dart';
import 'package:syflex_mealmates_resturant/model/resturant_category_mode.dart';
import 'package:syflex_mealmates_resturant/signin_screen.dart';

class SyflexMealmatesRepository {
  //Future<LogiScreenModel>
  var Url = ApiUrl();
  static String baseUrl = ApiUrl().base_url;

  LoginWithPhone(String phone, String tocon) async {
    String url = baseUrl + Url.loginPhone;
    FormData formData = FormData.fromMap(
        {'contact_no': phone.toString(), 'accesstoken': tocon});
    var data;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await ApiHelper().PostApi(url, formData).then((value) async {
      await prefs.setString(
          'user_id', value["messages"]["status"][0]["id"].toString());
      // print(value["messages"]["status"][0]["contact_no"].toString());
      await prefs.setString(
          'phone_no', value["messages"]["status"][0]["contact_no"].toString());
      await prefs.setString(
          'area_id', value["messages"]["status"][0]["accesstoken"].toString());

      data = value;
    });
    // data = await ApiHelper().PostApi(url, formData);

    // await prefs.setString(
    //     'user_id', data["messages"]["status"]["id"].toString());

    return data;
  }

  Future HomeScreen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    String url = baseUrl + Url.loginPhone;
    String homeUrl = baseUrl + Url.AllOrder_home_page;
    FormData formDataHome = FormData.fromMap({
      'user_id':
          userId.toString(), //value["messages"]["status"]["id"].toString(),
    });
    var data = await ApiHelper().PostApi(homeUrl, formDataHome);

    //return getallOrder.fromJson(data);
    return data;
  }

  Future Singleorderdetails(String orderId) async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = baseUrl + Url.single_order_details;
    FormData formDataHome = FormData.fromMap({
      'order_id':
          orderId.toString(), //value["messages"]["status"]["id"].toString(),
    });
    var data = await ApiHelper().PostApi(url, formDataHome);

    // await prefs.setString(
    //     'user_id', data["messages"]["status"]["id"].toString());
    //return getallOrder.fromJson(data);
    return data;
  }

  OrderStatusUpdate(String order_id, String status) async {
    String url = baseUrl + Url.orderstatusupdate;
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? areaId = await prefs.getString('area_id');
    FormData formData = FormData.fromMap({
      'order_id': order_id.toString(),
      'status': status.toString(),
      'area_id': areaId ?? ""
    });
    var data = await ApiHelper().PostApi(url, formData);
    return data;
  }

  OnOffStsUpdate(String offOn) async {
    String url = baseUrl + Url.resturantoffon;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId.toString(),
      'off_on': offOn.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  ProductStatusUpdate(String product_id, String status) async {
    String url = baseUrl + Url.productstatusupdate;
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData formData = FormData.fromMap({
      'product_id': product_id.toString(),
      'status': status.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);
    return data;
  }

  GetSingleProduct(String product_id) async {
    String url = baseUrl + Url.getSingleproduct;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'product_id': product_id.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);
    return data;
  }

  Allproduct() async {
    String url = baseUrl + Url.product_list;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  Addproduct(String product_name) async {
    String url = baseUrl + Url.resturantAddProdct;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId.toString(),
      "product_name": product_name.toString()
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  editproduct() async {
    String url = baseUrl + Url.resturanteditProdct;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': userId.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  allCategory() async {
    String url = baseUrl + Url.resturantcategory;
    var data = await ApiHelper().GetApi(url);
    // print(data);
    return data;
  }

  ResturantEditProduct(
      {productid,
      restaurant_id,
      product_name,
      description,
      productType,
      food_type,
      pro_cat,
      saleperprice,
      regperprice,
      imgPath}) async {
    String url = baseUrl + Url.resturanteditProdct;
    FormData formData = FormData.fromMap({
      "productid": productid.toString(),
      "restaurant_id": restaurant_id.toString(),
      "product_name": product_name.toString(),
      "description": description.toString(),
      "productType": "0",
      "food_type": food_type.toString(),
      "pro_cat": pro_cat.toString(),
      "regperprice": regperprice.toString(),
      "saleperprice": saleperprice.toString(),
      "img": imgPath,
      //  images
    });
    try {
      var data = await ApiHelper().PostApi(url, formData);
      // print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  verifywithPhoone(String phone) async {
    String url = baseUrl + Url.verifyOtp;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    FormData formData = FormData.fromMap({'contact_no': phone.toString()});
    var data = await ApiHelper().PostApi(url, formData);
    print(data);
    return data;
  }

  vviewProfileResturant() async {
    String url = baseUrl + Url.viewrestaurantprofile;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': user_id.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  updateProfile(fullName, email, contact, altContact, img) async {
    String url = baseUrl + Url.updateProfile;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': user_id.toString(),
      'full_name': fullName,
      'e_mail': email,
      'contact_number': contact,
      'altcontact_no': altContact,
      'img': img
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  updateResturant(
      restaurant_name, restaurant_type, city_id, area_id, pin, address1) async {
    String url = baseUrl + Url.updateProfile;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': user_id.toString(),
      restaurant_name: restaurant_name,
      restaurant_type: restaurant_type,
      city_id: city_id,
      area_id: area_id,
      pin: pin,
      address1: address1
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  updateResturantDocument(reg_num, gst, adhar_no, reg_proof, gst_img,
      adhar_font, adhar_back) async {
    String url = baseUrl + Url.updateProfile;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'user_id': user_id.toString(),
      reg_num: reg_num,
      gst: gst,
      adhar_no: adhar_no,
      reg_proof: reg_proof,
      gst_img: gst_img,
      adhar_font: adhar_font,
      adhar_back: adhar_back
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  GetCityResturant() async {
    String url = baseUrl + Url.city;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({});
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  getAreaResturant(city_id) async {
    String url = baseUrl + Url.area;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'city_id': city_id.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }

  getPinRersturant(area_id) async {
    String url = baseUrl + Url.pin;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? user_id = prefs.getString('user_id');
    FormData formData = FormData.fromMap({
      'area_id': area_id.toString(),
    });
    var data = await ApiHelper().PostApi(url, formData);

    return data;
  }
}
