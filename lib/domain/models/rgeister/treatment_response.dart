class TreatmentResponse {
  bool? status;
  String? message;
  List<TreatmentLists>? treatments;

  TreatmentResponse({
    this.status,
    this.message,
    this.treatments,
  });

  factory TreatmentResponse.fromJson(Map<String, dynamic> json) =>
      TreatmentResponse(
        status: json["status"],
        message: json["message"],
        treatments: json["treatments"] == null
            ? []
            : List<TreatmentLists>.from(
                json["treatments"]!.map((x) => TreatmentLists.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "treatments": treatments == null
            ? []
            : List<dynamic>.from(treatments!.map((x) => x.toJson())),
      };
}

class TreatmentLists {
  int? id;
  List<Branch>? branches;
  String? name;
  String? duration;
  String? price;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  TreatmentLists({
    this.id,
    this.branches,
    this.name,
    this.duration,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory TreatmentLists.fromJson(Map<String, dynamic> json) => TreatmentLists(
        id: json["id"],
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
        name: json["name"],
        duration: json["duration"],
        price: json["price"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "name": name,
        "duration": duration,
        "price": price,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Branch {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  Branch({
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

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"]!,
        patientsCount: json["patients_count"],
        location: json["location"]!,
        phone: json["phone"]!,
        mail: json["mail"]!,
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
