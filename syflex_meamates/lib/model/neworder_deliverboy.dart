// To parse this JSON data, do
//
//     final newOrderDeieryboy = newOrderDeieryboyFromJson(jsonString);

import 'dart:convert';

NewOrderDeieryboy newOrderDeieryboyFromJson(String str) =>
    NewOrderDeieryboy.fromJson(json.decode(str));

String newOrderDeieryboyToJson(NewOrderDeieryboy data) =>
    json.encode(data.toJson());

class NewOrderDeieryboy {
  int? status;
  bool? error;
  String? message;
  Data? data;

  NewOrderDeieryboy({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory NewOrderDeieryboy.fromJson(Map<String, dynamic> json) =>
      NewOrderDeieryboy(
        status: json["status"],
        error: json["error"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<Orderdtl>? orderdtls;

  Data({
    this.orderdtls,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderdtls: json["Orderdtls"] == null
            ? []
            : List<Orderdtl>.from(
                json["Orderdtls"]!.map((x) => Orderdtl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Orderdtls": orderdtls == null
            ? []
            : List<dynamic>.from(orderdtls!.map((x) => x.toJson())),
      };
}

class Orderdtl {
  String? ordersId;
  String? orderId;
  DateTime? orderDate;
  String? status;
  String? addressId;
  dynamic logoImage;
  String? customerContactNo;
  String? customerFullName;
  String? restaurantName;
  String? restaurantContactNo;
  String? area;
  String? totalAmount;
  String? totalQty;
  List<OrderDtl>? orderDtls;
  List<AddressDtl>? addressDtls;

  Orderdtl({
    this.ordersId,
    this.orderId,
    this.orderDate,
    this.status,
    this.addressId,
    this.logoImage,
    this.customerContactNo,
    this.customerFullName,
    this.restaurantName,
    this.restaurantContactNo,
    this.area,
    this.totalAmount,
    this.totalQty,
    this.orderDtls,
    this.addressDtls,
  });

  factory Orderdtl.fromJson(Map<String, dynamic> json) => Orderdtl(
        ordersId: json["orders_id"],
        orderId: json["order_id"],
        orderDate: json["order_date"] == null
            ? null
            : DateTime.parse(json["order_date"]),
        status: json["status"],
        addressId: json["address_id"],
        logoImage: json["logo_image"],
        customerContactNo: json["customer_contact_no"],
        customerFullName: json["customer_full_name"],
        restaurantName: json["restaurant_name"],
        restaurantContactNo: json["restaurant_contact_no"],
        area: json["area"],
        totalAmount: json["total_amount"],
        totalQty: json["total_qty"],
        orderDtls: json["order_dtls"] == null
            ? []
            : List<OrderDtl>.from(
                json["order_dtls"]!.map((x) => OrderDtl.fromJson(x))),
        addressDtls: json["address_dtls"] == null
            ? []
            : List<AddressDtl>.from(
                json["address_dtls"]!.map((x) => AddressDtl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders_id": ordersId,
        "order_id": orderId,
        "order_date": orderDate?.toIso8601String(),
        "status": status,
        "address_id": addressId,
        "logo_image": logoImage,
        "customer_contact_no": customerContactNo,
        "customer_full_name": customerFullName,
        "restaurant_name": restaurantName,
        "restaurant_contact_no": restaurantContactNo,
        "area": area,
        "total_amount": totalAmount,
        "total_qty": totalQty,
        "order_dtls": orderDtls == null
            ? []
            : List<dynamic>.from(orderDtls!.map((x) => x.toJson())),
        "address_dtls": addressDtls == null
            ? []
            : List<dynamic>.from(addressDtls!.map((x) => x.toJson())),
      };
}

class AddressDtl {
  String? addressId;
  String? userId;
  String? firstName;
  String? lastName;
  String? cityname;
  String? state;
  String? pincode;
  String? email;
  String? number;
  String? address1;
  String? adress2;
  String? isDelte;
  dynamic lat;
  dynamic lng;
  DateTime? createdDate;
  DateTime? updatdDare;

  AddressDtl({
    this.addressId,
    this.userId,
    this.firstName,
    this.lastName,
    this.cityname,
    this.state,
    this.pincode,
    this.email,
    this.number,
    this.address1,
    this.adress2,
    this.isDelte,
    this.lat,
    this.lng,
    this.createdDate,
    this.updatdDare,
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
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        updatdDare: json["updatd_dare"] == null
            ? null
            : DateTime.parse(json["updatd_dare"]),
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
        "created_date": createdDate?.toIso8601String(),
        "updatd_dare": updatdDare?.toIso8601String(),
      };
}

class OrderDtl {
  String? ordersId;
  String? productname;
  dynamic variationId;
  String? qty;
  String? img;
  String? price;
  String? userId;
  dynamic shippingType;
  dynamic shippingCharge;
  String? orderId;
  String? addressId;
  String? paymentMode;
  String? status;
  dynamic reason;
  String? wallet;
  dynamic txnId;
  String? couponCode;
  String? couponAmnt;
  String? centerId;
  dynamic deliveryboy;
  dynamic otp;
  DateTime? createdDate;
  DateTime? updateDate;

  OrderDtl({
    this.ordersId,
    this.productname,
    this.variationId,
    this.qty,
    this.img,
    this.price,
    this.userId,
    this.shippingType,
    this.shippingCharge,
    this.orderId,
    this.addressId,
    this.paymentMode,
    this.status,
    this.reason,
    this.wallet,
    this.txnId,
    this.couponCode,
    this.couponAmnt,
    this.centerId,
    this.deliveryboy,
    this.otp,
    this.createdDate,
    this.updateDate,
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
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        updateDate: json["update_date"] == null
            ? null
            : DateTime.parse(json["update_date"]),
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
        "created_date": createdDate?.toIso8601String(),
        "update_date": updateDate?.toIso8601String(),
      };
}
