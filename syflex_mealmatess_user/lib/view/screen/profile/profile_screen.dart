import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/user_home.dart';
import 'package:syflex_mealmatess_user/view/screen/food_delivery_screen_first.dart';
import 'package:syflex_mealmatess_user/view/screen/sinin_scree.dart';

import '../../widget/notificatioScree.dart';

class Profile_screen extends StatefulWidget {
  const Profile_screen({super.key});

  @override
  State<Profile_screen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Profile_screen> {
  @override
  void initState() {
    // TODO: implement initState
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.viewProfle();

    super.initState();
  }

  List<Map<String, dynamic>> profile = [
    {"icon": Icons.location_on, "name": "Address"},
    {"icon": Icons.notifications, "name": "Notification"},
    {"icon": Icons.settings, "name": "Settings"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo/mealmates.png"),
            ),
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(builder: (context, contrains) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<UserProvider>(builder: (context, va, child) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            )
                          ]),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: contrains.maxHeight * 0.2,
                                    width: contrains.maxWidth * 0.3,
                                    // margin: EdgeInsets.all(5),
                                    //padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.red, width: 3),
                                      // image: DecorationImage(
                                      //     fit: BoxFit.fill,
                                      //     image: AssetImage("assets/image/logo.jpeg")
                                      //     )
                                    ),
                                    child: Stack(children: [
                                      Container(
                                        // height: 60,
                                        // width: 60,
                                        margin: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // color: const Color.fromARGB(255, 223, 170, 170),
                                            // border:
                                            // Border.all(color: Colors.pink, width: 3),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/logo/mealmates.png"))),
                                        // child: FittedBox(
                                        //     child: Image.asset(
                                        //   "assets/image/mealmates.png",
                                        //   fit: BoxFit.cover,
                                        // )),
                                      ),
                                      Positioned(
                                          bottom: 8,
                                          right: 5,
                                          child: Container(
                                            color: Colors.white,
                                            padding: EdgeInsets.all(0.4),
                                            child: Icon(
                                              Icons.edit_square,
                                              color: Colors.pink[600],
                                            ),
                                          )),
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${va.vieProfileModel!.messages!.status!.fullname ?? ""}",
                                          style: TextStyle(
                                              color: Colors.pink[600],
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "+91 ${va.vieProfileModel!.messages!.status!.contact ?? 1234567892}",
                                          style: TextStyle(
                                              color: Colors.pink[600],
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListTile(
                            textColor: Colors.black,
                            iconColor: Colors.black,
                            titleAlignment: ListTileTitleAlignment.center,
                            //contentPadding: EdgeInsets.only(left: 50),
                            //tileColor: Colors.white,
                            minLeadingWidth: 0,
                            dense: true,
                            visualDensity: VisualDensity(vertical: 3),
                            leading: Icon(
                              Icons.location_on_outlined,
                              size: 25,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                            // shape: Border(
                            //   bottom:
                            //       BorderSide(width: 2, color: Colors.grey.shade100),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          child: Center(
                              child: Divider(
                            color: Colors.grey.shade200,
                          )),
                        ),
                        SizedBox(
                          height: 60,
                          child: ListTile(
                            textColor: Colors.black,
                            iconColor: Colors.black,
                            titleAlignment: ListTileTitleAlignment.center,
                            //contentPadding: EdgeInsets.only(left: 50),
                            //tileColor: Colors.white,
                            minLeadingWidth: 0,
                            dense: true,
                            visualDensity: VisualDensity(vertical: 3),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NtificationScreen())),
                            leading: Icon(
                              Icons.notifications,
                              size: 25,
                              color: Colors.black54,
                            ),
                            title: Text(
                              "Notifications",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                            // shape: Border(
                            //   bottom:
                            //       BorderSide(width: 2, color: Colors.grey.shade100),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          child: Center(
                              child: Divider(
                            color: Colors.grey.shade200,
                          )),
                        ),
                        SizedBox(
                          height: 60,
                          child: ListTile(
                            textColor: Colors.black,
                            iconColor: Colors.black,
                            titleAlignment: ListTileTitleAlignment.center,
                            //contentPadding: EdgeInsets.only(left: 50),
                            //tileColor: Colors.white,
                            minLeadingWidth: 0,
                            dense: true,
                            visualDensity: VisualDensity(vertical: 3),
                            leading: Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.black54,
                            ),
                            title: Text(
                              "Settings",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                            // shape: Border(
                            //   bottom:
                            //       BorderSide(width: 2, color: Colors.grey.shade100),
                            // ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Center(
                              child: Divider(
                            color: Colors.grey.shade200,
                          )),
                        ),
                        SizedBox(
                          height: 50,
                          child: ListTile(
                            onTap: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('user_id');
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                              setState(() {});
                            },
                            textColor: Colors.pinkAccent,
                            iconColor: Colors.pinkAccent,
                            titleAlignment: ListTileTitleAlignment.center,
                            //contentPadding: EdgeInsets.only(left: 50),
                            //tileColor: Colors.white,
                            minLeadingWidth: 0,
                            dense: true,
                            visualDensity: VisualDensity(vertical: 3),
                            leading: Icon(
                              Icons.power_settings_new_outlined,
                              size: 25,
                            ),
                            title: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            // shape: Border(
                            //   bottom:
                            //       BorderSide(width: 2, color: Colors.grey.shade100),
                            // ),
                          ),
                        )
                      ],
                    )
                  ]);
            }),
          ),
        );
      }),
    );
  }
}
