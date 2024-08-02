class GetCategoryModel {
  int? status;
  bool? error;
  Messages? messages;

  GetCategoryModel({this.status, this.error, this.messages});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
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
  List<CatProductData>? catProductData;

  Status({this.catProductData});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['cat_product_data'] != null) {
      catProductData = <CatProductData>[];
      json['cat_product_data'].forEach((v) {
        catProductData!.add(new CatProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.catProductData != null) {
      data['cat_product_data'] =
          this.catProductData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CatProductData {
  String? productId;
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
  String? createdDate;
  String? updatedDate;

  CatProductData(
      {this.productId,
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
      this.createdDate,
      this.updatedDate});

  CatProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
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
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
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
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
