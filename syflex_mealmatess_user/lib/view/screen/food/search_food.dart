import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/view/widget/foods/addto_cart_food_iteams.dart';
import 'package:syflex_mealmatess_user/view/widget/foods/search_foods_item_textfield.dart';

class SearchFood extends StatefulWidget {
  String? item;
  String? hotel_name;
  SearchFood({this.item, this.hotel_name, super.key});

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Search Fods",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFood_Textfield(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    widget.item != null || widget.hotel_name != null
                        ? widget.item != null
                            ? widget.item.toString()
                            : widget.hotel_name.toString()
                        : "Recommended",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                FoodItem_AddtoCart(
                  cat_id: "92",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
