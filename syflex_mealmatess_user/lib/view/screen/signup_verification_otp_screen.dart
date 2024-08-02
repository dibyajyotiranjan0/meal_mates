import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/categoryProvider.dart';
import 'package:syflex_mealmatess_user/api/model/api_model.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/Home/home_page_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/bottom_nav/bottom_navigation_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/sinin_scree.dart';
import 'package:syflex_mealmatess_user/view/screen/sinin_scree.dart';

class SignUp_Otp_verification_screen extends StatefulWidget {
  String phoneNumber;
  String otp;
  String fname;
  SignUp_Otp_verification_screen(
      {required this.phoneNumber,
      required this.otp,
      required this.fname,
      super.key});

  @override
  State<SignUp_Otp_verification_screen> createState() =>
      _SignUp_Otp_verification_screenState();
}

class _SignUp_Otp_verification_screenState
    extends State<SignUp_Otp_verification_screen> {
  OtpFieldController otpController = OtpFieldController();
  bool otpCorrect = false;
  String validOtp = "";

  var modl = LogiScreenModel();
  @override
  void initState() {
    modl;
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void gotoHome() async {
    _timer.cancel();
    var provider = await Provider.of<ViewUserProvider>(context, listen: false);
    if (widget.otp.toString() == validOtp.toString()) {
      await provider
          .userSignupWithOtp(number: widget.phoneNumber, name: widget.fname)
          .then((value) => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "This is invalid otp please enter a correct otp",
        style: TextStyle(color: Colors.red),
      )));
    }
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) {
    //     return Container(
    //       alignment: Alignment.center,
    //       height: 100,
    //       width: 100,
    //       color: Colors.transparent,
    //       child: Center(
    //         child: CircularProgressIndicator(
    //           color: Colors.white,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  late Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.pop(context);
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            _timer.cancel();
            Navigator.pop(context);
            setState(() {});
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FittedBox(
                        fit: BoxFit.none,
                        child: Text(
                          "OTP Verification",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    Text("we has send the code to the nuber"),
                    Text("+91 ${widget.phoneNumber}"),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 10, bottom: 20, right: 10),
                child: OTPTextField(
                  controller: otpController,
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  onChanged: (pin) {
                    validOtp = pin;
                    // print("Changed: " + pin);
                  },
                  // onCompleted: (pin) {

                  //   setState(() {});
                  // }
                ),
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     SizedBox(
              //         height: 50,
              //         width: 50,
              //         child: TextField(
              //           maxLength: 1,
              //           textAlign: TextAlign.center,
              //           keyboardType: TextInputType.number,
              //           style: TextStyle(
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black),
              //           cursorColor: Colors.transparent,
              //           cursorWidth: 0,
              //           decoration: InputDecoration(
              //               counterText: "",
              //               fillColor: Colors.grey[200],
              //               border: InputBorder.none,
              //               contentPadding: EdgeInsets.only(bottom: 5),
              //               filled: true,
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Colors.redAccent,
              //                       width: 2.0,
              //                       style: BorderStyle.solid),
              //                   borderRadius: BorderRadius.circular(5))),
              //         )),
              //     SizedBox(
              //         height: 50,
              //         width: 50,
              //         child: TextField(
              //           maxLength: 1,
              //           textAlign: TextAlign.center,
              //           keyboardType: TextInputType.number,
              //           cursorColor: Colors.transparent,
              //           cursorWidth: 0,
              //           style: TextStyle(
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black),
              //           decoration: InputDecoration(
              //               counterText: "",
              //               fillColor: Colors.grey[200],
              //               contentPadding: EdgeInsets.only(bottom: 5),
              //               filled: true,
              //               border: InputBorder.none,
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Colors.redAccent,
              //                       width: 2.0,
              //                       style: BorderStyle.solid),
              //                   borderRadius: BorderRadius.circular(5))),
              //         )),
              //     SizedBox(
              //         height: 50,
              //         width: 50,
              //         child: TextField(
              //           textAlign: TextAlign.center,
              //           cursorColor: Colors.transparent,
              //           cursorWidth: 0,
              //           maxLength: 1,
              //           keyboardType: TextInputType.number,
              //           style: TextStyle(
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black),
              //           decoration: InputDecoration(
              //               border: InputBorder.none,
              //               fillColor: Colors.grey[200],
              //               contentPadding: EdgeInsets.only(bottom: 5),
              //               filled: true,
              //               counterText: "",
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Colors.redAccent,
              //                       width: 2.0,
              //                       style: BorderStyle.solid),
              //                   borderRadius: BorderRadius.circular(5))),
              //         )),
              //     SizedBox(
              //         height: 50,
              //         width: 50,
              //         child: TextField(
              //           textAlign: TextAlign.center,
              //           cursorColor: Colors.transparent,
              //           cursorWidth: 0,
              //           maxLength: 1,
              //           keyboardType: TextInputType.number,
              //           style: TextStyle(
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black),
              //           decoration: InputDecoration(
              //               border: InputBorder.none,
              //               fillColor: Colors.grey[200],
              //               contentPadding: EdgeInsets.only(bottom: 5),
              //               filled: true,
              //               counterText: "",
              //               focusedBorder: OutlineInputBorder(
              //                   borderSide: BorderSide(
              //                       color: Colors.redAccent,
              //                       width: 2.0,
              //                       style: BorderStyle.solid),
              //                   borderRadius: BorderRadius.circular(5))),
              //         )),
              //   ],
              // ),

              //),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Consumer<ViewUserProvider>(
                      builder: (context, val, child) {
                    return ElevatedButton(
                      onPressed: () => gotoHome(),
                      child: val.cloading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              "Verify",
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            otpCorrect ? Colors.green : Colors.green.shade400),
                      ),
                    );
                  })),
              SizedBox(
                height: 30,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Resend code in '),
                    TextSpan(
                      text: '00:${_start}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
