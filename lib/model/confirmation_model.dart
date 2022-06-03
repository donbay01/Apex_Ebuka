// To parse this JSON data, do
//
//     final confirmedModel = confirmedModelFromJson(jsonString);

import 'dart:convert';

ConfirmedModel confirmedModelFromJson(String str) => ConfirmedModel.fromJson(json.decode(str));

String confirmedModelToJson(ConfirmedModel data) => json.encode(data.toJson());

class ConfirmedModel {
  ConfirmedModel({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  bool status;
  String message;
  Data data;
  List<dynamic> meta;
  List<dynamic> pagination;

  factory ConfirmedModel.fromJson(Map<String, dynamic> json) => ConfirmedModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    pagination: List<dynamic>.from(json["pagination"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "pagination": List<dynamic>.from(pagination.map((x) => x)),
  };
}

class Data {
  Data({
    required this.email,
  });

  String email;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
