import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/api/repository/api_repository.dart';
import 'package:syflex_mealmatess_user/view/screen/sinin_scree.dart';
import 'package:syflex_mealmatess_user/view/widget/green_round_button.dart';
import 'package:syflex_mealmatess_user/view/widget/sinin/sinn_widgt.dart';

class FoodDeliveryFirst_screen extends StatelessWidget {
  const FoodDeliveryFirst_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black
          // image: DecorationImage(
          //     fit: BoxFit.fill,
          //     image: AssetImage("assets/logo/mealmates.png"))
          ),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_pin_circle,
                  size: 60,
                  color: Colors.white,
                ),
                Text(
                  "Food Delivery",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Round_Buttom_Green(
                onpressed: () =>
                    SyflexMealmatesRepository().GetStarted(context),
                color: Colors.green,
                text: "Get Started",
              ),
            )
          ],
        ),
      ),
    );
  }
}
