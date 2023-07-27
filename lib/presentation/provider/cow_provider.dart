import 'package:flutter/material.dart';
import 'package:pasir/data/model/diagnosa.dart';
import 'package:pasir/main.dart';

import '../../data/model/cow.dart';

class CowProvider with ChangeNotifier {
  ResultState cowState = ResultState.empty;
  List<Cow> cowDataList = [];
  List<Cow> cowDataBuffer = [];

  Future searchData(String id) async {
    // print('Search');
    cowDataList = List.from(cowDataBuffer);
    if (id.isNotEmpty) {
      cowDataList.removeWhere((element) => (!element.id.contains(id)));
    }
    cowState = cowDataList.isEmpty ? ResultState.noData : ResultState.hasData;
    notifyListeners();
  }

  void backUp() {
    cowDataBuffer = List.from(cowDataList);
  }

  Future fetchAllCowData() async {
    cowState = ResultState.loading;
    notifyListeners();

    handler.getAllData().then((value) {
      // print('=== ${value.length}');
      cowDataList = value;
      backUp();
      cowState = cowDataList.isEmpty ? ResultState.noData : ResultState.hasData;
      notifyListeners();
    }).onError((error, stackTrace) {
      cowState = ResultState.error;
      notifyListeners();
    });
  }

  Future addOfflineData(Cow data) async {
    cowDataList.add(data);
    backUp();
    cowState = cowDataList.isEmpty ? ResultState.noData : ResultState.hasData;
    notifyListeners();
  }

  Future deletedData(String id) async {
    cowDataList.removeWhere((element) => element.id == id);
    backUp();
    cowState = ResultState.hasData;
    notifyListeners();
  }

  Future addDiagnosisData(String id, Diagnosa diagnosa) async {
    cowDataList[cowDataList.indexWhere((element) => element.id == id)]
        .diagnosa = diagnosa;
    backUp();
    cowState = ResultState.hasData;
    notifyListeners();
  }

  Future updateData(String id, Map<String, dynamic> data) async {
    int loop = 0;
    for (Cow i in cowDataList) {
      if (i.id == id) {
        Map<String, dynamic> buffer = i.toMap();

        List<String> key = data.keys.toList();
        List values = data.values.toList();

        for (int i = 0; i < key.length; i++) {
          buffer[key[i]] = values[i];
        }
        cowDataList[loop] = Cow.fromMap(buffer);
        break;
      }
      loop++;
    }
    backUp();
    notifyListeners();
  }
}

enum ResultState { hasData, empty, noData, loading, error }
