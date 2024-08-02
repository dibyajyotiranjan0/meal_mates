import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmates_resturant/provider/profileProvider.dart';

class DocumentDetailsPage extends StatefulWidget {
  const DocumentDetailsPage({super.key});

  @override
  State<DocumentDetailsPage> createState() => _DocumentDetailsPageState();
}

class _DocumentDetailsPageState extends State<DocumentDetailsPage> {
  Uint8List? _regProof;
  File? regProofpath;
  Uint8List? _gstImg;
  File? gstimgPath;
  Uint8List? _adharfont;
  File? adharFontpath;
  Uint8List? _adharback;
  File? adharBackPath;
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController regNum = TextEditingController();
  TextEditingController gstNum = TextEditingController();
  TextEditingController adharNum = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    var provider =
        Provider.of<ViewProfileResturantProvider>(context, listen: false);
    provider.viewProfileAndResturant();
    if (provider.profile_resturant != null) {
      regNum = TextEditingController(
          text: provider
              .profile_resturant!.messages!.status!.userdata![0].regNum);
      gstNum = TextEditingController(
          text: provider.profile_resturant!.messages!.status!.userdata![0].gst);
      adharNum = TextEditingController(
          text: provider
              .profile_resturant!.messages!.status!.userdata![0].adharNo);
    }

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
      //formState.save();
      var provider =
          Provider.of<ViewProfileResturantProvider>(context, listen: false);
      provider.updateResturantDocumentProvider(
          reg_num: regNum.toString(),
          gst: gstNum.text.toString(),
          adhar_no: adharNum.text.toString(),
          reg_proof: regProofpath,
          gst_img: gstimgPath,
          adhar_font: adharFontpath,
          adhar_back: adharBackPath);
      // then do something
    } else {
      print("Sorry");
    }
  }

  // Future pickImage() async {
  //   // final iimage = ImagePicker().pickImage(source: ImageSource.camera);
  //   final returnImage =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (returnImage == null) return;
  //   setState(() {
  //     // selectedIMage = File(returnImage.path.toString());

  //     selectedIMage = File(returnImage.name.toString());
  //     // _image = File(returnImage.path).readAsBytesSync();
  //   });
  //   // print(returnImage.);
  // }

  Future _pickImageFromGallery(String name) async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      if (name == "regProof") {
        regProofpath = File(returnImage.path);
        _regProof = File(returnImage.path).readAsBytesSync();
      } else if (name == "gstImage") {
        gstimgPath = File(returnImage.path);
        _gstImg = File(returnImage.path).readAsBytesSync();
      } else if (name == "adharFont") {
        adharFontpath = File(returnImage.path);
        _adharfont = File(returnImage.path).readAsBytesSync();
      } else if (name == "AdharBack") {
        adharBackPath = File(returnImage.path);
        _adharback = File(returnImage.path).readAsBytesSync();
      } else {
        return null;
      }
    });
    Navigator.of(context).pop(); //close the model sheet
  }

  Future _pickImageFromCamera(String name) async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      if (name == "regProof") {
        regProofpath = File(returnImage.path);
        _regProof = File(returnImage.path).readAsBytesSync();
      } else if (name == "gstImage") {
        gstimgPath = File(returnImage.path);
        _gstImg = File(returnImage.path).readAsBytesSync();
      } else if (name == "adharFont") {
        adharFontpath = File(returnImage.path);
        _adharfont = File(returnImage.path).readAsBytesSync();
      } else if (name == "AdharBack") {
        adharBackPath = File(returnImage.path);
        _adharback = File(returnImage.path).readAsBytesSync();
      } else {
        return null;
      }
    });
    Navigator.of(context).pop();
  }

  void showImagePickerOption(BuildContext context, String name) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery(name);
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera(name);
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ViewProfileResturantProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
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
          "Documents",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: TextFormField(
                  autocorrect: true,
                  maxLines: 1,
                  controller: regNum,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    label: Text(
                      "Your Registration Number",
                    ),

                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    // label: Text("Contact No"),
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    // floatingLabelStyle: TextStyle(),
                    hintText: "Enter Number",
                    hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    contentPadding: EdgeInsets.only(left: 5, bottom: 5),
                    // focusedBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.black)),
                    // OutlineInputBorder(
                    //     borderSide:
                    //         const BorderSide(color: Colors.black, width: 1.0),
                    //     borderRadius: BorderRadius.circular(10)),
                    border: UnderlineInputBorder(),
                    // OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide:BorderSide.
                    //         )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                child: TextFormField(
                  autocorrect: true,
                  maxLines: 1,
                  controller: gstNum,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    label: Text(
                      "GST Number",
                    ),

                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    // label: Text("Contact No"),
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    // floatingLabelStyle: TextStyle(),
                    hintText: "Enter GST Number",
                    hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    contentPadding: EdgeInsets.only(left: 5, bottom: 5),
                    // focusedBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.black)),
                    // OutlineInputBorder(
                    //     borderSide:
                    //         const BorderSide(color: Colors.black, width: 1.0),
                    //     borderRadius: BorderRadius.circular(10)),
                    border: UnderlineInputBorder(),
                    // OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide:BorderSide.
                    //         )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                child: TextFormField(
                  autocorrect: true,
                  maxLines: 1,
                  controller: adharNum,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    label: Text(
                      "Your Adhar Number",
                    ),

                    alignLabelWithHint: true,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    // label: Text("Contact No"),
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    // floatingLabelStyle: TextStyle(),
                    hintText: "Enter Adhar Number",
                    hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    contentPadding: EdgeInsets.only(left: 5, bottom: 5),
                    // focusedBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.black)),
                    // OutlineInputBorder(
                    //     borderSide:
                    //         const BorderSide(color: Colors.black, width: 1.0),
                    //     borderRadius: BorderRadius.circular(10)),
                    border: UnderlineInputBorder(),
                    // OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     borderSide:BorderSide.
                    //         )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Registration Proof",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    InkWell(
                        // onTap: () => showImagePickerOption(context),
                        child: Container(
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () =>
                                  showImagePickerOption(context, "regProof"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              child: Text("Browse Image")),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                      // child: TextField(
                      // autocorrect: true,
                      // maxLines: 1,
                      // onTap: () => null,
                      // controller: image,
                      // keyboardType: TextInputType.number,
                      // style: TextStyle(
                      //     fontSize: 20, fontWeight: FontWeight.bold),
                      // decoration: InputDecoration(
                      //     // label: Text("Contact No"),
                      //     // floatingLabelBehavior: FloatingLabelBehavior.always,
                      //     // floatingLabelStyle: TextStyle(),
                      //     hintText: "Upload Image",
                      //     hintStyle:
                      //         TextStyle(color: Colors.black, fontSize: 16),
                      //     suffixIcon: InkWell(
                      //       onTap: () => pickImage(),
                      //       child: Icon(
                      //         Icons.image,
                      //         color: Colors.pinkAccent,
                      //       ),
                      //     ),
                      //     contentPadding:
                      //         EdgeInsets.only(left: 15, bottom: 5),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(
                      //             color: Colors.black, width: 2.0),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(
                      //             color: Colors.black, width: 2))),
                    )),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: _regProof != null
                          ? Image.memory(
                              _regProof!,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              "https://collegeprojectz.com/mealmate/uploads/${provider.profile_resturant!.messages!.status!.userdata![0].centerRedgProof}",
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image),
                            ),
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "GST Image",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    InkWell(
                        // onTap: () => showImagePickerOption(context),
                        child: Container(
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () =>
                                  showImagePickerOption(context, "gstImage"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              child: Text("Browse Image")),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Expanded(child: SizedBox()),
                          ),
                        ],
                      ),
                      // child: TextField(
                      // autocorrect: true,
                      // maxLines: 1,
                      // onTap: () => null,
                      // controller: image,
                      // keyboardType: TextInputType.number,
                      // style: TextStyle(
                      //     fontSize: 20, fontWeight: FontWeight.bold),
                      // decoration: InputDecoration(
                      //     // label: Text("Contact No"),
                      //     // floatingLabelBehavior: FloatingLabelBehavior.always,
                      //     // floatingLabelStyle: TextStyle(),
                      //     hintText: "Upload Image",
                      //     hintStyle:
                      //         TextStyle(color: Colors.black, fontSize: 16),
                      //     suffixIcon: InkWell(
                      //       onTap: () => pickImage(),
                      //       child: Icon(
                      //         Icons.image,
                      //         color: Colors.pinkAccent,
                      //       ),
                      //     ),
                      //     contentPadding:
                      //         EdgeInsets.only(left: 15, bottom: 5),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(
                      //             color: Colors.black, width: 2.0),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(
                      //             color: Colors.black, width: 2))),
                    )),
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: _gstImg != null
                          ? Image.memory(
                              _gstImg!,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              "https://collegeprojectz.com/mealmate/uploads/${provider.profile_resturant!.messages!.status!.userdata![0].gstImage}}",
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image),
                            ),
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Adhar Font Page Image",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    InkWell(
                        // onTap: () => showImagePickerOption(context),
                        child: Container(
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () =>
                                  showImagePickerOption(context, "adharFont"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              child: Text("Browse Image")),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Expanded(child: SizedBox()),
                          ),
                        ],
                      ),
                      // child: TextField(
                      // autocorrect: true,
                      // maxLines: 1,
                      // onTap: () => null,
                      // controller: image,
                      // keyboardType: TextInputType.number,
                      // style: TextStyle(
                      //     fontSize: 20, fontWeight: FontWeight.bold),
                      // decoration: InputDecoration(
                      //     // label: Text("Contact No"),
                      //     // floatingLabelBehavior: FloatingLabelBehavior.always,
                      //     // floatingLabelStyle: TextStyle(),
                      //     hintText: "Upload Image",
                      //     hintStyle:
                      //         TextStyle(color: Colors.black, fontSize: 16),
                      //     suffixIcon: InkWell(
                      //       onTap: () => pickImage(),
                      //       child: Icon(
                      //         Icons.image,
                      //         color: Colors.pinkAccent,
                      //       ),
                      //     ),
                      //     contentPadding:
                      //         EdgeInsets.only(left: 15, bottom: 5),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(
                      //             color: Colors.black, width: 2.0),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(
                      //             color: Colors.black, width: 2))),
                    )),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: _adharfont != null
                          ? Image.memory(
                              _adharfont!,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              "https://collegeprojectz.com/mealmate/uploads/${provider.profile_resturant!.messages!.status!.userdata![0].adharFont}",
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image),
                            ),
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "adhar Back Image",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    InkWell(
                        // onTap: () => showImagePickerOption(context),
                        child: Container(
                      height: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () =>
                                  showImagePickerOption(context, "AdharBack"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          side:
                                              BorderSide(color: Colors.red)))),
                              child: Text("Browse Image")),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Expanded(child: SizedBox()),
                          ),
                        ],
                      ),
                      // child: TextField(
                      // autocorrect: true,
                      // maxLines: 1,
                      // onTap: () => null,
                      // controller: image,
                      // keyboardType: TextInputType.number,
                      // style: TextStyle(
                      //     fontSize: 20, fontWeight: FontWeight.bold),
                      // decoration: InputDecoration(
                      //     // label: Text("Contact No"),
                      //     // floatingLabelBehavior: FloatingLabelBehavior.always,
                      //     // floatingLabelStyle: TextStyle(),
                      //     hintText: "Upload Image",
                      //     hintStyle:
                      //         TextStyle(color: Colors.black, fontSize: 16),
                      //     suffixIcon: InkWell(
                      //       onTap: () => pickImage(),
                      //       child: Icon(
                      //         Icons.image,
                      //         color: Colors.pinkAccent,
                      //       ),
                      //     ),
                      //     contentPadding:
                      //         EdgeInsets.only(left: 15, bottom: 5),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: const BorderSide(
                      //             color: Colors.black, width: 2.0),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10),
                      //         borderSide: BorderSide(
                      //             color: Colors.black, width: 2))),
                    )),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: _adharback != null
                          ? Image.memory(
                              _adharback!,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              "https://collegeprojectz.com/mealmate/uploads/${provider.profile_resturant!.messages!.status!.userdata![0].adharBack}",
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image),
                            ),
                    )
                  ]),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)))),
                      onPressed: () => submitForm(formKey),
                      child: Text("Submit",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18)))),
            ],
          ),
        ),
      ),
    );
  }
}
