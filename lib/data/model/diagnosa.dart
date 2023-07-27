import 'dart:convert';

class Diagnosa {
  String diagnosa;
  String officer;

  Diagnosa({
    this.diagnosa = 'Default Diagnosa',
    this.officer = 'Default Officer',
  });

  factory Diagnosa.fromMap(Map<String, dynamic> map) {
    return Diagnosa(
      diagnosa: map['diagnosa'],
      officer: map['officer'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diagnosa': diagnosa,
      'officer': officer,
    };
  }

  String toJson() {
    Map<String, dynamic> map = toMap();
    return json.encode(map);
  }
}
