class AllRescturantCategry {
  int? status;
  bool? error;
  Messages? messages;

  AllRescturantCategry({this.status, this.error, this.messages});

  AllRescturantCategry.fromJson(Map<String, dynamic> json) {
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
  List<Categorydata>? categorydata;

  Status({this.categorydata});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['categorydata'] != null) {
      categorydata = <Categorydata>[];
      json['categorydata'].forEach((v) {
        categorydata!.add(new Categorydata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categorydata != null) {
      data['categorydata'] = this.categorydata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorydata {
  String? catId;
  String? catName;
  String? parentId;
  String? catImg;
  String? status;
  String? createdDate;
  List<Subcategories>? subcategories;

  Categorydata(
      {this.catId,
      this.catName,
      this.parentId,
      this.catImg,
      this.status,
      this.createdDate,
      this.subcategories});

  Categorydata.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    parentId = json['parent_id'];
    catImg = json['cat_img'];
    status = json['status'];
    createdDate = json['created_date'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['parent_id'] = this.parentId;
    data['cat_img'] = this.catImg;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  String? catId;
  String? catName;
  String? parentId;
  String? catImg;
  String? status;
  String? createdDate;

  Subcategories(
      {this.catId,
      this.catName,
      this.parentId,
      this.catImg,
      this.status,
      this.createdDate});

  Subcategories.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
    parentId = json['parent_id'];
    catImg = json['cat_img'];
    status = json['status'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['parent_id'] = this.parentId;
    data['cat_img'] = this.catImg;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    return data;
  }
}
