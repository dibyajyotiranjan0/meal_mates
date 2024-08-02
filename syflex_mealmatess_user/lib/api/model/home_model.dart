// To parse this JSON data, do
//
//     final userHomeModel = userHomeModelFromJson(jsonString);

import 'dart:convert';

UserHomeModel userHomeModelFromJson(String str) =>
    UserHomeModel.fromJson(json.decode(str));

String userHomeModelToJson(UserHomeModel data) => json.encode(data.toJson());

class UserHomeModel {
  final int? status;
  final bool? error;
  final Messages? messages;

  UserHomeModel({
    this.status,
    this.error,
    this.messages,
  });

  factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
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
  final String? responsecode;
  final Status? status;

  Messages({
    this.responsecode,
    this.status,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        responsecode: json["responsecode"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "responsecode": responsecode,
        "status": status?.toJson(),
      };
}

class Status {
  final List<Bannerdatum>? bannerdata;
  final List<Offerdatum>? offerdata;
  final List<Categorydatum>? categorydata;
  final List<Restaurantdatum>? restaurantdata;

  Status({
    this.bannerdata,
    this.offerdata,
    this.categorydata,
    this.restaurantdata,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        bannerdata: json["bannerdata"] == null
            ? []
            : List<Bannerdatum>.from(
                json["bannerdata"]!.map((x) => Bannerdatum.fromJson(x))),
        offerdata: json["offerdata"] == null
            ? []
            : List<Offerdatum>.from(
                json["offerdata"]!.map((x) => Offerdatum.fromJson(x))),
        categorydata: json["categorydata"] == null
            ? []
            : List<Categorydatum>.from(
                json["categorydata"]!.map((x) => Categorydatum.fromJson(x))),
        restaurantdata: json["restaurantdata"] == null
            ? []
            : List<Restaurantdatum>.from(json["restaurantdata"]!
                .map((x) => Restaurantdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bannerdata": bannerdata == null
            ? []
            : List<dynamic>.from(bannerdata!.map((x) => x.toJson())),
        "offerdata": offerdata == null
            ? []
            : List<dynamic>.from(offerdata!.map((x) => x.toJson())),
        "categorydata": categorydata == null
            ? []
            : List<dynamic>.from(categorydata!.map((x) => x.toJson())),
        "restaurantdata": restaurantdata == null
            ? []
            : List<dynamic>.from(restaurantdata!.map((x) => x.toJson())),
      };
}

class Bannerdatum {
  final String? bannerId;
  final String? bannerTitle;
  final String? bannerSubtitle;
  final String? description;
  final String? type;
  final String? orderby;
  final String? image;

  Bannerdatum({
    this.bannerId,
    this.bannerTitle,
    this.bannerSubtitle,
    this.description,
    this.type,
    this.orderby,
    this.image,
  });

  factory Bannerdatum.fromJson(Map<String, dynamic> json) => Bannerdatum(
        bannerId: json["banner_id"],
        bannerTitle: json["banner_title"],
        bannerSubtitle: json["banner_subtitle"],
        description: json["description"],
        type: json["type"],
        orderby: json["orderby"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "banner_id": bannerId,
        "banner_title": bannerTitle,
        "banner_subtitle": bannerSubtitle,
        "description": description,
        "type": type,
        "orderby": orderby,
        "image": image,
      };
}

class Categorydatum {
  final String? catId;
  final String? catName;
  final String? parentId;
  final String? catImg;
  final String? status;
  final DateTime? createdDate;
  final List<Categorydatum>? subcategories;

  Categorydatum({
    this.catId,
    this.catName,
    this.parentId,
    this.catImg,
    this.status,
    this.createdDate,
    this.subcategories,
  });

  factory Categorydatum.fromJson(Map<String, dynamic> json) => Categorydatum(
        catId: json["cat_id"],
        catName: json["cat_name"],
        parentId: json["parent_id"],
        catImg: json["cat_img"],
        status: json["status"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        subcategories: json["subcategories"] == null
            ? []
            : List<Categorydatum>.from(
                json["subcategories"]!.map((x) => Categorydatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_name": catName,
        "parent_id": parentId,
        "cat_img": catImg,
        "status": status,
        "created_date": createdDate?.toIso8601String(),
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
      };
}

class Offerdatum {
  final String? couponCodeId;
  final String? image;

  Offerdatum({
    this.couponCodeId,
    this.image,
  });

  factory Offerdatum.fromJson(Map<String, dynamic> json) => Offerdatum(
        couponCodeId: json["coupon_code_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "coupon_code_id": couponCodeId,
        "image": image,
      };
}

class Restaurantdatum {
  final String? restaurantId;
  final String? primaryImage;
  final String? restaurantName;
  final dynamic bannerImage;
  final dynamic logoImage;
  final dynamic hygene;
  final String? status;

  Restaurantdatum({
    this.restaurantId,
    this.primaryImage,
    this.restaurantName,
    this.bannerImage,
    this.logoImage,
    this.hygene,
    this.status,
  });

  factory Restaurantdatum.fromJson(Map<String, dynamic> json) =>
      Restaurantdatum(
        restaurantId: json["restaurant_id"],
        primaryImage: json["primary_image"],
        restaurantName: json["restaurant_name"],
        bannerImage: json["banner_image"],
        logoImage: json["logo_image"],
        hygene: json["hygene"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "primary_image": primaryImage,
        "restaurant_name": restaurantName,
        "banner_image": bannerImage,
        "logo_image": logoImage,
        "hygene": hygene,
        "status": status,
      };
}
