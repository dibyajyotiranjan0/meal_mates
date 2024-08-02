import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/view/widget/foods/addto_cart_food_iteams.dart';
import 'package:syflex_mealmatess_user/view/widget/foods/search_foods_item_textfield.dart';

import '../../../Provider_stateManegement/categoryProvider.dart';

class CategoryFoodItem extends StatefulWidget {
  String cat_id;
  CategoryFoodItem({required this.cat_id, super.key});

  @override
  State<CategoryFoodItem> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<CategoryFoodItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Category Wise Resturant Food",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodItem_AddtoCart(
              cat_id: widget.cat_id,
            ),
          ],
        ),
      ),
    );
  }
}
