class UserResponseModel {
  int page;
  int perPage;
  int totalRecord;
  int totalPages;
  List<UserData> data;

  UserResponseModel({
    required this.page,
    required this.perPage,
    required this.totalRecord,
    required this.totalPages,
    required this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        page: json["page"],
        perPage: json["per_page"],
        totalRecord: json["totalrecord"],
        totalPages: json["total_pages"],
        data:
            List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "totalrecord": totalRecord,
        "total_pages": totalPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserData {
  int id;
  String name;
  String email;
  String profilePicture;
  String location;
  DateTime createdAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.location,
    required this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profilePicture: json["profilepicture"],
        location: json["location"],
        createdAt: DateTime.parse(json["createdat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profilepicture": profilePicture,
        "location": location,
        "createdat": createdAt.toIso8601String(),
      };
}
