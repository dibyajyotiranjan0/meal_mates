import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/view/screen/food/search_food.dart';
import 'package:syflex_mealmatess_user/view/widget/home/all_resturant_widget.dart';
import 'package:syflex_mealmatess_user/view/widget/home/category_widget.dart';
import 'package:syflex_mealmatess_user/view/widget/home/offer_fest_widget.dart';
import 'package:syflex_mealmatess_user/view/widget/home/scroll_widget.dart';

import '../../../Provider_stateManegement/checkOutOrderProvider.dart';
import '../../widget/notificatioScree.dart';

class HomePage_Screen extends StatefulWidget {
  HomePage_Screen({super.key});

  @override
  State<HomePage_Screen> createState() => _HomePage_ScreenState();
}

class _HomePage_ScreenState extends State<HomePage_Screen> {
  TextEditingController _search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    final provider = Provider.of<CheckoutOrderProvider>(context, listen: false);
    provider.GetHomeProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.pinkAccent,
                    ),
                    Center(
                      child: Text.rich(
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Change Location',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: ' Bhubaneswar',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchFood()));
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => NtificationScreen())),
            child: Icon(
              Icons.notifications,
              color: Colors.pink,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<CheckoutOrderProvider>(builder: (context, vlu, child) {
          return vlu.userHomeModel != null
              ? Column(
                  children: [
                    Scroll_Widget_home(),
                    OfferFestWidget(),
                    CategoryWidget(),
                    AllResturantWidget(),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }
}
