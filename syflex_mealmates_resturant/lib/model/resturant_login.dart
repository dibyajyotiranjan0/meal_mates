class ResturantLogin {
  int? status;
  bool? error;
  Messages? messages;

  ResturantLogin({this.status, this.error, this.messages});

  ResturantLogin.fromJson(Map<String, dynamic> json) {
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
  List<Status>? status;

  Messages({this.responsecode, this.status});

  Messages.fromJson(Map<String, dynamic> json) {
    responsecode = json['responsecode'];
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responsecode'] = this.responsecode;
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? id;
  String? fullName;
  String? email;
  String? contactNo;
  String? alterCnum;
  String? profileImage;
  String? organisationname;
  String? latitude;
  String? longitude;
  String? centerRedgProof;
  String? gst;
  String? gstImage;
  String? adharFont;
  String? adharBack;
  String? adharNo;
  String? userType;
  String? cityId;
  String? cityName;
  String? areaId;
  String? areaname;
  String? acciesType;
  String? accesstoken;

  Status(
      {this.id,
      this.fullName,
      this.email,
      this.contactNo,
      this.alterCnum,
      this.profileImage,
      this.organisationname,
      this.latitude,
      this.longitude,
      this.centerRedgProof,
      this.gst,
      this.gstImage,
      this.adharFont,
      this.adharBack,
      this.adharNo,
      this.userType,
      this.cityId,
      this.cityName,
      this.areaId,
      this.areaname,
      this.acciesType,
      this.accesstoken});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    contactNo = json['contact_no'];
    alterCnum = json['alter_cnum'];
    profileImage = json['profile_image'];
    organisationname = json['organisationname'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    centerRedgProof = json['center_redg_proof'];
    gst = json['gst'];
    gstImage = json['gst_image'];
    adharFont = json['adhar_font'];
    adharBack = json['adhar_back'];
    adharNo = json['adhar_no'];
    userType = json['user_type'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    areaId = json['area_id'];
    areaname = json['areaname'];
    acciesType = json['accies_type'];
    accesstoken = json['accesstoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['contact_no'] = this.contactNo;
    data['alter_cnum'] = this.alterCnum;
    data['profile_image'] = this.profileImage;
    data['organisationname'] = this.organisationname;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['center_redg_proof'] = this.centerRedgProof;
    data['gst'] = this.gst;
    data['gst_image'] = this.gstImage;
    data['adhar_font'] = this.adharFont;
    data['adhar_back'] = this.adharBack;
    data['adhar_no'] = this.adharNo;
    data['user_type'] = this.userType;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['area_id'] = this.areaId;
    data['areaname'] = this.areaname;
    data['accies_type'] = this.acciesType;
    data['accesstoken'] = this.accesstoken;
    return data;
  }
}
