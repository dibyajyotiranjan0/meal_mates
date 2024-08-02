class ResturantAreaSelect {
  int? status;
  bool? error;
  Messages? messages;

  ResturantAreaSelect({this.status, this.error, this.messages});

  ResturantAreaSelect.fromJson(Map<String, dynamic> json) {
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
  List<Allarea>? allarea;

  Status({this.allarea});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['Allarea'] != null) {
      allarea = <Allarea>[];
      json['Allarea'].forEach((v) {
        allarea!.add(new Allarea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allarea != null) {
      data['Allarea'] = this.allarea!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allarea {
  String? areaId;
  String? cityId;
  String? areaname;
  String? status;
  String? createdDate;
  String? updatedDate;

  Allarea(
      {this.areaId,
      this.cityId,
      this.areaname,
      this.status,
      this.createdDate,
      this.updatedDate});

  Allarea.fromJson(Map<String, dynamic> json) {
    areaId = json['area_id'];
    cityId = json['city_id'];
    areaname = json['areaname'];
    status = json['status'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_id'] = this.areaId;
    data['city_id'] = this.cityId;
    data['areaname'] = this.areaname;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
