// To parse this JSON data, do
//
//     final allOrderDeliveryboy = allOrderDeliveryboyFromJson(jsonString);

import 'dart:convert';

AllOrderDeliveryboy allOrderDeliveryboyFromJson(String str) =>
    AllOrderDeliveryboy.fromJson(json.decode(str));

String allOrderDeliveryboyToJson(AllOrderDeliveryboy data) =>
    json.encode(data.toJson());

class AllOrderDeliveryboy {
  int status;
  bool error;
  String message;
  Data data;

  AllOrderDeliveryboy({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  factory AllOrderDeliveryboy.fromJson(Map<String, dynamic> json) =>
      AllOrderDeliveryboy(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Orderdtl> orderdtls;

  Data({
    required this.orderdtls,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderdtls: List<Orderdtl>.from(
            json["Orderdtls"].map((x) => Orderdtl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Orderdtls": List<dynamic>.from(orderdtls.map((x) => x.toJson())),
      };
}

class Orderdtl {
  String ordersId;
  String orderId;
  DateTime orderDate;
  String status;
  String addressId;
  dynamic logoImage;
  String customerContactNo;
  String customerFullName;
  String restaurantContactNo;
  String restaurantName;
  String totalAmount;
  String totalQty;
  List<OrderDtl> orderDtls;
  List<AddressDtl> addressDtls;

  Orderdtl({
    required this.ordersId,
    required this.orderId,
    required this.orderDate,
    required this.status,
    required this.addressId,
    required this.logoImage,
    required this.customerContactNo,
    required this.customerFullName,
    required this.restaurantContactNo,
    required this.restaurantName,
    required this.totalAmount,
    required this.totalQty,
    required this.orderDtls,
    required this.addressDtls,
  });

  factory Orderdtl.fromJson(Map<String, dynamic> json) => Orderdtl(
        ordersId: json["orders_id"],
        orderId: json["order_id"],
        orderDate: DateTime.parse(json["order_date"]),
        status: json["status"],
        addressId: json["address_id"],
        logoImage: json["logo_image"],
        customerContactNo: json["customer_contact_no"],
        customerFullName: json["customer_full_name"],
        restaurantContactNo: json["restaurant_contact_no"],
        restaurantName: json["restaurant_name"],
        totalAmount: json["total_amount"],
        totalQty: json["total_qty"],
        orderDtls: List<OrderDtl>.from(
            json["order_dtls"].map((x) => OrderDtl.fromJson(x))),
        addressDtls: List<AddressDtl>.from(
            json["address_dtls"].map((x) => AddressDtl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders_id": ordersId,
        "order_id": orderId,
        "order_date": orderDate.toIso8601String(),
        "status": status,
        "address_id": addressId,
        "logo_image": logoImage,
        "customer_contact_no": customerContactNo,
        "customer_full_name": customerFullName,
        "restaurant_contact_no": restaurantContactNo,
        "restaurant_name": restaurantName,
        "total_amount": totalAmount,
        "total_qty": totalQty,
        "order_dtls": List<dynamic>.from(orderDtls.map((x) => x.toJson())),
        "address_dtls": List<dynamic>.from(addressDtls.map((x) => x.toJson())),
      };
}

class AddressDtl {
  String addressId;
  String userId;
  String firstName;
  String lastName;
  String cityname;
  String state;
  String pincode;
  String email;
  String number;
  String address1;
  String adress2;
  String isDelte;
  dynamic lat;
  dynamic lng;
  DateTime createdDate;
  DateTime updatdDare;

  AddressDtl({
    required this.addressId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.cityname,
    required this.state,
    required this.pincode,
    required this.email,
    required this.number,
    required this.address1,
    required this.adress2,
    required this.isDelte,
    required this.lat,
    required this.lng,
    required this.createdDate,
    required this.updatdDare,
  });

  factory AddressDtl.fromJson(Map<String, dynamic> json) => AddressDtl(
        addressId: json["address_id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        cityname: json["cityname"],
        state: json["state"],
        pincode: json["pincode"],
        email: json["email"],
        number: json["number"],
        address1: json["address1"],
        adress2: json["adress2"],
        isDelte: json["is_delte"],
        lat: json["lat"],
        lng: json["lng"],
        createdDate: DateTime.parse(json["created_date"]),
        updatdDare: DateTime.parse(json["updatd_dare"]),
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "cityname": cityname,
        "state": state,
        "pincode": pincode,
        "email": email,
        "number": number,
        "address1": address1,
        "adress2": adress2,
        "is_delte": isDelte,
        "lat": lat,
        "lng": lng,
        "created_date": createdDate.toIso8601String(),
        "updatd_dare": updatdDare.toIso8601String(),
      };
}

class OrderDtl {
  String ordersId;
  String productname;
  dynamic variationId;
  String qty;
  String img;
  String price;
  String userId;
  dynamic shippingType;
  dynamic shippingCharge;
  String orderId;
  String addressId;
  String paymentMode;
  String status;
  dynamic reason;
  String wallet;
  dynamic txnId;
  String couponCode;
  String couponAmnt;
  String centerId;
  String deliveryboy;
  dynamic otp;
  DateTime createdDate;
  DateTime updateDate;

  OrderDtl({
    required this.ordersId,
    required this.productname,
    required this.variationId,
    required this.qty,
    required this.img,
    required this.price,
    required this.userId,
    required this.shippingType,
    required this.shippingCharge,
    required this.orderId,
    required this.addressId,
    required this.paymentMode,
    required this.status,
    required this.reason,
    required this.wallet,
    required this.txnId,
    required this.couponCode,
    required this.couponAmnt,
    required this.centerId,
    required this.deliveryboy,
    required this.otp,
    required this.createdDate,
    required this.updateDate,
  });

  factory OrderDtl.fromJson(Map<String, dynamic> json) => OrderDtl(
        ordersId: json["orders_id"],
        productname: json["productname"],
        variationId: json["variation_id"],
        qty: json["qty"],
        img: json["img"],
        price: json["price"],
        userId: json["user_id"],
        shippingType: json["shipping_type"],
        shippingCharge: json["shipping_charge"],
        orderId: json["order_id"],
        addressId: json["address_id"],
        paymentMode: json["payment_mode"],
        status: json["status"],
        reason: json["reason"],
        wallet: json["wallet"],
        txnId: json["txn_id"],
        couponCode: json["coupon_code"],
        couponAmnt: json["coupon_amnt"],
        centerId: json["center_id"],
        deliveryboy: json["deliveryboy"],
        otp: json["otp"],
        createdDate: DateTime.parse(json["created_date"]),
        updateDate: DateTime.parse(json["update_date"]),
      );

  Map<String, dynamic> toJson() => {
        "orders_id": ordersId,
        "productname": productname,
        "variation_id": variationId,
        "qty": qty,
        "img": img,
        "price": price,
        "user_id": userId,
        "shipping_type": shippingType,
        "shipping_charge": shippingCharge,
        "order_id": orderId,
        "address_id": addressId,
        "payment_mode": paymentMode,
        "status": status,
        "reason": reason,
        "wallet": wallet,
        "txn_id": txnId,
        "coupon_code": couponCode,
        "coupon_amnt": couponAmnt,
        "center_id": centerId,
        "deliveryboy": deliveryboy,
        "otp": otp,
        "created_date": createdDate.toIso8601String(),
        "update_date": updateDate.toIso8601String(),
      };
}
