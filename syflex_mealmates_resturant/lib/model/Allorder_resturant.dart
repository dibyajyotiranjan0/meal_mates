class AllOrder_Resturant {
  int? status;
  bool? error;
  Messages? messages;

  AllOrder_Resturant({this.status, this.error, this.messages});

  AllOrder_Resturant.fromJson(Map<String, dynamic> json) {
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
  List<Orderdtls>? orderdtls;

  Status({this.orderdtls});

  Status.fromJson(Map<String, dynamic> json) {
    if (json['Orderdtls'] != null) {
      orderdtls = <Orderdtls>[];
      json['Orderdtls'].forEach((v) {
        orderdtls!.add(new Orderdtls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderdtls != null) {
      data['Orderdtls'] = this.orderdtls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orderdtls {
  String? ordersId;
  String? orderId;
  String? orderDate;
  String? status;
  String? contactNo;
  String? fullName;
  String? totalAmount;
  String? totalQty;

  Orderdtls(
      {this.ordersId,
      this.orderId,
      this.orderDate,
      this.status,
      this.contactNo,
      this.fullName,
      this.totalAmount,
      this.totalQty});

  Orderdtls.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    orderId = json['order_id'];
    orderDate = json['order_date'];
    status = json['status'];
    contactNo = json['contact_no'];
    fullName = json['full_name'];
    totalAmount = json['total_amount'];
    totalQty = json['total_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['order_id'] = this.orderId;
    data['order_date'] = this.orderDate;
    data['status'] = this.status;
    data['contact_no'] = this.contactNo;
    data['full_name'] = this.fullName;
    data['total_amount'] = this.totalAmount;
    data['total_qty'] = this.totalQty;
    return data;
  }
}
