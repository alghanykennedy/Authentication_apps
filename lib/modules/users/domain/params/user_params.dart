class GetAllUsersParams {
  final int page;

  const GetAllUsersParams({required this.page});

  factory GetAllUsersParams.fromJson(Map<String, dynamic> json) =>
      GetAllUsersParams(
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
      };
}
