import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  Icon? icon;
  String tiitle;
  void ontap;
  String? img;
  AppbarWidget(
      {this.icon, required this.tiitle, this.ontap, this.img, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => ontap,
        child: icon == null
            ? SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/logo/mealmates.png"),
                ),
              )
            : icon,
      ),
      title: Text(
        tiitle,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
