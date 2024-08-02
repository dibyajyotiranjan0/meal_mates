// To parse this JSON data, do
//
//     final userLogDetails = userLogDetailsFromJson(jsonString);

import 'dart:convert';

UserLogDetails userLogDetailsFromJson(String str) =>
    UserLogDetails.fromJson(json.decode(str));

String userLogDetailsToJson(UserLogDetails data) => json.encode(data.toJson());

class UserLogDetails {
  int? status;
  bool? error;
  Messages? messages;

  UserLogDetails({
    this.status,
    this.error,
    this.messages,
  });

  factory UserLogDetails.fromJson(Map<String, dynamic> json) => UserLogDetails(
        status: json["status"],
        error: json["error"],
        messages: json["messages"] == null
            ? null
            : Messages.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages?.toJson(),
      };
}

class Messages {
  String? responsecode;
  List<Status>? status;

  Messages({
    this.responsecode,
    this.status,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        responsecode: json["responsecode"],
        status: json["status"] == null
            ? []
            : List<Status>.from(json["status"]!.map((x) => Status.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responsecode": responsecode,
        "status": status == null
            ? []
            : List<dynamic>.from(status!.map((x) => x.toJson())),
      };
}

class Status {
  String? id;
  String? fullName;
  String? email;
  String? contactNo;
  String? alterCnum;
  dynamic profileImage;
  dynamic latitude;
  dynamic longitude;
  dynamic adharFont;
  dynamic adharBack;
  dynamic adharNo;
  String? userType;
  dynamic cityId;
  dynamic cityName;
  String? areaId;
  String? areaname;
  String? acciesType;
  String? vehicleNo;
  String? vehicleType;
  String? vehicleRc;
  String? dl;

  Status({
    this.id,
    this.fullName,
    this.email,
    this.contactNo,
    this.alterCnum,
    this.profileImage,
    this.latitude,
    this.longitude,
    this.adharFont,
    this.adharBack,
    this.adharNo,
    this.userType,
    this.cityId,
    this.cityName,
    this.areaId,
    this.areaname,
    this.acciesType,
    this.vehicleNo,
    this.vehicleType,
    this.vehicleRc,
    this.dl,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        contactNo: json["contact_no"],
        alterCnum: json["alter_cnum"],
        profileImage: json["profile_image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        adharFont: json["adhar_font"],
        adharBack: json["adhar_back"],
        adharNo: json["adhar_no"],
        userType: json["user_type"],
        cityId: json["city_id"],
        cityName: json["city_name"],
        areaId: json["area_id"],
        areaname: json["areaname"],
        acciesType: json["accies_type"],
        vehicleNo: json["vehicle_no"],
        vehicleType: json["vehicle_type"],
        vehicleRc: json["vehicle_rc"],
        dl: json["dl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "contact_no": contactNo,
        "alter_cnum": alterCnum,
        "profile_image": profileImage,
        "latitude": latitude,
        "longitude": longitude,
        "adhar_font": adharFont,
        "adhar_back": adharBack,
        "adhar_no": adharNo,
        "user_type": userType,
        "city_id": cityId,
        "city_name": cityName,
        "area_id": areaId,
        "areaname": areaname,
        "accies_type": acciesType,
        "vehicle_no": vehicleNo,
        "vehicle_type": vehicleType,
        "vehicle_rc": vehicleRc,
        "dl": dl,
      };
}
