import 'package:flutter/material.dart';
import 'package:syflex_mealmates_resturant/api/repository/api_repository.dart';
import 'package:syflex_mealmates_resturant/model/resturant_product_mdel.dart';
import 'package:syflex_mealmates_resturant/model/singleProductdetails.dart';

class ResturantproductProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  Resturant_product_listt? resturantproducts;
  GetSingleProductResturant? singleProduct;
  getproduct() async {
    var productslist = await SyflexMealmatesRepository().Allproduct();
    //print(productslist);
    resturantproducts = Resturant_product_listt.fromJson(productslist);

    isloading = false;
    notifyListeners();
  }

  getSingleproduct(productID) async {
    cloading = true;
    var productslist =
        await SyflexMealmatesRepository().GetSingleProduct(productID);
    // print(productslist);
    singleProduct = GetSingleProductResturant.fromJson(productslist);
    cloading = false;
    // isloading = false;
    notifyListeners();
  }

  // getSingleProductUpdate(String product_id, String status) async {
  //   cloading = true;
  //   await SyflexMealmatesRepository().ProductStatusUpdate(product_id, status);
  //   getproduct();
  //   cloading = false;
  //   notifyListeners();
  // }

  getSingleProductStsUpdate(String product_id, String status) async {
    cloading = true;
    await SyflexMealmatesRepository().ProductStatusUpdate(product_id, status);
    getSingleproduct(product_id);
    // getproduct();
    cloading = false;
    notifyListeners();
  }
}
