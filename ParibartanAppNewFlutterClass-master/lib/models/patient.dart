import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
  Patient({
    required this.data,
    required this.meta,
  });

  final List<Datum> data;
  final Meta meta;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.name,
    required this.birthdate,
    required this.gender,
    required this.education,
    required this.place,
    required this.address,
    required this.maritialstatus,
    required this.occupation,
    required this.phone,
    required this.alertstartfrom,
    required this.alerttime,
    required this.bloodgroup,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  final String name;
  final String birthdate;
  final String gender;
  final String education;
  final String place;
  final String address;
  final String maritialstatus;
  final String occupation;
  final String phone;
  final String alertstartfrom;
  final String alerttime;
  final String bloodgroup;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        birthdate: json["birthdate"],
        gender: json["gender"],
        education: json["education"],
        place: json["place"],
        address: json["address"],
        maritialstatus: json["maritialstatus"],
        occupation: json["occupation"],
        phone: json["phone"],
        alertstartfrom: (json["alertstartfrom"]),
        alerttime: json["alerttime"],
        bloodgroup: json["bloodgroup"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birthdate": birthdate,
        "gender": gender,
        "education": education,
        "place": place,
        "address": address,
        "maritialstatus": maritialstatus,
        "occupation": occupation,
        "phone": phone,
        "alertstartfrom": alertstartfrom,
        "alerttime": alerttime,
        "bloodgroup": bloodgroup,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  final Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
