class GetAllLocationModel {
  int? status;
  bool? error;
  Messages? messages;

  GetAllLocationModel({this.status, this.error, this.messages});

  GetAllLocationModel.fromJson(Map<String, dynamic> json) {
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
  List<AllCity>? allCity;

  Status({this.allCity});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['AllCity'] != null) {
      allCity = <AllCity>[];
      json['AllCity'].forEach((v) {
        allCity!.add(new AllCity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCity != null) {
      data['AllCity'] = this.allCity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllCity {
  String? cityId;
  String? cityName;
  String? status;
  String? createdDate;
  String? updatedDate;
  List<Areas>? areas;

  AllCity(
      {this.cityId,
      this.cityName,
      this.status,
      this.createdDate,
      this.updatedDate,
      this.areas});

  AllCity.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    status = json['status'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    if (json['areas'] != null) {
      areas = <Areas>[];
      json['areas'].forEach((v) {
        areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  String? areaId;
  String? cityId;
  String? areaname;
  String? status;
  String? createdDate;
  String? updatedDate;
  List<PinCodes>? pinCodes;

  Areas(
      {this.areaId,
      this.cityId,
      this.areaname,
      this.status,
      this.createdDate,
      this.updatedDate,
      this.pinCodes});

  Areas.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id'];
    cityId = json['city_id'];
    areaname = json['areaname'];
    status = json['status'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    if (json['pinCodes'] != null) {
      pinCodes = <PinCodes>[];
      json['pinCodes'].forEach((v) {
        pinCodes!.add(new PinCodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_id'] = this.areaId;
    data['city_id'] = this.cityId;
    data['areaname'] = this.areaname;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    if (this.pinCodes != null) {
      data['pinCodes'] = this.pinCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PinCodes {
  String? pinId;
  String? areaId;
  String? cityId;
  String? pincode;
  String? status;
  String? createdDate;
  String? updatedDate;

  PinCodes(
      {this.pinId,
      this.areaId,
      this.cityId,
      this.pincode,
      this.status,
      this.createdDate,
      this.updatedDate});

  PinCodes.fromJson(Map<String, dynamic> json) {
    pinId = json['pin_id'];
    areaId = json['area_id'];
    cityId = json['city_id'];
    pincode = json['pincode'];
    status = json['status'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pin_id'] = this.pinId;
    data['area_id'] = this.areaId;
    data['city_id'] = this.cityId;
    data['pincode'] = this.pincode;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
