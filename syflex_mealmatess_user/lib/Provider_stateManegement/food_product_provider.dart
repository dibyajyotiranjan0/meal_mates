import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/api/model/all_address-model.dart';
import 'package:syflex_mealmatess_user/api/model/all_address-model.dart';
import 'package:syflex_mealmatess_user/api/model/singleResturant_fod_item.dart';
import '../api/model/get_location_model.dart';
import '../api/repository/api_repository.dart';

class FoodItemProvider extends ChangeNotifier {
  bool cloading = false;
  SingeResturantFoodItem? singeResturantFoodItem;

  GetAllLocationModel? getAllLocationModel;
  singleResturantFoodItems({required String restaurant_id}) async {
    cloading = true;
    var itemList = await SyflexMealmatesRepository()
        .singleResturantFoodItem(restaurant_id);
    //print(productslist);
    singeResturantFoodItem = SingeResturantFoodItem.fromJson(itemList);

    cloading = false;
    notifyListeners();
  }

  getAllLocation() async {
    cloading = true;
    var itemList = await SyflexMealmatesRepository().getLocationData();
    //print(productslist);
    getAllLocationModel = GetAllLocationModel.fromJson(itemList);
    cloading = false;
    notifyListeners();
  }
}
