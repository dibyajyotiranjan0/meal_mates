import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/view/widget/home/resturant_single_screen.dart';

class ResturantScreen extends StatelessWidget {
  ResturantScreen({super.key});

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
          "All restuurant",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<CheckoutOrderProvider>(builder: (context, vlu, child) {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  vlu.userHomeModel!.messages!.status!.restaurantdata!.length,
              itemBuilder: (context, index) {
                return ResturantSingleScreen();
              });
        }),
      ),
    );
  }
}
