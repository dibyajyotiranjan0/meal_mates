// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';
import 'package:syflex_meamates/provider/sign_provider.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  GlobalKey<FormState> formKey = new GlobalKey();
  late String file1;
  late String file2;

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

  insertVechicle() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      file1 = file.path;
    } else {
      // User canceled the picker
    }
    // setState(() {});
  }

  insertVechicle2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File filepath = File(result.files.single.path!);
      String path = filepath.path.split('/').last;
      file2 = filepath.path;
      // print(result);
    } else {
      // User canceled the picker
    }
    // setState(() {});
  }

  submitForm(formkey) async {
    final formState = formKey.currentState;
    // print(selectedValue);
    // print(vechicleNo.text.toString());
    // print(file1);
    // print(file2);
    if (file1 != null && file2 != null) {
      // if (cityName != null && areaName != null && pincode != null) {
      final provider = Provider.of<signProvider>(context, listen: false);
      await provider
          .docmentDtlsUpdate(adhar_font: file1, adharback: file2)
          .then((v) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                "Address Sucesfully updated",
                style: TextStyle(color: Colors.green),
              ))));

      // Navigator.pop(context);
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text(
      //     "Please Select Cityname Area Name and PinCode",
      //     style: TextStyle(color: Colors.red),
      //   )));
    }

    //   // formState.save();

    //   // then do something
    // } else {
    //   print("Sorry");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          child: Consumer<signProvider>(builder: (context, val, chid) {
            return Form(
              key: formKey,
              child: ListView(
                shrinkWrap: true,
                primary: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView(
                      shrinkWrap: true,
                      // primary: false,
                      // scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Vechicle RC Details"),
                        ),
                        val.userLogDetails!.messages!.status![0].adharFont !=
                                null
                            ? SizedBox(
                                height: 200,
                                child: const PDF().cachedFromUrl(
                                  "https://mealking.in/uploads/${val.userLogDetails!.messages!.status![0].adharFont}",
                                  // placeholder: (double progress) =>
                                  //     Center(child: Text('$progress %')),
                                  errorWidget: (dynamic error) =>
                                      Center(child: Text(error.toString())),
                                ),
                              )
                            : Container(
                                height: 200,
                                color: Colors.grey.shade200,
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: TextButton.icon(
                              onPressed: () => insertVechicle(),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.red))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              icon: Icon(Icons.file_copy),
                              label: Text("Insert Pdf")),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Vechicle Driving Licence Paper"),
                        ),
                        val.userLogDetails!.messages!.status![0].adharBack !=
                                null
                            ? SizedBox(
                                height: 200,
                                child: const PDF().cachedFromUrl(
                                  "https://mealking.in/uploads/${val.userLogDetails!.messages!.status![0].adharBack}",
                                  // placeholder: (double progress) =>
                                  //     Center(child: Text('$progress %')),
                                  errorWidget: (dynamic error) =>
                                      Center(child: Text(error.toString())),
                                ),
                              )
                            : Container(
                                height: 200,
                                color: Colors.grey.shade200,
                              ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: TextButton.icon(
                              onPressed: () => insertVechicle2(),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side: BorderSide(color: Colors.red))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue)),
                              icon: Icon(Icons.file_copy),
                              label: Text("Insert Pdf")),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
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
                                      borderRadius:
                                          BorderRadius.circular(35)))),
                          onPressed: () => submitForm(formKey),
                          child: Text("Update Profile",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)))),
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
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          onPressed: () => Navigator.pop(context),
                          child: Text("cancel",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)))),
                ],
              ),
            );
          }),
        ));
  }
}
