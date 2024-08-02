import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:syflex_mealmatess_user/view/widget/home/resturantScree.dart';
import 'package:syflex_mealmatess_user/view/widget/home/resturant_single_screen.dart';
import 'package:syflex_mealmatess_user/view/widget/home/scroll_widget.dart';

class AllResturantWidget extends StatefulWidget {
  AllResturantWidget({super.key});

  @override
  State<AllResturantWidget> createState() => _AllResturantWidgetState();
}

class _AllResturantWidgetState extends State<AllResturantWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> _locations = ['+91', '+1', '+92', '+0'];
  var _selectedLocation = "+91";
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        initialIndex: index,
        length: 3,
        vsync: this,
        animationDuration: Duration.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "All Resturant",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResturantScreen()));
                  },
                  child: Text(
                    "See all",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 18),
                  ))
            ],
          ),
          ResturantSingleScreen()
          //     SizedBox(
          //       height: 50,
          //       child: TabBar(
          //         controller: tabController,
          //         isScrollable: false,
          //         //indicatorSize: TabBarIndicatorSize.tab,
          //         //dividerColor: Colors.white,
          //         indicator: BoxDecoration(
          //           //color: Colors.white,
          //           borderRadius: BorderRadius.circular(10),
          //           // shape: BoxShape.circle
          //         ),
          //         labelColor: Colors.white, //text of labs
          //         labelStyle: TextStyle(fontWeight: FontWeight.bold),
          //         onTap: (value) {
          //           index = value;
          //           setState(() {});
          //         },
          //         tabs: [
          //           Tab(
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: index == 0 ? Colors.pinkAccent[100] : Colors.white,
          //               ),
          //               // padding: EdgeInsets.all(15),
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     height: 50,
          //                     child: Center(
          //                       child: DropdownButton(
          //                         //elevation: 16,
          //                         padding: EdgeInsets.only(right: 1, left: 0),
          //                         underline: const SizedBox(),
          //                         isDense: true,
          //                         //alignment: Alignment.centerRight,
          //                         hint: Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceBetween,
          //                           crossAxisAlignment: CrossAxisAlignment.center,
          //                           children: [
          //                             Icon(
          //                               Icons.swap_horiz,
          //                               color: Colors.black,
          //                             ),
          //                             Align(
          //                               alignment: Alignment.center,
          //                               child: Text(
          //                                 "sort",
          //                                 style: TextStyle(
          //                                   fontSize: 18,
          //                                 ),
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                         // isExpanded: true,
          //                         // iconSize: 30.0,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 20),
          //                         items: _locations.map(
          //                           (val) {
          //                             return DropdownMenuItem<String>(
          //                               alignment: Alignment.bottomRight,
          //                               value: val,
          //                               child: Center(child: Text(val)),
          //                             );
          //                           },
          //                         ).toList(),
          //                         onChanged: (val) {
          //                           setState(
          //                             () {
          //                               index = 0;
          //                               _selectedLocation = val!;
          //                             },
          //                           );
          //                         },
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Tab(
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: index == 1 ? Colors.pinkAccent : Colors.grey,
          //               ),
          //               // padding: EdgeInsets.all(15),
          //               child: Align(
          //                 alignment: Alignment.center,
          //                 child: Text(
          //                   "processing",
          //                 ),
          //               ),
          //             ),
          //           ),
          //           Tab(
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: index == 2 ? Colors.pinkAccent : Colors.grey,
          //               ),
          //               // padding: EdgeInsets.all(15),
          //               child: Align(
          //                 alignment: Alignment.center,
          //                 child: Text(
          //                   "Complete",
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     SizedBox(
          //       height: 1200,
          //       // child: TabBarView(
          //       //   controller: tabController,
          //       //   children: [
          //       //     // Container(
          //       //     //   color: Colors.red,
          //       //     // ),
          //       //     ResturantSingleScreen(),
          //       //     SizedBox(),
          //       //     SizedBox()
          //       //   ],
          //       ),
          //     )
        ],
      ),
    );
  }
}
