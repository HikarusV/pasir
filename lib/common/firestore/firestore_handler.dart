import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:pasir/data/model/diagnosa.dart';

import '../../data/model/cow.dart';

class FirestoreHandler {
  final DatabaseReference databaseReference;
  String userId = '';
  String email = '';

  FirestoreHandler(this.databaseReference);

  Future userInit(String id, String email) async {}

  Future<Map<String, dynamic>> updateCowData(
      Map<String, dynamic> data, String id) async {
    DataSnapshot snapshot = await databaseReference.child(id).get();
    bool exist = snapshot.exists;

    if (exist) {
      Map<String, dynamic> buffer = data;
      buffer.addAll({
        'updateBy': userId,
        'updateByEmail': email,
      });

      databaseReference.child(id).update(buffer);

      return {'bool': true, 'message': 'Berhasil'};
    } else {
      return {'bool': false, 'message': 'Data tidak ditemukan'};
    }
  }

  Future deleteCowData(String id) async {
    databaseReference.child(id).remove();
  }

  // Future<List<Cow>>
  Future<List<Cow>> getAllData() async {
    final snapshot = await databaseReference.once();
    List<Cow> buffer = [];
    // print(snapshot.snapshot.value);
    // print('=====');
    if (snapshot.snapshot.value == null) {
      return buffer;
    }

    Map<String, dynamic> data = Map<String, dynamic>.from(
        snapshot.snapshot.value as Map<dynamic, dynamic>);
    //
    // print('=====1');
    // print(data);
    // print('=====2');

    data.forEach((key, value) {
      Map<String, dynamic> iterationData =
          Map<String, dynamic>.from(value as Map<dynamic, dynamic>);
      Map<String, dynamic> bufferData = {};
      iterationData.forEach((key, value) {
        // print('*** $key : $value');
        bufferData.addAll(
            toObjectMap(key, value, stringValue: (key.toString() == 'id')));
      });
      for (String i in bufferData.keys) {
        print(i);
      }
      buffer.add(Cow.fromMap(bufferData));
      print('end parse');
    });

    print(buffer[0].id);
    print(buffer[0].type);
    return buffer;
  }

  Future<Map<String, dynamic>> addNewData(Cow data) async {
    DataSnapshot snapshot = await databaseReference.child(data.id).get();
    bool exist = snapshot.exists;

    if (!exist) {
      Map<String, dynamic> buffer = data.toMap();
      buffer.addAll({
        'createdBy': userId,
        'createdByEmail': email,
      });

      databaseReference.child(data.id).set(buffer);

      return {'bool': true, 'message': 'Berhasil', 'data': data};
    } else {
      return {'bool': false, 'message': 'Eartag Sudah digunakan'};
    }
  }

  Future<Map<String, dynamic>> addNewDiagnosis(
      Diagnosa diagnosa, String id) async {
    DataSnapshot snapshot = await databaseReference.child(id).get();
    bool exist = snapshot.exists;

    if (exist) {
      Map<String, dynamic> buffer = diagnosa.toMap();
      buffer.addAll({
        'diagnosaBy': userId,
        'diagnosaByEmail': email,
      });

      databaseReference.child(id).update(buffer);

      await Future.delayed(const Duration(microseconds: 500));

      return {'bool': true, 'message': 'Berhasil', 'data': diagnosa};
    } else {
      return {'bool': false, 'message': 'Data Tidak Ditemukan'};
    }
  }

  Map<String, dynamic> toObjectMap(dynamic key, dynamic value,
      {bool stringValue = false}) {
    String convertValue = value.toString();
    String convertKey = key.toString();

    Map<String, dynamic> result;

    if (stringValue) {
      return {convertKey: convertValue};
    } else {
      try {
        int test = int.parse(convertValue);

        result = {convertKey: test};
      } catch (e) {
        result = {convertKey: convertValue};
      }

      return result;
    }
  }
}
