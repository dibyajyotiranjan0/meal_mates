class GetAllOrderModel {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetAllOrderModel({this.status, this.error, this.message, this.data});

  GetAllOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Orderdtls>? orderdtls;

  Data({this.orderdtls});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Orderdtls'] != null) {
      orderdtls = <Orderdtls>[];
      json['Orderdtls'].forEach((v) {
        orderdtls!.add(new Orderdtls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderdtls != null) {
      data['Orderdtls'] = this.orderdtls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orderdtls {
  String? ordersId;
  String? orderId;
  String? orderDate;
  String? status;
  String? addressId;
  dynamic? logoImage;
  String? customerContactNo;
  String? customerFullName;
  dynamic? restaurantContactNo;
  dynamic? restaurantName;
  String? totalAmount;
  String? totalQty;
  List<OrderDtls>? orderDtls;
  List<AddressDtls>? addressDtls;

  Orderdtls(
      {this.ordersId,
      this.orderId,
      this.orderDate,
      this.status,
      this.addressId,
      this.logoImage,
      this.customerContactNo,
      this.customerFullName,
      this.restaurantContactNo,
      this.restaurantName,
      this.totalAmount,
      this.totalQty,
      this.orderDtls,
      this.addressDtls});

  Orderdtls.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    orderId = json['order_id'];
    orderDate = json['order_date'];
    status = json['status'];
    addressId = json['address_id'];
    logoImage = json['logo_image'];
    customerContactNo = json['customer_contact_no'];
    customerFullName = json['customer_full_name'];
    restaurantContactNo = json['restaurant_contact_no'];
    restaurantName = json['restaurant_name'];
    totalAmount = json['total_amount'];
    totalQty = json['total_qty'];
    if (json['order_dtls'] != null) {
      orderDtls = <OrderDtls>[];
      json['order_dtls'].forEach((v) {
        orderDtls!.add(new OrderDtls.fromJson(v));
      });
    }
    if (json['address_dtls'] != null) {
      addressDtls = <AddressDtls>[];
      json['address_dtls'].forEach((v) {
        addressDtls!.add(new AddressDtls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['order_id'] = this.orderId;
    data['order_date'] = this.orderDate;
    data['status'] = this.status;
    data['address_id'] = this.addressId;
    data['logo_image'] = this.logoImage;
    data['customer_contact_no'] = this.customerContactNo;
    data['customer_full_name'] = this.customerFullName;
    data['restaurant_contact_no'] = this.restaurantContactNo;
    data['restaurant_name'] = this.restaurantName;
    data['total_amount'] = this.totalAmount;
    data['total_qty'] = this.totalQty;
    if (this.orderDtls != null) {
      data['order_dtls'] = this.orderDtls!.map((v) => v.toJson()).toList();
    }
    if (this.addressDtls != null) {
      data['address_dtls'] = this.addressDtls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDtls {
  String? ordersId;
  String? productname;
  dynamic? variationId;
  String? qty;
  String? img;
  String? price;
  String? userId;
  dynamic? shippingType;
  dynamic? shippingCharge;
  String? orderId;
  String? addressId;
  String? paymentMode;
  String? status;
  dynamic? reason;
  String? wallet;
  dynamic? txnId;
  String? couponCode;
  String? couponAmnt;
  dynamic? centerId;
  dynamic? deliveryboy;
  dynamic? otp;
  String? createdDate;
  String? updateDate;

  OrderDtls(
      {this.ordersId,
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
      this.updateDate});

  OrderDtls.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    productname = json['productname'];
    variationId = json['variation_id'];
    qty = json['qty'];
    img = json['img'];
    price = json['price'];
    userId = json['user_id'];
    shippingType = json['shipping_type'];
    shippingCharge = json['shipping_charge'];
    orderId = json['order_id'];
    addressId = json['address_id'];
    paymentMode = json['payment_mode'];
    status = json['status'];
    reason = json['reason'];
    wallet = json['wallet'];
    txnId = json['txn_id'];
    couponCode = json['coupon_code'];
    couponAmnt = json['coupon_amnt'];
    centerId = json['center_id'];
    deliveryboy = json['deliveryboy'];
    otp = json['otp'];
    createdDate = json['created_date'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['productname'] = this.productname;
    data['variation_id'] = this.variationId;
    data['qty'] = this.qty;
    data['img'] = this.img;
    data['price'] = this.price;
    data['user_id'] = this.userId;
    data['shipping_type'] = this.shippingType;
    data['shipping_charge'] = this.shippingCharge;
    data['order_id'] = this.orderId;
    data['address_id'] = this.addressId;
    data['payment_mode'] = this.paymentMode;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['wallet'] = this.wallet;
    data['txn_id'] = this.txnId;
    data['coupon_code'] = this.couponCode;
    data['coupon_amnt'] = this.couponAmnt;
    data['center_id'] = this.centerId;
    data['deliveryboy'] = this.deliveryboy;
    data['otp'] = this.otp;
    data['created_date'] = this.createdDate;
    data['update_date'] = this.updateDate;
    return data;
  }
}

class AddressDtls {
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
  dynamic? lat;
  dynamic? lng;
  String? createdDate;
  String? updatdDare;

  AddressDtls(
      {this.addressId,
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
      this.updatdDare});

  AddressDtls.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    cityname = json['cityname'];
    state = json['state'];
    pincode = json['pincode'];
    email = json['email'];
    number = json['number'];
    address1 = json['address1'];
    adress2 = json['adress2'];
    isDelte = json['is_delte'];
    lat = json['lat'];
    lng = json['lng'];
    createdDate = json['created_date'];
    updatdDare = json['updatd_dare'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['cityname'] = this.cityname;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['email'] = this.email;
    data['number'] = this.number;
    data['address1'] = this.address1;
    data['adress2'] = this.adress2;
    data['is_delte'] = this.isDelte;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['created_date'] = this.createdDate;
    data['updatd_dare'] = this.updatdDare;
    return data;
  }
}
