import 'package:flutter/material.dart';
import 'package:pasir/data/model/cow.dart';
import 'package:pasir/main.dart';
import 'package:pasir/presentation/provider/cow_provider.dart';
import 'package:pasir/presentation/widget/button_custom.dart';
import 'package:pasir/presentation/widget/snackbar_error.dart';
import 'package:provider/provider.dart';

import '../../widget/row_date_input.dart';
import '../../widget/row_input.dart';
import '../../widget/stroke_text.dart';

class InspectionAddPages extends StatefulWidget {
  const InspectionAddPages({Key? key}) : super(key: key);

  @override
  State<InspectionAddPages> createState() => _InspectionAddPagesState();
}

class _InspectionAddPagesState extends State<InspectionAddPages> {
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  DataDateTime dateTime = DataDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff82C5BE),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                child: const StrokeText(
                  text: 'TAMBAH DATA PEMERIKSAAN',
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  RowInputs(
                    titleText: 'Eartag',
                    hintText: '50531',
                    controller: controller[9],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Jenis Sapi',
                    hintText: 'White Brahman',
                    controller: controller[0],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Grade',
                    hintText: 'A',
                    controller: controller[1],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Sex',
                    hintText: 'Betina',
                    controller: controller[2],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Bobot',
                    hintText: '700',
                    controller: controller[3],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Umur',
                    hintText: '5',
                    controller: controller[4],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Kedatangan',
                    hintText: '8',
                    controller: controller[5],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'No Kandang',
                    hintText: 'A10',
                    controller: controller[6],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'No Hospital',
                    hintText: 'D1',
                    controller: controller[7],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Gejala',
                    hintText: 'Nafsu Makan',
                    controller: controller[8],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowDateInputs(
                      titleText: 'Tanggal Masuk',
                      hintText: '',
                      dateTime: dateTime),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ButtonCustom(
                  text: 'Tambah',
                  onTap: () {
                    bool valid = true;
                    for (TextEditingController i in controller) {
                      if (i.text.isEmpty) {
                        snackbarError(context,
                            message: 'Semua Kolom harus terisi');
                        valid = false;
                        break;
                      }
                    }

                    try {
                      int.parse(controller[3].text);
                      int.parse(controller[4].text);
                      int.parse(controller[5].text);
                    } catch (e) {
                      valid = false;
                      snackbarError(context, message: 'Kolom tidak valid');
                    }

                    if (valid) {
                      handler
                          .addNewData(Cow(
                        id: controller[9].text,
                        type: controller[0].text,
                        grade: controller[1].text,
                        gender: controller[2].text,
                        weight: int.parse(controller[3].text),
                        age: int.parse(controller[4].text),
                        arrival: int.parse(controller[5].text),
                        placeNumber: controller[6].text,
                        hospitalId: controller[7].text,
                        disease: controller[8].text,
                        dateComes: dateTime.dateTime,
                      ))
                          .then((value) {
                        if (value['bool']) {
                          snackbarSuccess(context,
                              message: 'Berhasi Menambah Data');
                          context
                              .read<CowProvider>()
                              .addOfflineData(value['data']);
                          Navigator.pop(context);
                        } else {
                          snackbarError(context,
                              message:
                                  'Ada Masalah Saat Menambah Data, ${value['message']}');
                        }

                        Navigator.pop(context);
                      });

                      showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
              const SizedBox(
                height: 12,
              ),
              ButtonCustom(
                text: ' Kembali ',
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataDateTime {
  DateTime dateTime;

  DataDateTime(this.dateTime);
}
