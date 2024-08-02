import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/static/static_url.dart';

import '../../../Provider_stateManegement/checkOutOrderProvider.dart';

class Scroll_Widget_home extends StatefulWidget {
  Scroll_Widget_home({super.key});

  @override
  State<Scroll_Widget_home> createState() => _Scroll_Widget_homeState();
}

class _Scroll_Widget_homeState extends State<Scroll_Widget_home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutOrderProvider>(builder: (context, vlu, child) {
      return vlu.userHomeModel!.messages!.status!.bannerdata!.length == 0
          ? SizedBox()
          : Material(
              color: Colors.white,
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: 250.0,
                        viewportFraction: 1,
                        reverse: false,
                        autoPlay: true,
                        onPageChanged: (int, reason) {
                          setState(() {
                            currentIndex = int;
                          });
                        }),
                    items: vlu.userHomeModel!.messages!.status!.bannerdata!
                        .map((i) {
                      // print(i["image"]);
                      return Builder(
                        builder: (BuildContext context) {
                          return CachedNetworkImage(
                            imageUrl:
                                "${iImageUrlDefault.img_base_url}/${i.image}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                              height: 50,
                              width: 50,
                              child: Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Center(child: Icon(Icons.error)),
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  DotsIndicator(
                    dotsCount:
                        vlu.userHomeModel!.messages!.status!.bannerdata!.length,
                    position: currentIndex,
                  )
                ],
              ),
            );
    });
  }
}
