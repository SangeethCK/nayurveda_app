class BranchResponse {
  bool? status;
  String? message;
  List<BranchList>? branches;
  BranchResponse({
    this.status,
    this.message,
    this.branches,
  });

  BranchResponse copyWith({
    bool? status,
    String? message,
    List<BranchList>? branches,
  }) =>
      BranchResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        branches: branches ?? this.branches,
      );

  factory BranchResponse.fromJson(Map<String, dynamic> json) => BranchResponse(
        status: json["status"],
        message: json["message"],
        branches: json["branches"] == null
            ? []
            : List<BranchList>.from(
                json["branches"]!.map((x) => BranchList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
      };
}

class BranchList {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  BranchList({
    this.id,
    this.name,
    this.patientsCount,
    this.location,
    this.phone,
    this.mail,
    this.address,
    this.gst,
    this.isActive,
  });

  BranchList copyWith({
    int? id,
    String? name,
    int? patientsCount,
    String? location,
    String? phone,
    String? mail,
    String? address,
    String? gst,
    bool? isActive,
  }) =>
      BranchList(
        id: id ?? this.id,
        name: name ?? this.name,
        patientsCount: patientsCount ?? this.patientsCount,
        location: location ?? this.location,
        phone: phone ?? this.phone,
        mail: mail ?? this.mail,
        address: address ?? this.address,
        gst: gst ?? this.gst,
        isActive: isActive ?? this.isActive,
      );

  factory BranchList.fromJson(Map<String, dynamic> json) => BranchList(
        id: json["id"],
        name: json["name"],
        patientsCount: json["patients_count"],
        location: json["location"],
        phone: json["phone"],
        mail: json["mail"],
        address: json["address"],
        gst: json["gst"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "patients_count": patientsCount,
        "location": location,
        "phone": phone,
        "mail": mail,
        "address": address,
        "gst": gst,
        "is_active": isActive,
      };
}
