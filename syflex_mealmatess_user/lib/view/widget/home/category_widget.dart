import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/static/static_url.dart';
import 'package:syflex_mealmatess_user/view/screen/food/search_food.dart';

import '../../screen/food/category_food_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 18, left: 8, bottom: 18),
      child: Consumer<CheckoutOrderProvider>(builder: (context, vlu, child) {
        return vlu.userHomeModel!.messages!.status!.categorydata!.length != 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 1,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: .8,
                          // mainAxisSpacing: 10,
                          // crossAxisSpacing: 10
                        ),
                        itemCount: vlu.userHomeModel!.messages!.status!
                            .categorydata!.length,
                        itemBuilder: (context, int) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoryFoodItem(
                                            cat_id: vlu
                                                .userHomeModel!
                                                .messages!
                                                .status!
                                                .categorydata![int]
                                                .catId
                                                .toString(),
                                          )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                vlu.userHomeModel!.messages!.status!
                                            .categorydata![int].catImg !=
                                        null
                                    ? Container(
                                        height: 60,
                                        width: 60,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: CachedNetworkImageProvider(
                                                '${iImageUrlDefault.img_base_url}/${vlu.userHomeModel!.messages!.status!.categorydata![int].catImg}',
                                                // progressIndicatorBuilder:
                                                //     (context, url, downloadProgress) => SizedBox(
                                                //   height: 50,
                                                //   width: 50,
                                                //   child: CircularProgressIndicator(
                                                //       value: downloadProgress.progress),
                                                // ),
                                                // errorWidget: (context, url, error) =>
                                                //     Center(child: Icon(Icons.error)),
                                                // fit: BoxFit.cover,
                                              ),
                                            )), // child: Image.network(
                                        //   "${iImageUrlDefault.img_base_url + categoryData[int]["cat_img"]}",
                                        //   fit: BoxFit.fill,
                                        // ),
                                        //child: Image.asset("assets/logo/mealmates.png"),
                                      )
                                    : Container(
                                        width: 60,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.image),
                                      ),
                                vlu.userHomeModel!.messages!.status!
                                            .categorydata![int].catName !=
                                        null
                                    ? Text(
                                        "${vlu.userHomeModel!.messages!.status!.categorydata![int].catName}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          );
                        }),
                    // child: ListView.builder(
                    //     itemCount: categoryData.length,
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, int) {
                    //       return Column(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           InkWell(
                    //             onTap: () {
                    //               Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => SearchFood()));
                    //             },
                    //             child: Column(
                    //               children: [
                    //                 Container(
                    //                   height: 50,
                    //                   width: 50,
                    //                   margin: EdgeInsets.all(10),
                    //                   child: CircleAvatar(
                    //                       radius: 20,
                    //                       backgroundImage: NetworkImage(
                    //                           '${iImageUrlDefault.img_base_url + categoryData[int]["cat_img"]}')),
                    //                   // child: Image.network(
                    //                   //   "${iImageUrlDefault.img_base_url + categoryData[int]["cat_img"]}",
                    //                   //   fit: BoxFit.fill,
                    //                   // ),
                    //                   //child: Image.asset("assets/logo/mealmates.png"),
                    //                 ),
                    //                 Text(
                    //                   "Pizza",
                    //                   style: TextStyle(
                    //                       fontSize: 12, fontWeight: FontWeight.bold),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //           InkWell(
                    //             child: Column(
                    //               children: [
                    //                 Container(
                    //                   height: 50,
                    //                   width: 50,
                    //                   margin: EdgeInsets.all(10),
                    //                   decoration: BoxDecoration(shape: BoxShape.circle),
                    //                   child: Image.asset("assets/icon/google_icon.png"),
                    //                 ),
                    //                 Text(
                    //                   "Pizza",
                    //                   style: TextStyle(
                    //                       fontSize: 12, fontWeight: FontWeight.bold),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       );
                    //     }),
                  )
                ],
              )
            : SizedBox();
      }),
    );
  }
}
