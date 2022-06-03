
// ignore_for_file: unnecessary_new, prefer_void_to_null, unnecessary_this, prefer_collection_literals

class RegisterModel {
  bool? status;
  String? message;
  Data? data;
  List<String>? meta;
  List<String>? pagination;

  RegisterModel(
      {this.status, this.message, this.data, this.meta, this.pagination});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'].cast<String>();
    pagination = json['pagination'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['meta'] = this.meta;
    data['pagination'] = this.pagination;
    return data;
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  String? country;
  String? id;

  User({this.fullName, this.email, this.country, this.id});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    country = json['country'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['country'] = this.country;
    data['id'] = this.id;
    return data;
  }
}
