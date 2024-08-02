import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/static/custom_color.dart';
import 'package:syflex_mealmatess_user/view/screen/Signup_screen.dart';
import 'package:syflex_mealmatess_user/view/widget/sinin/sinn_widgt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    var width = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: ColorSelect.white,
          // height: height * 10.0,
          // width: width * 10,
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  SineInWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Not yet a member,",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            "Signup",
                            style: TextStyle(
                                color: Colors.pinkAccent, fontSize: 18),
                          ))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
