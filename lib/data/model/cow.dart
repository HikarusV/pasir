import 'dart:convert';

import 'diagnosa.dart';

class Cow {
  String id;
  String type;
  String gender;
  String grade;
  int weight;
  int age;
  int arrival;
  String placeNumber;
  String disease;
  String hospitalId;
  DateTime dateCome;
  Diagnosa? diagnosa;

  Cow({
    this.id = '',
    this.type = '',
    this.gender = '',
    this.grade = '',
    this.weight = 0,
    this.age = 0,
    this.arrival = 0,
    this.placeNumber = '',
    this.disease = '',
    this.hospitalId = '',
    DateTime? dateComes,
    this.diagnosa,
  }) : dateCome = dateComes ?? DateTime.now();

  factory Cow.fromMap(Map<String, dynamic> map) {
    Cow data = Cow(
      id: map['id'],
      type: map['type'],
      gender: map['gender'],
      grade: map['grade'],
      weight: map['weight'],
      age: map['age'],
      arrival: map['arrival'],
      placeNumber: map['placeNumber'],
      disease: map['disease'],
      hospitalId: map['hospitalId'],
      dateComes: DateTime.parse(map['dateCome']),
    );

    if (map.containsKey('diagnosa')) {
      data.diagnosa = Diagnosa.fromMap(
          {'diagnosa': map['diagnosa'], 'officer': map['officer']});
    }

    return data;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      'id': id,
      'type': type,
      'gender': gender,
      'grade': grade,
      'weight': weight,
      'age': age,
      'arrival': arrival,
      'placeNumber': placeNumber,
      'disease': disease,
      'hospitalId': hospitalId,
      'dateCome': dateCome.toIso8601String(),
    };

    if (diagnosa != null) {
      data.addAll({
        'diagnosa': diagnosa?.toMap(),
      });
    }

    return data;
  }

  String toJson() {
    Map<String, dynamic> map = toMap();
    return json.encode(map);
  }
}
