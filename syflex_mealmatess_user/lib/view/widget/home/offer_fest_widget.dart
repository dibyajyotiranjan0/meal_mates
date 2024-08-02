import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syflex_mealmatess_user/Provider_stateManegement/checkOutOrderProvider.dart';
import 'package:syflex_mealmatess_user/static/static_url.dart';

class OfferFestWidget extends StatelessWidget {
  OfferFestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 18, left: 8, bottom: 8),
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.local_offer_outlined),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "Offer Fest",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * 7,
            child:
                Consumer<CheckoutOrderProvider>(builder: (context, vlu, child) {
              return vlu.userHomeModel!.messages!.status!.offerdata!.length != 0
                  ? ListView.builder(
                      itemCount: vlu
                          .userHomeModel!.messages!.status!.offerdata!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          // height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            // image: DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image: AssetImage("${iteams[int]}"))
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${iImageUrlDefault.img_base_url}/${vlu.userHomeModel!.messages!.status!.offerdata![int].image}",
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
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        );
                      })
                  : SizedBox();
            }),
          )
        ],
      ),
    );
  }
}
