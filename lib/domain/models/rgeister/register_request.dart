class RegisterRequest {
  String? name;
  String? excecutive;
  String? payment;
  String? phone;
  String? address;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  String? dateNdTime;
  int? id;
  String? male;
  String? female;
  int? branch;
  int? treatments;

  RegisterRequest({
    this.name,
    this.excecutive,
    this.payment,
    this.phone,
    this.address,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.id,
    this.male,
    this.female,
    this.branch,
    this.treatments,
  });

  RegisterRequest copyWith({
    String? name,
    String? excecutive,
    String? payment,
    String? phone,
    String? address,
    int? totalAmount,
    int? discountAmount,
    int? advanceAmount,
    int? balanceAmount,
    String? dateNdTime,
    int? id,
    String? male,
    String? female,
    int? branch,
    int? treatments,
  }) =>
      RegisterRequest(
        name: name ?? this.name,
        excecutive: excecutive ?? this.excecutive,
        payment: payment ?? this.payment,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        totalAmount: totalAmount ?? this.totalAmount,
        discountAmount: discountAmount ?? this.discountAmount,
        advanceAmount: advanceAmount ?? this.advanceAmount,
        balanceAmount: balanceAmount ?? this.balanceAmount,
        dateNdTime: dateNdTime ?? this.dateNdTime,
        id: id ?? this.id,
        male: male ?? this.male,
        female: female ?? this.female,
        branch: branch ?? this.branch,
        treatments: treatments ?? this.treatments,
      );

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        name: json["name"],
        excecutive: json["excecutive"],
        payment: json["payment"],
        phone: json["phone"],
        address: json["address"],
        totalAmount: json["total_amount"],
        discountAmount: json["discount_amount"],
        advanceAmount: json["advance_amount"],
        balanceAmount: json["balance_amount"],
        dateNdTime: json["date_nd_time"],
        id: json["id"],
        male: json["male"],
        female: json["female"],
        branch: json["branch"],
        treatments: json["treatments"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "excecutive": excecutive,
        "payment": payment,
        "phone": phone,
        "address": address,
        "total_amount": totalAmount,
        "discount_amount": discountAmount,
        "advance_amount": advanceAmount,
        "balance_amount": balanceAmount,
        "date_nd_time": dateNdTime,
        "id": id,
        "male": male,
        "female": female,
        "branch": branch,
        "treatments": treatments,
      };
}
