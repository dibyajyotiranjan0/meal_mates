import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syflex_meamates/api/repository/api_repository.dart';
import 'package:syflex_meamates/model/allorder_deliverybooy.dart';
import 'package:syflex_meamates/model/neworder_deliverboy.dart';
import 'package:syflex_meamates/model/neworder_deliverboy.dart';
import 'package:syflex_meamates/model/neworder_deliverboy.dart';
import 'package:syflex_meamates/model/userlog_profile.dart';

class OrderProvider extends ChangeNotifier {
  bool isloading = true;
  bool cloading = false;
  NewOrderDeieryboy? newOrderDeieryboy;
  AllOrderDeliveryboy? allOrderDeliveryboy;

  cvalueTrueFalse() {
    cloading = !cloading;
    notifyListeners();
  }

  deliveryBoyNewordeer({area}) async {
    // cvalueTrueFalse();

    var bht =
        await SyflexMealmatesRepository().newOrdeerDeliveryboy(area: area);

    // print(bht);
    newOrderDeieryboy = await NewOrderDeieryboy.fromJson(bht);
    // cvalueTrueFalse();
    // notifyListeners();
    notifyListeners();
  }

  deliveryBoyOrderUpdate({orderid, status}) async {
    // cvalueTrueFalse();

    await SyflexMealmatesRepository()
        .deliveryboyOderStatusUpdate(orderId: orderid, ststus: status);
    deliveryBoyNewordeer(area: "rasulgarh");
    // print(bht);
    // newOrderDeieryboy = await NewOrderDeieryboy.fromJson(bht);
    // cvalueTrueFalse();
    // notifyListeners();
    notifyListeners();
  }

  deliveryBoyAllordeer() async {
    // cvalueTrueFalse();

    var bht = await SyflexMealmatesRepository().allOrdeerDeliveryboy();

    // print(bht);
    allOrderDeliveryboy = await AllOrderDeliveryboy.fromJson(bht);
    // cvalueTrueFalse();
    notifyListeners();
    // notifyListeners();
  }
}
