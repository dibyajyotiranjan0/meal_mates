import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_meamates/provider/sign_provider.dart';
import 'package:syflex_meamates/screen/Signup/documents_al.dart';
import 'package:syflex_meamates/screen/otp_verify_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final number = TextEditingController();
  Sign(String number) async {
    if (number != "" && number.length == 10) {
      var provider = await Provider.of<signProvider>(context, listen: false);
      provider.DeliveryBoyLoginWithPhone(number).then((v) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpVerification_screen(
                      value: v,
                      phone: number,
                    )));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter a valid Phone Number"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    var width = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: height * 10.0,
          // width: width * 10,
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 3,
                  width: width * 8,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    "assets/image/mealmates.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
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
                            style: TextStyle(
                                fontSize: 38, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Enter Contact No",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  // label: Text("Contact No"),
                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                  // floatingLabelStyle: TextStyle(),
                                  hintText: "8658888234",
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 14),
                                  contentPadding:
                                      EdgeInsets.only(left: 25, bottom: 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2))),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      height: 50,
                      width: double.infinity,
                      child: Consumer<signProvider>(
                          builder: (context, valu, child) {
                        return ElevatedButton(
                            onPressed: () => valu.cloading
                                ? null
                                : Sign(number.text.toString()),
                            child: valu.cloading
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
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))));
                      }),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Text("Not Yet a Member? "),
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => DocumentsAll()));
                    //         },
                    //         child: Text("Sign Up"))
                    //   ],
                    // )
                    // Container(
                    //   height: 50,
                    //   alignment: Alignment.center,
                    //   child: Text("Or"),
                    // ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     SizedBox(
                    //       height: 50,
                    //       width: width * 4,
                    //       child: OutlinedButton.icon(
                    //           onPressed: () {},
                    //           style: ButtonStyle(
                    //               backgroundColor:
                    //                   MaterialStateProperty.all(Colors.white),
                    //               shape: MaterialStateProperty.all(
                    //                   RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(10)))),

                    //           // icon: ImageIcon(
                    //           //   AssetImage("assets/image/google_icon.png"),
                    //           //   size: 50,
                    //           // ),
                    //           icon: Image.asset(
                    //             "assets/image/google_icon.png",
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
                    //               backgroundColor:
                    //                   MaterialStateProperty.all(Colors.blue),
                    //               shape: MaterialStateProperty.all(
                    //                   RoundedRectangleBorder(
                    //                       borderRadius:
                    //                           BorderRadius.circular(10)))),
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
                ),
              ]),
        ),
      ),
    );
  }
}
