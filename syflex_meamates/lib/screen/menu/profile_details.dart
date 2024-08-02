import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/sign_provider.dart';

class ProfileDetails extends StatefulWidget {
  // UserLogDetails profile;
  // ProfileDetails({required this.profile, super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  TextEditingController fullname = TextEditingController();
  // TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoone = TextEditingController();
  TextEditingController altPhone = TextEditingController();
  TextEditingController image = TextEditingController();
  GlobalKey<FormState> formKey = new GlobalKey();

  int index = 0;
  @override
  void initState() {
    // TODO: implement initState

    var provider = Provider.of<signProvider>(context, listen: false);
    provider.deliveryBoyLoginProfile;

    // address2 = TextEditingController(text: widget.address["adress2"]);
    // cityName = widget.address["cityname"];
    // areaName = widget.address["cityname"];
    // pincode = widget.address["pincode"];
    super.initState();
  }

  Validate(input) {
    if (input.isEmpty) {
      return 'Please type something';
    }
    return null;
  }

  submitForm(formkey) {
    final formState = formKey.currentState;
    if (formState!.validate()) {
      // if (cityName != null && areaName != null && pincode != null) {
      final provider = Provider.of<signProvider>(context, listen: false);
      provider.deliveryBoyUpdateProfile(
        full_name: fullname.text.toString(),
        e_mail: email.text.toString(),
        contact_number: phoone.text.toString(),
        altcontact_no: altPhone.text.toString(), //img
        // address_id: widget.address["address_id"],
        // firstname: fname.text.toString(),
        // lasttname: lname.text.toString(),
        // address1: address1.text.toString(),
        // address2: address2.text.toString(),
        // city: cityName,
        // area: areaName,
        // zip: pincode,
        // email: email.text.toString(),
        // phone: phoone.text.toString()
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Address Sucesfully updated",
        style: TextStyle(color: Colors.green),
      )));
      // Navigator.pop(context);
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text(
      //     "Please Select Cityname Area Name and PinCode",
      //     style: TextStyle(color: Colors.red),
      //   )));
      // }

      // formState.save();

      // then do something
    } else {
      print("Sorry");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 35,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Profile Details",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Consumer<signProvider>(builder: (context, val, chid) {
          fullname = TextEditingController(
              text: val.userLogDetails!.messages!.status![0].fullName);
          // lname = TextEditingController(text: widget.address["last_name"]);
          email = TextEditingController(
              text: val.userLogDetails!.messages!.status![0].email);
          phoone = TextEditingController(
              text: val.userLogDetails!.messages!.status![0].contactNo
                  .toString());
          altPhone = TextEditingController(
              text: val.userLogDetails!.messages!.status![0].alterCnum
                  .toString());
          return Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: TextFormField(
                          controller: fullname,
                          validator: (input) => Validate(input),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              hintText: "Enter name",
                              fillColor: Colors.grey.shade300,
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black),
                              isDense: true,
                              // constraints:
                              //     const BoxConstraints(maxHeight: 70, minHeight: 55),
                              // contentPadding:
                              //     EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Expanded(
                    //   child: SizedBox(
                    //     height: 80,
                    //     child: TextFormField(
                    //       controller: lname,
                    //       validator: (input) => Validate(input),
                    //       style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold),
                    //       decoration: InputDecoration(
                    //           hintText: "Enter Second Name",
                    //           fillColor: Colors.grey.shade300,
                    //           filled: true,
                    //           labelStyle: TextStyle(color: Colors.black),
                    //           isDense: true,
                    //           // constraints:
                    //           //     const BoxConstraints(maxHeight: 70, minHeight: 55),
                    //           // contentPadding:
                    //           //     EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    //           errorBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide: BorderSide(color: Colors.red)),
                    //           focusedBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide:
                    //                   BorderSide(color: Colors.transparent)),
                    //           enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide:
                    //                   BorderSide(color: Colors.transparent)),
                    //           border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10),
                    //               borderSide:
                    //                   BorderSide(color: Colors.transparent))),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) => Validate(input),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: "Enter Email Id",
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(bottom: 5, left: 20),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    controller: phoone,
                    keyboardType: TextInputType.phone,
                    validator: (input) => Validate(input),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: "Enter Phone number",
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(bottom: 5, left: 20),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
                // Consumer<FoodItemProvider>(builder: (context, valu, child) {
                //   return Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         height: 50,
                //         // width: 200,
                //         alignment: Alignment.center,
                //         padding: EdgeInsets.only(left: 20, right: 20),

                //         decoration: BoxDecoration(
                //             color: Colors.grey.shade300,
                //             borderRadius: BorderRadius.circular(10)),
                //         child: valu.getAllLocationModel != null
                //             ? DropdownButton(
                //                 elevation: 16,
                //                 padding: EdgeInsets.only(
                //                   right: 1,
                //                   left: 0,
                //                 ),
                //                 underline: const SizedBox(),
                //                 isDense: true,

                //                 hint: cityName != null
                //                     ? Text("${cityName}")
                //                     : Text("choose City"),
                //                 isExpanded: true,
                //                 //iconSize: 30.0,
                //                 style: TextStyle(
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20),
                //                 items: valu.getAllLocationModel!.messages!.status!
                //                     .allCity!
                //                     .map(
                //                   (val) {
                //                     return DropdownMenuItem(
                //                       alignment: Alignment.centerLeft,
                //                       value: val,
                //                       child: Text("${val.cityName}"),
                //                     );
                //                   },
                //                 ).toList(),
                //                 onChanged: (val) {
                //                   setState(
                //                     () {
                //                       cityValue = AllCity.fromJson(val!.toJson());
                //                       cityName = val!.cityName;
                //                     },
                //                   );
                //                 },
                //               )
                //             : SizedBox(),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       cityValue != null && cityValue!.areas!.length != 0
                //           ? Container(
                //               height: 50,
                //               // width: 200,
                //               alignment: Alignment.center,
                //               padding: EdgeInsets.only(left: 20, right: 20),

                //               decoration: BoxDecoration(
                //                   color: Colors.grey.shade300,
                //                   borderRadius: BorderRadius.circular(10)),
                //               child: DropdownButton(
                //                 elevation: 16,
                //                 padding: EdgeInsets.only(
                //                   right: 1,
                //                   left: 0,
                //                 ),
                //                 underline: const SizedBox(),
                //                 isDense: true,

                //                 hint: areaName != null
                //                     ? Text("${areaName}")
                //                     : Text("Choosee Area"),
                //                 isExpanded: true,
                //                 //iconSize: 30.0,
                //                 style: TextStyle(
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 20),
                //                 items: cityValue!.areas!.map(
                //                   (val) {
                //                     return DropdownMenuItem(
                //                       alignment: Alignment.centerLeft,
                //                       value: val,
                //                       child: Text("${val.areaname}"),
                //                     );
                //                   },
                //                 ).toList(),
                //                 onChanged: (val) {
                //                   setState(
                //                     () {
                //                       areaValue = Areas.fromJson(val!.toJson());
                //                       areaName = val!.areaname;
                //                       // index = 0;
                //                       // areaName = val!;
                //                     },
                //                   );
                //                 },
                //               ),
                //             )
                //           : SizedBox(),
                //       SizedBox(
                //         height: 20,
                //       ),
                //       areaValue != null && areaValue!.pinCodes!.length != 0
                //           ? Container(
                //               height: 50,
                //               alignment: Alignment.center,
                //               padding: EdgeInsets.only(left: 20, right: 20),
                //               decoration: BoxDecoration(
                //                   color: Colors.grey.shade300,
                //                   borderRadius: BorderRadius.circular(10)),
                //               child: areaValue != null &&
                //                       areaValue!.pinCodes!.length != 0
                //                   ? DropdownButton(
                //                       elevation: 16,
                //                       padding: EdgeInsets.only(
                //                         right: 1,
                //                         left: 0,
                //                       ),
                //                       underline: const SizedBox(),
                //                       isDense: true,

                //                       hint: pincode != null
                //                           ? Text("${pincode}")
                //                           : Text("Choosee pincode"),
                //                       isExpanded: true,
                //                       //iconSize: 30.0,
                //                       style: TextStyle(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 20),
                //                       items: areaValue!.pinCodes!.map(
                //                         (val) {
                //                           return DropdownMenuItem(
                //                             alignment: Alignment.centerLeft,
                //                             value: val,
                //                             child: Text("${val.pincode}"),
                //                           );
                //                         },
                //                       ).toList(),
                //                       onChanged: (val) {
                //                         setState(
                //                           () {
                //                             pincode = val!.pincode;
                //                             // index = 0;
                //                             // _selectedLocation = val!;
                //                           },
                //                         );
                //                       },
                //                     )
                //                   : SizedBox(),
                //             )
                //           : SizedBox(),
                //     ],
                //   );
                // }),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  child: TextFormField(
                    controller: altPhone,
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                    validator: (input) => Validate(input),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: "Enter Secondary contact",
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding: EdgeInsets.only(bottom: 5, left: 20),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(
                //   height: 80,
                //   child: TextFormField(
                //     controller: altPhone,
                //     validator: (input) => Validate(input),
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold),
                //     decoration: InputDecoration(
                //         hintText: "Enter Secondary Address",
                //         fillColor: Colors.grey.shade300,
                //         filled: true,
                //         labelStyle: TextStyle(color: Colors.black),
                //         contentPadding: EdgeInsets.only(bottom: 5, left: 20),
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(color: Colors.transparent)),
                //         enabledBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(color: Colors.transparent)),
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(color: Colors.transparent))),
                //   ),
                // ),

                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor:
                                MaterialStateProperty.all(Colors.pinkAccent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35)))),
                        onPressed: () => submitForm(formKey),
                        child: Text("Update Profile",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all(
                                Colors.pinkAccent.withOpacity(0.4)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)))),
                        onPressed: () => Navigator.pop(context),
                        child: Text("cancel",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)))),
              ],
            ),
          );
        }),
      ),
    );
  }
}
