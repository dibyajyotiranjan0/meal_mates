// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AddressPage extends StatefulWidget {
//   const AddressPage({super.key});

//   @override
//   State<AddressPage> createState() => _AddressPageState();
// }

// class _AddressPageState extends State<AddressPage> {
//   GlobalKey<FormState> formKey = new GlobalKey();
//   List<String> _locations = [
//     "odisha",
//     "Bengaldesh",
//     "Andhrapradesh",
//     "Kashmir"
//   ];
//   //String _onDropDownItemSelected = '(Choose Option ▼)';
//   TextEditingController fulName = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController prcontact = TextEditingController();
//   TextEditingController scContact = TextEditingController();
//   var _selectedLocation = "Odisha";
//   int index = 0;
//   Uint8List? _image;
//   File? selectedIMage;
//   @override
//   void initState() {
//     // TODO: implement initState
//     var provider = Provider.of(context, listen: false);
//     provider.viewProfileAndResturant();
//     if (provider.profile_resturant != null) {
//       fulName = TextEditingController(
//           text: provider
//               .profile_resturant!.messages!.status!.userdata![0].fullName);
//       email = TextEditingController(
//           text:
//               provider.profile_resturant!.messages!.status!.userdata![0].email);
//       prcontact = TextEditingController(
//           text: provider
//               .profile_resturant!.messages!.status!.userdata![0].contactNo);
//       scContact = TextEditingController(
//           text: provider
//               .profile_resturant!.messages!.status!.userdata![0].alterCnum);
//     }

//     super.initState();
//   }

//   Validate(input) {
//     if (input.isEmpty) {
//       return 'Please type something';
//     }
//     return null;
//   }

//   submitForm(formkey) {
//     final formState = formKey.currentState;
//     if (formState!.validate()) {
//       //formState.save();
//       var provider =
//           Provider.of<ViewProfileResturantProvider>(context, listen: false);
//       provider.updateProfieProvider(
//           full_name: fulName.text.toString(),
//           e_mail: email.text.toString(),
//           contact_number: prcontact.text.toString(),
//           altcontact_no: scContact.text.toString(),
//           img: selectedIMage);
//       // then do something
//     } else {
//       print("Sorry");
//     }
//   }

//   Future pickImage() async {
//     // final iimage = ImagePicker().pickImage(source: ImageSource.camera);
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       // selectedIMage = File(returnImage.path.toString());

//       selectedIMage = File(returnImage.name.toString());
//       // _image = File(returnImage.path).readAsBytesSync();
//     });
//     // print(returnImage.);
//   }

//   Future _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnImage == null) return;
//     setState(() {
//       selectedIMage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop(); //close the model sheet
//   }

//   Future _pickImageFromCamera() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnImage == null) return;
//     setState(() {
//       selectedIMage = File(returnImage.path);
//       _image = File(returnImage.path).readAsBytesSync();
//     });
//     Navigator.of(context).pop();
//   }

//   void showImagePickerOption(BuildContext context) {
//     showModalBottomSheet(
//         backgroundColor: Colors.blue[100],
//         context: context,
//         builder: (builder) {
//           return Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 4.5,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         _pickImageFromGallery();
//                       },
//                       child: const SizedBox(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.image,
//                               size: 70,
//                             ),
//                             Text("Gallery")
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: InkWell(
//                       onTap: () {
//                         _pickImageFromCamera();
//                       },
//                       child: const SizedBox(
//                         child: Column(
//                           children: [
//                             Icon(
//                               Icons.camera_alt,
//                               size: 70,
//                             ),
//                             Text("Camera")
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var provider =
//         Provider.of<ViewProfileResturantProvider>(context, listen: false);
//     // print(provider.profile_resturant!.toJson());
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 20,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//         title: Text(
//           "My Profiile",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(left: 8.0, right: 8.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 70,
//                 child: TextFormField(
//                   autocorrect: true,
//                   maxLines: 1,
//                   controller: fulName,
//                   keyboardType: TextInputType.text,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     label: Text(
//                       "Your Full Name",
//                     ),

//                     alignLabelWithHint: true,
//                     floatingLabelAlignment: FloatingLabelAlignment.start,
//                     //floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // label: Text("Contact No"),
//                     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // floatingLabelStyle: TextStyle(),
//                     hintText: "Enter Name",
//                     hintStyle: TextStyle(
//                         color: Colors.black26,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400),
//                     contentPadding: EdgeInsets.only(left: 5, bottom: 5),
//                     // focusedBorder: UnderlineInputBorder(
//                     //     borderSide: BorderSide(color: Colors.black)),
//                     // OutlineInputBorder(
//                     //     borderSide:
//                     //         const BorderSide(color: Colors.black, width: 1.0),
//                     //     borderRadius: BorderRadius.circular(10)),
//                     border: UnderlineInputBorder(),
//                     // OutlineInputBorder(
//                     //     borderRadius: BorderRadius.circular(10),
//                     //     borderSide:BorderSide.
//                     //         )
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 70,
//                 child: TextFormField(
//                   autocorrect: true,
//                   maxLines: 1,
//                   controller: email,
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     label: Text("Email"),
//                     alignLabelWithHint: true,
//                     floatingLabelAlignment: FloatingLabelAlignment.start,
//                     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // label: Text("Contact No"),
//                     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // floatingLabelStyle: TextStyle(),
//                     hintText: "Enter Your Email Address",
//                     hintStyle: TextStyle(
//                         color: Colors.black26,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16),
//                     contentPadding: EdgeInsets.only(left: 5, bottom: 5),
//                     //focusedBorder: InputBorder.none,
//                     // OutlineInputBorder(
//                     //     borderSide: const BorderSide(
//                     //         color: Colors.black, width: 2.0),
//                     // borderRadius: BorderRadius.circular(10)),
//                     border: UnderlineInputBorder(),
//                     // OutlineInputBorder(
//                     //     borderRadius: BorderRadius.circular(10),
//                     //     borderSide:
//                     //         BorderSide(color: Colors.black, width: 2))
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 70,
//                 child: TextFormField(
//                   autocorrect: true,
//                   maxLines: 1,
//                   controller: prcontact,
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     label: Text("Primer Contact No."),
//                     alignLabelWithHint: true,
//                     floatingLabelAlignment: FloatingLabelAlignment.start,
//                     //floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // label: Text("Contact No"),
//                     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // floatingLabelStyle: TextStyle(),
//                     hintText: "Enter Phone Number",
//                     hintStyle: TextStyle(
//                         color: Colors.black26,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16),
//                     contentPadding: EdgeInsets.only(left: 5, bottom: 5),
//                     //focusedBorder: InputBorder.none,
//                     // OutlineInputBorder(
//                     //     borderSide: const BorderSide(
//                     //         color: Colors.black, width: 2.0),
//                     // borderRadius: BorderRadius.circular(10)),
//                     border: UnderlineInputBorder(),
//                     // OutlineInputBorder(
//                     //     borderRadius: BorderRadius.circular(10),
//                     //     borderSide:
//                     //         BorderSide(color: Colors.black, width: 2))
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 70,
//                 child: TextFormField(
//                   autocorrect: true,
//                   maxLines: 1,
//                   controller: scContact,
//                   keyboardType: TextInputType.number,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   decoration: InputDecoration(
//                     label: Text("Alternet Conact No."),
//                     alignLabelWithHint: true,
//                     floatingLabelAlignment: FloatingLabelAlignment.start,
//                     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // label: Text("Contact No"),
//                     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                     // floatingLabelStyle: TextStyle(),
//                     hintText: "Enter phoone No",
//                     hintStyle: TextStyle(
//                         color: Colors.black26,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16),
//                     contentPadding: EdgeInsets.only(left: 5, bottom: 5),
//                     //focusedBorder: InputBorder.none,
//                     // OutlineInputBorder(
//                     //     borderSide: const BorderSide(
//                     //         color: Colors.black, width: 2.0),
//                     // borderRadius: BorderRadius.circular(10)),
//                     border: UnderlineInputBorder(),
//                     // OutlineInputBorder(
//                     //     borderRadius: BorderRadius.circular(10),
//                     //     borderSide:
//                     //         BorderSide(color: Colors.black, width: 2))
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "profile Image",
//                           style: TextStyle(
//                               fontSize: 15, fontWeight: FontWeight.bold),
//                         )),
//                     InkWell(
//                         // onTap: () => showImagePickerOption(context),
//                         child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black)),
//                       child: ElevatedButton(
//                           onPressed: () => showImagePickerOption(context),
//                           style: ButtonStyle(
//                               shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8.0),
//                                       side: BorderSide(color: Colors.red)))),
//                           child: Text("Browse Image")),
//                       // child: TextField(
//                       // autocorrect: true,
//                       // maxLines: 1,
//                       // onTap: () => null,
//                       // controller: image,
//                       // keyboardType: TextInputType.number,
//                       // style: TextStyle(
//                       //     fontSize: 20, fontWeight: FontWeight.bold),
//                       // decoration: InputDecoration(
//                       //     // label: Text("Contact No"),
//                       //     // floatingLabelBehavior: FloatingLabelBehavior.always,
//                       //     // floatingLabelStyle: TextStyle(),
//                       //     hintText: "Upload Image",
//                       //     hintStyle:
//                       //         TextStyle(color: Colors.black, fontSize: 16),
//                       //     suffixIcon: InkWell(
//                       //       onTap: () => pickImage(),
//                       //       child: Icon(
//                       //         Icons.image,
//                       //         color: Colors.pinkAccent,
//                       //       ),
//                       //     ),
//                       //     contentPadding:
//                       //         EdgeInsets.only(left: 15, bottom: 5),
//                       //     focusedBorder: OutlineInputBorder(
//                       //         borderSide: const BorderSide(
//                       //             color: Colors.black, width: 2.0),
//                       //         borderRadius: BorderRadius.circular(10)),
//                       //     border: OutlineInputBorder(
//                       //         borderRadius: BorderRadius.circular(10),
//                       //         borderSide: BorderSide(
//                       //             color: Colors.black, width: 2))),
//                     )),
//                     SizedBox(
//                       height: 100,
//                       width: double.infinity,
//                       child: _image != null
//                           ? Image.memory(
//                               _image!,
//                               fit: BoxFit.contain,
//                             )
//                           : Image.network(
//                               "https://collegeprojectz.com/mealmate/uploads/${provider.profile_resturant!.messages!.status!.userdata![0].profileImage}"),
//                     )
//                   ]),
//               SizedBox(
//                 height: 10,
//               ),
//               // TextFormField(
//               //   autocorrect: true,
//               //   maxLines: 1,
//               //   //controller: number,
//               //   keyboardType: TextInputType.number,
//               //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               //   decoration: InputDecoration(
//               //     label: Text("City"),
//               //     alignLabelWithHint: true,
//               //     floatingLabelAlignment: FloatingLabelAlignment.start,
//               //     floatingLabelBehavior: FloatingLabelBehavior.always,
//               //     // label: Text("Contact No"),
//               //     // floatingLabelBehavior: FloatingLabelBehavior.always,
//               //     // floatingLabelStyle: TextStyle(),
//               //     hintText: "Bhubaneswar",
//               //     hintStyle: TextStyle(color: Colors.black, fontSize: 16),
//               //     contentPadding: EdgeInsets.only(left: 5, bottom: 5),
//               //     //focusedBorder: InputBorder.none,
//               //     // OutlineInputBorder(
//               //     //     borderSide: const BorderSide(
//               //     //         color: Colors.black, width: 2.0),
//               //     // borderRadius: BorderRadius.circular(10)),
//               //     border: UnderlineInputBorder(),
//               //     // OutlineInputBorder(
//               //     //     borderRadius: BorderRadius.circular(10),
//               //     //     borderSide:
//               //     //         BorderSide(color: Colors.black, width: 2))
//               //   ),
//               // ),

//               // SizedBox(
//               //   height: 10,
//               // ),

//               SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
//                   height: 50,
//                   width: MediaQuery.of(context).size.width * 1,
//                   child: ElevatedButton(
//                       style: ButtonStyle(
//                           alignment: Alignment.center,
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.redAccent),
//                           shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25)))),
//                       onPressed: () => submitForm(formKey),
//                       child: Text("Submit",
//                           style:
//                               TextStyle(color: Colors.white, fontSize: 18)))),
//               // SizedBox(
//               //   height: 100,
//               //   width: 100,
//               //   child: _image != null ? Image.memory(_image!) : SizedBox(),
//               //)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
