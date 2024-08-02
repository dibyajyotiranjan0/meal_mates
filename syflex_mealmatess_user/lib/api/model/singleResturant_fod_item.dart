class SingeResturantFoodItem {
  int? status;
  bool? error;
  Messages? messages;

  SingeResturantFoodItem({this.status, this.error, this.messages});

  SingeResturantFoodItem.fromJson(Map<String, dynamic> json) {
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
  List<RestaurantData>? restaurantData;
  List<RestaurantProductData>? restaurantProductData;
  List<RestaurantGalleryData>? restaurantGalleryData;

  Status(
      {this.restaurantData,
      this.restaurantProductData,
      this.restaurantGalleryData});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['restaurant_data'] != null) {
      restaurantData = <RestaurantData>[];
      json['restaurant_data'].forEach((v) {
        restaurantData!.add(new RestaurantData.fromJson(v));
      });
    }
    if (json['restaurant_product_data'] != null) {
      restaurantProductData = <RestaurantProductData>[];
      json['restaurant_product_data'].forEach((v) {
        restaurantProductData!.add(new RestaurantProductData.fromJson(v));
      });
    }
    if (json['restaurant_gallery_data'] != null) {
      restaurantGalleryData = <RestaurantGalleryData>[];
      json['restaurant_gallery_data'].forEach((v) {
        restaurantGalleryData!.add(new RestaurantGalleryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurantData != null) {
      data['restaurant_data'] =
          this.restaurantData!.map((v) => v.toJson()).toList();
    }
    if (this.restaurantProductData != null) {
      data['restaurant_product_data'] =
          this.restaurantProductData!.map((v) => v.toJson()).toList();
    }
    if (this.restaurantGalleryData != null) {
      data['restaurant_gallery_data'] =
          this.restaurantGalleryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantData {
  String? id;
  String? fullName;
  dynamic? userName;
  dynamic? password;
  dynamic? email;
  String? contactNo;
  dynamic? gender;
  dynamic? alterCnum;
  dynamic? profileImage;
  String? centerName;
  dynamic? latitude;
  dynamic? longitude;
  dynamic? details;
  dynamic? centerRedgProof;
  dynamic? regNum;
  dynamic? gst;
  dynamic? gstImage;
  dynamic? adharFont;
  dynamic? adharBack;
  dynamic? adharNo;
  String? userType;
  dynamic? restaurantType;
  dynamic? cityId;
  dynamic? areaId;
  dynamic? pin;
  dynamic? address1;
  dynamic? address2;
  dynamic? commition;
  dynamic? bannerImage;
  dynamic? logoImage;
  dynamic? hygene;
  String? acciesType;
  String? status;
  dynamic? reasone;
  String? wallet;
  dynamic? otp;
  dynamic? roles;
  dynamic? accountDetails;
  dynamic? benefName;
  dynamic? merchantAgrrement;
  String? createdDate;
  String? updatedDate;

  RestaurantData(
      {this.id,
      this.fullName,
      this.userName,
      this.password,
      this.email,
      this.contactNo,
      this.gender,
      this.alterCnum,
      this.profileImage,
      this.centerName,
      this.latitude,
      this.longitude,
      this.details,
      this.centerRedgProof,
      this.regNum,
      this.gst,
      this.gstImage,
      this.adharFont,
      this.adharBack,
      this.adharNo,
      this.userType,
      this.restaurantType,
      this.cityId,
      this.areaId,
      this.pin,
      this.address1,
      this.address2,
      this.commition,
      this.bannerImage,
      this.logoImage,
      this.hygene,
      this.acciesType,
      this.status,
      this.reasone,
      this.wallet,
      this.otp,
      this.roles,
      this.accountDetails,
      this.benefName,
      this.merchantAgrrement,
      this.createdDate,
      this.updatedDate});

  RestaurantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    userName = json['user_name'];
    password = json['password'];
    email = json['email'];
    contactNo = json['contact_no'];
    gender = json['gender'];
    alterCnum = json['alter_cnum'];
    profileImage = json['profile_image'];
    centerName = json['center_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    details = json['details'];
    centerRedgProof = json['center_redg_proof'];
    regNum = json['reg_num'];
    gst = json['gst'];
    gstImage = json['gst_image'];
    adharFont = json['adhar_font'];
    adharBack = json['adhar_back'];
    adharNo = json['adhar_no'];
    userType = json['user_type'];
    restaurantType = json['restaurant_type'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    pin = json['pin'];
    address1 = json['address1'];
    address2 = json['address2'];
    commition = json['commition'];
    bannerImage = json['banner_image'];
    logoImage = json['logo_image'];
    hygene = json['hygene'];
    acciesType = json['accies_type'];
    status = json['status'];
    reasone = json['reasone'];
    wallet = json['wallet'];
    otp = json['otp'];
    roles = json['roles'];
    accountDetails = json['account_details'];
    benefName = json['benef_name'];
    merchantAgrrement = json['merchant_agrrement'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['email'] = this.email;
    data['contact_no'] = this.contactNo;
    data['gender'] = this.gender;
    data['alter_cnum'] = this.alterCnum;
    data['profile_image'] = this.profileImage;
    data['center_name'] = this.centerName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['details'] = this.details;
    data['center_redg_proof'] = this.centerRedgProof;
    data['reg_num'] = this.regNum;
    data['gst'] = this.gst;
    data['gst_image'] = this.gstImage;
    data['adhar_font'] = this.adharFont;
    data['adhar_back'] = this.adharBack;
    data['adhar_no'] = this.adharNo;
    data['user_type'] = this.userType;
    data['restaurant_type'] = this.restaurantType;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['pin'] = this.pin;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['commition'] = this.commition;
    data['banner_image'] = this.bannerImage;
    data['logo_image'] = this.logoImage;
    data['hygene'] = this.hygene;
    data['accies_type'] = this.acciesType;
    data['status'] = this.status;
    data['reasone'] = this.reasone;
    data['wallet'] = this.wallet;
    data['otp'] = this.otp;
    data['roles'] = this.roles;
    data['account_details'] = this.accountDetails;
    data['benef_name'] = this.benefName;
    data['merchant_agrrement'] = this.merchantAgrrement;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}

class RestaurantProductData {
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
  String? categories;

  RestaurantProductData(
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
      this.updatedDate,
      this.categories});

  RestaurantProductData.fromJson(Map<String, dynamic> json) {
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
    categories = json['categories'];
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
    data['categories'] = this.categories;
    return data;
  }
}

class RestaurantGalleryData {
  String? centerGalleryId;
  String? centeImage;
  String? centerId;
  String? createdDate;

  RestaurantGalleryData(
      {this.centerGalleryId, this.centeImage, this.centerId, this.createdDate});

  RestaurantGalleryData.fromJson(Map<String, dynamic> json) {
    centerGalleryId = json['center_gallery_id'];
    centeImage = json['cente_image'];
    centerId = json['center_id'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['center_gallery_id'] = this.centerGalleryId;
    data['cente_image'] = this.centeImage;
    data['center_id'] = this.centerId;
    data['created_date'] = this.createdDate;
    return data;
  }
}
