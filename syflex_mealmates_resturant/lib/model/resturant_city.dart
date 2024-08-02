class ResturantCitySelect {
  int? status;
  bool? error;
  Messages? messages;

  ResturantCitySelect({this.status, this.error, this.messages});

  ResturantCitySelect.fromJson(Map<String, dynamic> json) {
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

  AllCity(
      {this.cityId,
      this.cityName,
      this.status,
      this.createdDate,
      this.updatedDate});

  AllCity.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    status = json['status'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
