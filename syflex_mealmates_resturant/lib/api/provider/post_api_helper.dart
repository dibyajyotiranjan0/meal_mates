import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:syflex_mealmates_resturant/api/provider/exception.dart';

class ApiHelper {
  final dio = Dio();
  // var base_url = ApiUrl().base_url;
  Future<dynamic> PostApi(String urll, FormData formData) async {
    late var jsonResponse;
    try {
      FormData formDataapi = formData;
      Response response = await dio.post(urll,
          data: formDataapi,
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            "Accept": "*/*",
            "Connection": "keep-alive"
          }));
      //print(response.statusCode);
      jsonResponse = checkREsponse(response);
    } catch (e) {
      print("Ths is wrong api call  ${e}");
    }
    return jsonResponse;
  }

  Future<dynamic> GetApi(
    String urll,
  ) async {
    late var jsonResponse;
    try {
      // FormData formDataapi = formData;
      Response response = await dio.get(urll);
      // Response response = await dio.get(urll,
      //     data: formDataapi,
      //     options: Options(headers: {
      //       "Content-Type": "multipart/form-data",
      //       "Accept": "*/*",
      //       "Connection": "keep-alive"
      //     }));
      //print(response.statusCode);
      jsonResponse = checkREsponse(response);
    } catch (e) {
      print("Ths is wrong api call  ${e}");
    }
    return jsonResponse;
  }

  dynamic checkREsponse(Response response) {
    // print(response.statusCode);
    if (response.statusCode == 200) {
      return response.data;
      //print(data);
    } else if (response.statusCode == 400) {
      return BadRequestException(response.data.toString());
    } else {
      return FetchDataException(
          "Error Occured while communicate the server with status code: ${response.statusCode}");
    }
  }
}
