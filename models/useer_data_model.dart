import 'package:api_learning/models/support_model.dart';
import 'package:api_learning/models/user_list_model.dart';

class UserDataModel {
  UserDataModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
    this.message,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserList>? data;
  Support? support;
  String? message;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        page: json["page"] ?? '',
        perPage: json["per_page"] ?? '',
        total: json["total"] ?? '',
        totalPages: json["total_pages"] ?? '',
        data: json["data"] == null
            ? null
            : List<UserList>.from(
                json["data"].map((x) => UserList.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
        message: json["message"] ?? '',
      );

  /// Use toJson Method only if needed

}
