import 'package:flutter/material.dart';
import 'package:syflex_mealmates_resturant/documents_detailsPage.dart';
import 'package:syflex_mealmates_resturant/home_screen.dart';
import 'package:syflex_mealmates_resturant/myprofile_page.dart';
import 'package:syflex_mealmates_resturant/resturant_detaills_page.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, IconData>> sbCategoryicon = [
    {
      "icon": Icons.home,
    },
    {"icon": Icons.account_circle},
    {"icon": Icons.restaurant},
    {"icon": Icons.description},
    {"icon": Icons.settings},
    {"icon": Icons.history},
    {"icon": Icons.account_balance_wallet},
    {"icon": Icons.money},
    {"icon": Icons.logout}
  ];

  List<Map<String, dynamic>> sbCategory = [
    {"menu": "Home"},
    {"menu": "My Profile"},
    {"menu": "Resturant Details"},
    {"menu": "Documents"},
    {"menu": "Gallery"},
    {"menu": "Order History"},
    {"menu": "Wallet"},
    {"menu": "Withdraw"},
    {"menu": "logout"}
  ];
  List<Map<String, void Function(BuildContext context)>> sbCategoryfuction = [
    {
      "onpress": (context) {
        // print("Error");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    },
    {
      "onpress": (context) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MyPrfileScreeen()))
    },
    {
      "onpress": (context) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResturantPageScreeen()))
    },
    {
      "onpress": (context) => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DocumentDetailsPage()))
    },
    {"onpress": (context) => null},
    {"onpress": (context) => null},
    {"onpress": (context) => null},
    {"onpress": (context) => null},
    {"onpress": (context) => null}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 5,
        automaticallyImplyLeading: false,

        // leading: InkWell(
        //   child: Icon(Icons.arrow_back),
        // ),
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        // margin: EdgeInsets.all(5),
                        //padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.red, width: 3),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Samir Sahoo",
                            style: TextStyle(
                                color: Colors.pink[600],
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "+91 1234567892",
                            style: TextStyle(
                                color: Colors.pink[600],
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ]),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (context, int) {
                    return ListTile(
                      onTap: () => sbCategoryfuction[int]["onpress"]!(context),
                      textColor: Colors.black,
                      iconColor: Colors.black,
                      contentPadding: EdgeInsets.only(left: 50),
                      tileColor: Colors.white,
                      minLeadingWidth: 0,
                      leading: Icon(
                        sbCategoryicon[int]["icon"],
                        size: 20,
                        color: Colors.black87,
                      ),
                      title: Text(
                        sbCategory[int]["menu"],
                        style: TextStyle(
                            color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      shape: Border(
                        bottom:
                            BorderSide(width: 2, color: Colors.grey.shade100),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
