class AllAddressModel {
  int? status;
  bool? error;
  Messages? messages;

  AllAddressModel({this.status, this.error, this.messages});

  AllAddressModel.fromJson(Map<String, dynamic> json) {
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
  List<AddressData>? addressData;

  Status({this.addressData});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['Address_data'] != null) {
      addressData = <AddressData>[];
      json['Address_data'].forEach((v) {
        addressData!.add(new AddressData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressData != null) {
      data['Address_data'] = this.addressData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressData {
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
  Null? lat;
  Null? lng;
  String? createdDate;
  String? updatdDare;

  AddressData(
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

  AddressData.fromJson(Map<String, dynamic> json) {
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
