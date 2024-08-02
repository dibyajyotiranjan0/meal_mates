import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/categoryProvider.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/static/custom_color.dart';
import 'package:syflex_mealmatess_user/view/screen/otp_verify_screen.dart';
import 'package:syflex_mealmatess_user/view/screen/sinin_scree.dart';

import 'signup_verification_otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final number = TextEditingController();
  final fname = TextEditingController();
  List<String> _locations = ['+91', '+1', '+92', '+0'];
  var _selectedLocation = "+91";
  signup() async {
    var provider = await Provider.of<ViewUserProvider>(context, listen: false);
    number.text.toString().length == 10 && fname != ""
        ? provider
            .userSignup(
                number: number.text.toString(), name: fname.text.toString())
            .then((val) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUp_Otp_verification_screen(
                        phoneNumber: number.text.toString(),
                        otp: val["messages"]["status"]["otp"].toString(),
                        fname: fname.text.toString()))))
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
            "Please Enter Your name and phoone nuber correctly",
            style: TextStyle(color: Colors.red),
          )));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    var width = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSelect.white,
        leading: InkWell(
          onTap: () {
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
        padding: EdgeInsets.only(top: 20, left: 18, right: 18, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Let's Create Account",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Text(
                      "Please enter your mobile number and we sent to 4 digit code your phone number",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        // height: 50,
                        margin: EdgeInsets.only(top: 25, bottom: 25),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              child: TextField(
                                autocorrect: true,
                                maxLines: 1,
                                controller: fname,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    // label: Text("Contact No"),
                                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                                    // floatingLabelStyle: TextStyle(),
                                    hintText: "Enter your name",
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    prefixIcon: SizedBox(
                                      height: 50,
                                      width: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.grey,
                                              size: 40,
                                            ),
                                          ),
                                          Container(
                                            height: 35,
                                            color: Colors.grey.shade500,
                                            width: 1,
                                          )
                                        ],
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontSize: 17),
                                    contentPadding:
                                        EdgeInsets.only(left: 25, bottom: 5),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 50,
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                decoration: InputDecoration(
                                    // label: Text("Contact No"),
                                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                                    // floatingLabelStyle: TextStyle(),
                                    hintText: "Enter Phone number",
                                    fillColor: Colors.grey.shade300,
                                    filled: true,
                                    prefixIcon: SizedBox(
                                      height: 50,
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 70,
                                            alignment: Alignment.center,
                                            child: DropdownButton(
                                              elevation: 16,
                                              padding: EdgeInsets.only(
                                                  right: 1, left: 0),
                                              underline: const SizedBox(),
                                              isDense: true,
                                              alignment: Alignment.centerRight,
                                              hint: _selectedLocation == null
                                                  ? Text('Dropdown')
                                                  : Text(
                                                      _selectedLocation,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 19),
                                                    ),
                                              // isExpanded: true,
                                              // iconSize: 30.0,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              items: _locations.map(
                                                (val) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: val,
                                                    child: Center(
                                                        child: Text(val)),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (val) {
                                                setState(
                                                  () {
                                                    _selectedLocation = val!;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey.shade600,
                                            height: 35,
                                            width: 1,
                                          )
                                          //Divider()
                                        ],
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.black54, fontSize: 17),
                                    contentPadding:
                                        EdgeInsets.only(left: 25, bottom: 5),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 50,
                  width: double.infinity,
                  child: Consumer<ViewUserProvider>(
                      builder: (context, val, child) {
                    return ElevatedButton(
                        onPressed: () => val.cloading ? null : signup(),
                        child: val.cloading
                            ? Center(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Text(
                                "Sign Up",
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
                                    borderRadius: BorderRadius.circular(25)))));
                  }),
                ),

                // Padding(
                //   padding: EdgeInsets.only(top: 50, bottom: 50),
                //   child: Row(children: <Widget>[
                //     Expanded(
                //       child: new Container(
                //           margin:
                //               const EdgeInsets.only(left: 10.0, right: 10.0),
                //           child: Divider(
                //             color: Colors.black,
                //             height: 36,
                //           )),
                //     ),
                //     Text("Or Continue with"),
                //     Expanded(
                //       child: new Container(
                //           margin:
                //               const EdgeInsets.only(left: 10.0, right: 10.0),
                //           child: Divider(
                //             color: Colors.black,
                //             height: 36,
                //           )),
                //     ),
                //   ]),
                // ),

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 60,
                //       width: width * 4,
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.grey.shade500),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: OutlinedButton.icon(
                //           onPressed: () {},
                //           style: ButtonStyle(
                //             backgroundColor:
                //                 MaterialStateProperty.all(Colors.white),
                //             shape: MaterialStateProperty.all(
                //                 RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(10))),
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
                //             style: TextStyle(color: Colors.black, fontSize: 18),
                //           )),
                //     ),
                //     SizedBox(
                //       height: 60,
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
                //             style: TextStyle(color: Colors.white, fontSize: 18),
                //           )),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Alreay havee a account? ",
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Signin",
                          style:
                              TextStyle(color: Colors.pinkAccent, fontSize: 18),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
