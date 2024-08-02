class LoginOtpModel {
  int? status;
  bool? error;
  Messages? messages;

  LoginOtpModel({this.status, this.error, this.messages});

  LoginOtpModel.fromJson(Map<String, dynamic> json) {
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
  String? contactOtp;
  String? loginOtp;
  String? message;

  Status({this.contactOtp, this.loginOtp, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    contactOtp = json['contact_otp'];
    loginOtp = json['login_otp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_otp'] = this.contactOtp;
    data['login_otp'] = this.loginOtp;
    data['message'] = this.message;
    return data;
  }
}
