class Profile_Resturant {
  int? status;
  bool? error;
  Messages? messages;

  Profile_Resturant({this.status, this.error, this.messages});

  Profile_Resturant.fromJson(Map<String, dynamic> json) {
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
  List<Userdata>? userdata;

  Status({this.userdata});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['userdata'] != null) {
      userdata = <Userdata>[];
      json['userdata'].forEach((v) {
        userdata!.add(new Userdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userdata != null) {
      data['userdata'] = this.userdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Userdata {
  String? id;
  String? fullName;
  String? userName;
  String? password;
  String? email;
  String? contactNo;
  Null? gender;
  String? alterCnum;
  String? profileImage;
  String? centerName;
  Null? latitude;
  Null? longitude;
  String? details;
  String? centerRedgProof;
  String? regNum;
  String? gst;
  String? gstImage;
  String? adharFont;
  String? adharBack;
  String? adharNo;
  String? userType;
  String? restaurantType;
  String? cityId;
  String? areaId;
  String? pin;
  String? address1;
  Null? address2;
  Null? commition;
  String? bannerImage;
  String? logoImage;
  Null? hygene;
  String? acciesType;
  String? status;
  Null? reasone;
  String? wallet;
  Null? otp;
  Null? roles;
  Null? accountDetails;
  Null? benefName;
  Null? merchantAgrrement;
  String? createdDate;
  String? updatedDate;

  Userdata(
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

  Userdata.fromJson(Map<String, dynamic> json) {
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
