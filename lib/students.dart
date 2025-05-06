class Student {
  String? id;
  String? email;
  int? personId;

  Student({this.id, this.email, this.personId});

  Student.fromJson(dynamic json) {
    id = json['peopleId'];
    email = json['email'];
    personId = json['personId'];
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['personId'] = personId;
    return json;
  }
}
