import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/categoryProvider.dart';
import 'package:syflex_mealmatess_user/api/model/api_model.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/otp_verify_screen.dart';

class SineInWidget extends StatefulWidget {
  const SineInWidget({super.key});

  @override
  State<SineInWidget> createState() => _SineInWidgetState();
}

class _SineInWidgetState extends State<SineInWidget> {
  bool istrue = false;
  bool isinvalid = false;
  var number = TextEditingController();
  final dio = Dio();

  postApi() async {
    var provider = await Provider.of<ViewUserProvider>(context, listen: false);
    provider
        .loginToOtpprovider(phone: number.text.toString())
        .then((value) async {
      var phooneNumber = value["messages"]["status"]["contact_otp"];
      var otp = value["messages"]["status"]["login_otp"];
      if (value["error"]) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Please Enter a valid phone Number",
          style: TextStyle(color: Colors.red),
        )));
      } else {
        //    var provider =
        //     await Provider.of<ViewUserProvider>(context, listen: false);
        // provider.loginToOtpprovider(phone: phooneNumber.toString()).then((val) {
        //   loading = false;
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpVerification_screen(
                      phoneNumber: phooneNumber.toString(),
                      otp: otp.toString(),
                    )));
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Sign In",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Contact No",
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            Container(
                height: 50,
                margin: EdgeInsets.only(top: 5, bottom: 10),
                width: double.infinity,
                child: TextField(
                  autocorrect: true,
                  maxLines: 1,
                  controller: number,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        10), //n is maximum number of characters you want in textfield
                  ],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      // label: Text("Contact No"),
                      // floatingLabelBehavior: FloatingLabelBehavior.always,
                      // floatingLabelStyle: TextStyle(),
                      hintText: "9876543213",
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                      contentPadding: EdgeInsets.only(left: 25, bottom: 5),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                              style: BorderStyle.solid))),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 25),
          height: 50,
          width: double.infinity,
          child: Consumer<ViewUserProvider>(builder: (context, val, child) {
            return ElevatedButton(
                onPressed: () => val.cloading ? null : postApi(),
                child: val.cloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))));
          }),
        ),
        // Container(
        //   height: 50,
        //   alignment: Alignment.center,
        //   child: Text("Or"),
        // ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Container(
        //       height: 50,
        //       width: width * 4,
        //       decoration: BoxDecoration(
        //           border: Border.all(color: Colors.grey.shade500),
        //           borderRadius: BorderRadius.circular(10)),
        //       child: OutlinedButton.icon(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.all(Colors.white),
        //             shape: MaterialStateProperty.all(RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10))),
        //           ),

        //           // icon: ImageIcon(
        //           //   AssetImage("assets/image/google_icon.png"),
        //           //   size: 50,
        //           // ),
        //           icon: Image.asset(
        //             "assets/icon/google_icon.png",
        //             height: 30,
        //             width: 30,
        //           ),
        //           label: Text(
        //             "Google",
        //             style: TextStyle(color: Colors.black),
        //           )),
        //     ),
        //     SizedBox(
        //       height: 50,
        //       width: width * 4,
        //       child: OutlinedButton.icon(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //               backgroundColor: MaterialStateProperty.all(Colors.blue),
        //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(10)))),
        //           icon: Icon(
        //             Icons.facebook,
        //             color: Colors.white,
        //           ),
        //           label: Text(
        //             "Facebook",
        //             style: TextStyle(color: Colors.white),
        //           )),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
