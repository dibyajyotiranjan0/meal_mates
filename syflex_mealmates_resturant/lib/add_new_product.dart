import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmates_resturant/provider/resturant-product_provider.dart';

class AddNewProduct extends StatefulWidget {
  Map product;
  AddNewProduct({required this.product, super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController productname = TextEditingController();
  TextEditingController productDecreption = TextEditingController();
  TextEditingController productregPrice = TextEditingController();
  TextEditingController productSalesPice = TextEditingController();
  TextEditingController productprimary_Image = TextEditingController();
  TextEditingController productcategory = TextEditingController();
  TextEditingController producttpe = TextEditingController();
  TextEditingController prodType = TextEditingController();
  TextEditingController foodType = TextEditingController();
  TextEditingController status = TextEditingController();
  List<String> _locations = ["Veg", "Non-veg"];
  var imagePath;
  bool simvar = false;
  bool monVal = false;
  List catvalueAddApi = [];
  getVariable() {
    if (simvar == true) {
      simvar = false;
    } else if (simvar == false) {
      simvar = true;
    } else {
      simvar;
    }
    setState(() {});
  }

  // void monVal(bool?checkboxState){
  //    setState(() {
  //     // Return checkboxState. If it's null, return false
  //     monVall = checkboxState ?? false;
  //   });
  // }
  //String _onDropDownItemSelected = '(Choose Option ▼)';
  TextEditingController image = TextEditingController();
  var _selectedLocation = "Chooose Product Type";
  int? selectedButton;
  int index = 0;
  Uint8List? _image;
  Map<String, List> catVal = {};
  Validate(input) {
    if (input.isEmpty) {
      return 'Enter valid input';
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    AllCat();
    catVal.clear();
    productname = TextEditingController(text: widget.product["product_name"]);
    productDecreption =
        TextEditingController(text: widget.product["description"]);
    productregPrice =
        TextEditingController(text: widget.product["regular_price"]);
    productSalesPice =
        TextEditingController(text: widget.product["sales_price"]);
    if (widget.product["product_categories"] != null) {
      catvalueAddApi = widget.product["product_categories"].split(',');
    }

    if (widget.product["food_type"] != null) {
      selectedButton = int.parse(widget.product["food_type"]);
    }
    // productprimary_Image = TextEditingController(text: widget.product["product_name"]);
    // productcategory = TextEditingController(text: widget.product["product_name"]);
    // producttpe = TextEditingController(text: widget.product["product_name"]);
    // prodType = TextEditingController(text: widget.product["product_name"]);
    foodType = TextEditingController(text: widget.product["food_type"]);
    //print(catvalueAddApi.length);
    // status = TextEditingController(text: widget.product["product_name"]);
  }

  AllCat() {
    final provider =
        Provider.of<ResturatProductListProvider>(context, listen: false);
    provider.AllCategoryResturant();
    // for (var i = 0;
    //     i <
    //         provider
    //             .allRescturantCategry!.messages!.status!.categorydata!.length;
    //     i++) {
    //       catVal.ad
    //     }
  }

  submitForm(formkey) {
    final formState = formKey.currentState;
    var provider =
        Provider.of<ResturatProductListProvider>(context, listen: false);
    // print(catvalueAddApi.join(",").toString());
    if (formState!.validate()) {
      // formState.save();
      selectedButton != null && catvalueAddApi.length != 0
          ? provider.ResturantEditProduct(
              productid: widget.product["product_id"],
              restaurant_id: widget.product["vendor_id"],
              product_name:
                  productname.text.toString() ?? widget.product["product_name"],
              description: productDecreption.text.toString() ??
                  widget.product["description"],
              productType:
                  producttpe.text.toString() ?? widget.product["product_type"],
              food_type:
                  selectedButton.toString() ?? widget.product["food_type"],
              pro_cat: catvalueAddApi.join(",").toString(),
              regular_price: productregPrice.text.toString() ??
                  widget.product["regular_price"],
              sales_price: productSalesPice.text.toString() ??
                  widget.product["sales_price"],
              img: imagePath)
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('You must select Food Type and categry'),
            ));
      formState.reset();

      // Navigator.pop(context);
      // Navigator.pop(context);
      // then do something
    } else {
      print("Sorry");
    }
  }

  File? selectedIMage;

  Future pickImage() async {
    // final iimage = ImagePicker().pickImage(source: ImageSource.camera);
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      // selectedIMage = File(returnImage.path.toString());

      selectedIMage = File(returnImage.name.toString());
      // _image = File(returnImage.path).readAsBytesSync();
    });
    // print(returnImage.);
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      imagePath = returnImage.path;
      // print(returnImage.);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  void showImagePickerOption(BuildContext context) {
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
                        _pickImageFromGallery();
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
                        _pickImageFromCamera();
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
    var provider = Provider.of<ResturatProductListProvider>(context);
    image = TextEditingController(text: "$selectedIMage");
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
        leadingWidth: 40,
        title: Text(
          "Edit Product",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Product Name",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      width: double.infinity,
                      child: TextFormField(
                        autocorrect: true,
                        maxLines: 1,
                        controller: productname,
                        keyboardType: TextInputType.text,
                        validator: (value) => Validate(value),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            // label: Text("Contact No"),
                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            // floatingLabelStyle: TextStyle(),
                            hintText: "Paneer Masala",
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 5),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Product Description",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      width: double.infinity,
                      child: TextFormField(
                        autocorrect: true,
                        maxLines: 4,
                        controller: productDecreption,
                        keyboardType: TextInputType.text,
                        validator: (value) => Validate(value),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            // label: Text("Contact No"),
                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            // floatingLabelStyle: TextStyle(),
                            hintText: "Enter Full Description of product",
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 5),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Product Regular Price",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 70,
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      width: double.infinity,
                      child: TextFormField(
                        autocorrect: true,
                        maxLines: 1,
                        controller: productregPrice,
                        keyboardType: TextInputType.number,
                        validator: (value) => Validate(value),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            isDense: true,
                            constraints: const BoxConstraints(
                                maxHeight: 70, minHeight: 35),
                            // label: Text("Contact No"),
                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            // floatingLabelStyle: TextStyle(),
                            hintText: "Product Regular Price",
                            // error: SizedBox(),
                            // errorStyle: TextStyle(),
                            // errorMaxLines: 1,
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            // EdgeInsets.only(left: 15, bottom: 5,),
                            // errorMaxLines: 2,
                            // errorBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(10),
                            // borderSide:
                            //     BorderSide(color: Colors.red, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Product Sales Price",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 70,
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      width: double.infinity,
                      child: TextFormField(
                        autocorrect: true,
                        maxLines: 1,
                        controller: productSalesPice,
                        keyboardType: TextInputType.number,
                        validator: (value) => Validate(value),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            // label: Text("Contact No"),
                            // floatingLabelBehavior: FloatingLabelBehavior.always,
                            // floatingLabelStyle: TextStyle(),
                            hintText: "Sales Price",
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 5),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      )),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Primary Image",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    InkWell(
                        onTap: () => showImagePickerOption(context),
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: FittedBox(
                                      fit: BoxFit.none,
                                      child: Text(
                                        "${selectedIMage}",
                                        overflow: TextOverflow.fade,
                                      ))),
                              Icon(Icons.image_outlined)
                            ],
                          ),
                          // child: TextFormField(
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
                  ]),
              SizedBox(
                height: 30,
              ),
              Material(
                color: Colors.grey.shade100,
                elevation: 15,
                shadowColor: Colors.black,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Category",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Consumer(builder: (context, va, child) {
                      return SizedBox(
                        height: 200,
                        child: provider.allRescturantCategry == null
                            ? SizedBox()
                            : ListView.builder(
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: provider.allRescturantCategry!
                                    .messages!.status!.categorydata!.length,
                                itemBuilder: (context, int) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        // height: 35,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: CheckboxListTile(
                                            visualDensity: VisualDensity(
                                                horizontal: 0, vertical: -3),
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            title: Transform.translate(
                                              offset: Offset(-20, 0),
                                              child: Text(
                                                  "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catName}"),
                                            ),
                                            value: catvalueAddApi.length == 0
                                                ? false
                                                : catvalueAddApi.contains(provider
                                                        .allRescturantCategry!
                                                        .messages!
                                                        .status!
                                                        .categorydata![int]
                                                        .catId)
                                                    ? true
                                                    : false,
                                            // catVal["${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}"] ==
                                            //         null
                                            //     ? false
                                            //     : true,
                                            onChanged: (value) {
                                              if (catvalueAddApi.contains(
                                                  provider
                                                      .allRescturantCategry!
                                                      .messages!
                                                      .status!
                                                      .categorydata![int]
                                                      .catId)) {
                                                // catVal.addAll({
                                                //   "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}":
                                                //       [
                                                //     provider
                                                //         .allRescturantCategry!
                                                //         .messages!
                                                //         .status!
                                                //         .categorydata![int]
                                                //         .toJson()
                                                //   ]
                                                // });
                                                catvalueAddApi.remove(
                                                    "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}");
                                                // catvalueAddApi.add(
                                                //     "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}");
                                              } else {
                                                catvalueAddApi.add(
                                                    "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}");
                                                // catVal.remove(
                                                //     "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}");
                                                // catvalueAddApi.remove(
                                                //     "${provider.allRescturantCategry!.messages!.status!.categorydata![int].catId}");
                                              }
                                              print(catvalueAddApi);
                                              monVal = value!;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ),
                                      // provider
                                      //             .allRescturantCategry!
                                      //             .messages!
                                      //             .status!
                                      //             .categorydata![int]
                                      //             .subcategories!
                                      //             .length ==
                                      //         0
                                      //     ? SizedBox()
                                      //     : Padding(
                                      // padding: EdgeInsets.only(
                                      //     left: 25, top: 0, right: 0),
                                      // child: ListView.builder(
                                      //     shrinkWrap: true,
                                      //     physics:
                                      //         NeverScrollableScrollPhysics(),
                                      //     itemCount: provider
                                      //         .allRescturantCategry!
                                      //         .messages!
                                      //         .status!
                                      //         .categorydata![int]
                                      //         .subcategories!
                                      //         .length,
                                      //     itemBuilder:
                                      //         (context, index) {
                                      //       return SizedBox(
                                      //         // height: 30,
                                      //         child: CheckboxListTile(
                                      //           visualDensity:
                                      //               VisualDensity(
                                      //                   horizontal: 0,
                                      //                   vertical: -3),
                                      //           contentPadding:
                                      //               EdgeInsets.zero,
                                      //           controlAffinity:
                                      //               ListTileControlAffinity
                                      //                   .leading,
                                      //           title:
                                      //               Transform.translate(
                                      //             offset:
                                      //                 Offset(-20, 0),
                                      //             child: Text(
                                      //                 "${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catName}"),
                                      //           ),
                                      //           value:
                                      //               catVal["${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catId}"] ==
                                      //                       null
                                      //                   ? false
                                      //                   : true,
                                      //           onChanged: (value) {
                                      //             if (catVal[
                                      //                     "${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catId}"] ==
                                      //                 null) {
                                      //               catVal.addAll({
                                      //                 "${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catId}":
                                      //                     [
                                      //                   provider
                                      //                       .allRescturantCategry!
                                      //                       .messages!
                                      //                       .status!
                                      //                       .categorydata![
                                      //                           int]
                                      //                       .subcategories![
                                      //                           index]
                                      //                       .toJson()
                                      //                 ]
                                      //               });
                                      //               catvalueAddApi.add(
                                      //                   "${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catId}");
                                      //             } else {
                                      //               catVal.remove(
                                      //                   "${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catId}");
                                      //               catvalueAddApi.remove(
                                      //                   "${provider.allRescturantCategry!.messages!.status!.categorydata![int].subcategories![index].catId}");
                                      //             }
                                      //             setState(() {
                                      //               monVal = value!;
                                      //               // print(
                                      //               //     catvalueAddApi);
                                      //             });
                                      //           },
                                      //         ),
                                      //       );
                                      //     }),
                                      //  ),
                                    ],
                                  );
                                }),
                      );
                    }),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Material(
                  elevation: 2,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              "Food Type",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                        OptionRadio(
                            text: 'Veg',
                            index: 0,
                            selectedButton: selectedButton,
                            press: (val) {
                              selectedButton = val;
                              setState(() {});
                            }),
                        OptionRadio(
                            text: 'NonVeg',
                            index: 1,
                            selectedButton: selectedButton,
                            press: (val) {
                              selectedButton = val;
                              setState(() {});
                            }),

                        // Container(
                        //   height: 50,
                        //   // width: 200,
                        //   alignment: Alignment.center,
                        //   padding: EdgeInsets.only(left: 20, right: 20),

                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(color: Colors.black)),
                        //   child: DropdownButton(
                        //     elevation: 16,
                        //     padding: EdgeInsets.only(right: 1, left: 0),
                        //     underline: const SizedBox(),
                        //     isDense: true,

                        //     hint: Text("${_selectedLocation}"),
                        //     isExpanded: true,
                        //     //iconSize: 30.0,
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 20),
                        //     items: _locations.map(
                        //       (val) {
                        //         return DropdownMenuItem<String>(
                        //           value: val,
                        //           child: Center(child: Text(val)),
                        //         );
                        //       },
                        //     ).toList(),
                        //     onChanged: (val) {
                        //       setState(
                        //         () {
                        //           index = 0;
                        //           _selectedLocation = val!;
                        //         },
                        //       );
                        //     },
                        //   ),
                        // )
                      ]),
                ),
              ),
              // Row(
              //   children: [
              //     Expanded(
              //         child: ElevatedButton(
              //       onPressed: () => simvar ? getVariable() : null,
              //       style: ButtonStyle(
              //           backgroundColor: MaterialStatePropertyAll(
              //               simvar ? Colors.grey : Colors.blue),
              //           shape:
              //               MaterialStateProperty.all<RoundedRectangleBorder>(
              //                   RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(8.0),
              //                       side: BorderSide(color: Colors.grey)))),
              //       child: Text(
              //         "Simple",
              //         style:
              //             TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //       ),
              //     )),
              //     SizedBox(
              //       width: 10,
              //     ),
              //     Expanded(
              //         child: ElevatedButton(
              //       style: ButtonStyle(
              //           backgroundColor: MaterialStatePropertyAll(
              //               simvar ? Colors.blue : Colors.grey),
              //           shape:
              //               MaterialStateProperty.all<RoundedRectangleBorder>(
              //                   RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(8.0),
              //                       side: BorderSide(color: Colors.green)))),
              //       onPressed: () => simvar ? null : getVariable(),
              //       child: Text(
              //         "Variable",
              //         style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //             fontSize: 15),
              //       ),
              //     )),
              //   ],
              // ),
              // Visibility(
              //   visible: simvar,
              //   child: Column(
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Align(
              //               alignment: Alignment.centerLeft,
              //               child: Text(
              //                 "Attribute Name",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               )),
              //           Container(
              //               height: 50,
              //               margin: EdgeInsets.only(top: 5, bottom: 10),
              //               width: double.infinity,
              //               child: TextFormField(
              //                 autocorrect: true,
              //                 maxLines: 1,
              //                 //controller: number,
              //                 keyboardType: TextInputType.number,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //                 decoration: InputDecoration(
              //                     // label: Text("Contact No"),
              //                     // floatingLabelBehavior: FloatingLabelBehavior.always,
              //                     // floatingLabelStyle: TextStyle(),
              //                     hintText: "Enter Attribute",
              //                     hintStyle: TextStyle(
              //                         color: Colors.black, fontSize: 16),
              //                     contentPadding:
              //                         EdgeInsets.only(left: 15, bottom: 5),
              //                     focusedBorder: OutlineInputBorder(
              //                         borderSide: const BorderSide(
              //                             color: Colors.black, width: 2.0),
              //                         borderRadius: BorderRadius.circular(10)),
              //                     border: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(10),
              //                         borderSide: BorderSide(
              //                             color: Colors.black, width: 2))),
              //               )),
              //         ],
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Align(
              //               alignment: Alignment.centerLeft,
              //               child: Text(
              //                 "Variation",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               )),
              //           Container(
              //               height: 50,
              //               margin: EdgeInsets.only(top: 5, bottom: 10),
              //               width: double.infinity,
              //               child: TextFormField(
              //                 autocorrect: true,
              //                 maxLines: 1,
              //                 //controller: number,
              //                 keyboardType: TextInputType.number,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //                 decoration: InputDecoration(
              //                     // label: Text("Contact No"),
              //                     // floatingLabelBehavior: FloatingLabelBehavior.always,
              //                     // floatingLabelStyle: TextStyle(),
              //                     hintText: "Enter Variation",
              //                     hintStyle: TextStyle(
              //                         color: Colors.black, fontSize: 16),
              //                     contentPadding:
              //                         EdgeInsets.only(left: 15, bottom: 5),
              //                     focusedBorder: OutlineInputBorder(
              //                         borderSide: const BorderSide(
              //                             color: Colors.black, width: 2.0),
              //                         borderRadius: BorderRadius.circular(10)),
              //                     border: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(10),
              //                         borderSide: BorderSide(
              //                             color: Colors.black, width: 2))),
              //               )),
              //         ],
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Align(
              //               alignment: Alignment.centerLeft,
              //               child: Text(
              //                 "Price",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               )),
              //           Container(
              //               height: 50,
              //               margin: EdgeInsets.only(top: 5, bottom: 10),
              //               width: double.infinity,
              //               child: TextFormField(
              //                 autocorrect: true,
              //                 maxLines: 1,
              //                 //controller: number,
              //                 keyboardType: TextInputType.number,
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold),
              //                 decoration: InputDecoration(
              //                     // label: Text("Contact No"),
              //                     // floatingLabelBehavior: FloatingLabelBehavior.always,
              //                     // floatingLabelStyle: TextStyle(),
              //                     hintText: "Enter Price",
              //                     hintStyle: TextStyle(
              //                         color: Colors.black, fontSize: 16),
              //                     contentPadding:
              //                         EdgeInsets.only(left: 15, bottom: 5),
              //                     focusedBorder: OutlineInputBorder(
              //                         borderSide: const BorderSide(
              //                             color: Colors.black, width: 2.0),
              //                         borderRadius: BorderRadius.circular(10)),
              //                     border: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(10),
              //                         borderSide: BorderSide(
              //                             color: Colors.black, width: 2))),
              //               )),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

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
                      onPressed: () => provider.cloading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : submitForm(formKey),
                      child: provider.cloading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text("Submit",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)))),
              // SizedBox(
              //   height: 100,
              //   width: 100,
              //   child: _image != null ? Image.memory(_image!) : SizedBox(),
              //)
            ],
          ),
        ),
      ),
    );
  }
}

class OptionRadio extends StatefulWidget {
  final String? text;
  final int index;
  final int? selectedButton;
  final Function press;

  const OptionRadio({
    this.text,
    required this.index,
    this.selectedButton,
    required this.press,
  }) : super();

  @override
  OptionRadioPage createState() => OptionRadioPage();
}

class OptionRadioPage extends State<OptionRadio> {
  // QuestionController controllerCopy =QuestionController();

  int id = 1;
  bool? _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  int? _selected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.press(widget.index);
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  // height: 60.0,
                  child: Theme(
                data: Theme.of(context).copyWith(
                    unselectedWidgetColor: Colors.grey,
                    disabledColor: Colors.blue),
                child: Column(children: [
                  RadioListTile(
                    title: Text(
                      "${widget.text}",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      softWrap: true,
                    ),
                    /*Here the selectedButton which is null initially takes place of value after onChanged. Now, I need to clear the selected button when other button is clicked */
                    groupValue: widget.selectedButton,
                    value: widget.index,
                    activeColor: Colors.green,
                    onChanged: (val) async {
                      debugPrint('Radio button is clicked onChanged $val');
                      // setState(() {
                      //   debugPrint('Radio button setState $val');
                      //   selectedButton = val;
                      //   debugPrint('Radio button is clicked onChanged $widget.index');
                      // });
                      // SharedPreferences prefs = await SharedPreferences.getInstance();
                      // prefs.setInt('intValue', val);
                      widget.press(widget.index);
                    },
                    toggleable: true,
                  ),
                ]),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
