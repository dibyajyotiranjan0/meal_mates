class MyCartModel {
  int? status;
  bool? error;
  Messages? messages;

  MyCartModel({this.status, this.error, this.messages});

  MyCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null
        ? new Messages.fromJson(json['messages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.messages != null) {
      data['messages'] = this.messages!.toJson();
    }
    return data;
  }
}

class Messages {
  String? responsecode;
  Status? status;

  Messages({this.responsecode, this.status});

  Messages.fromJson(Map<String, dynamic> json) {
    responsecode = json['responsecode'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responsecode'] = this.responsecode;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Status {
  List<CartItems>? cartItems;

  Status({this.cartItems});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  String? cartId;
  String? shopId;
  String? userId;
  String? productId;
  String? qty;
  String? variationId;
  String? createdDate;
  String? vendorId;
  String? productName;
  String? description;
  String? primaryImage;
  String? regularPrice;
  String? salesPrice;
  String? category;
  String? foodType;
  String? prodType;
  String? productType;
  String? status;
  String? updatedDate;

  CartItems(
      {this.cartId,
      this.shopId,
      this.userId,
      this.productId,
      this.qty,
      this.variationId,
      this.createdDate,
      this.vendorId,
      this.productName,
      this.description,
      this.primaryImage,
      this.regularPrice,
      this.salesPrice,
      this.category,
      this.foodType,
      this.prodType,
      this.productType,
      this.status,
      this.updatedDate});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    shopId = json['shop_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    qty = json['qty'];
    variationId = json['variation_id'];
    createdDate = json['created_date'];
    vendorId = json['vendor_id'];
    productName = json['product_name'];
    description = json['description'];
    primaryImage = json['primary_image'];
    regularPrice = json['regular_price'];
    salesPrice = json['sales_price'];
    category = json['category'];
    foodType = json['food_type'];
    prodType = json['prodType'];
    productType = json['product_type'];
    status = json['status'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['shop_id'] = this.shopId;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['variation_id'] = this.variationId;
    data['created_date'] = this.createdDate;
    data['vendor_id'] = this.vendorId;
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['primary_image'] = this.primaryImage;
    data['regular_price'] = this.regularPrice;
    data['sales_price'] = this.salesPrice;
    data['category'] = this.category;
    data['food_type'] = this.foodType;
    data['prodType'] = this.prodType;
    data['product_type'] = this.productType;
    data['status'] = this.status;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
