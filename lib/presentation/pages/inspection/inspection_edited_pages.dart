import 'package:flutter/material.dart';
import 'package:pasir/data/model/cow.dart';
import 'package:pasir/presentation/provider/cow_provider.dart';
import 'package:pasir/presentation/widget/button_custom.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../widget/row_date_input.dart';
import '../../widget/row_input.dart';
import '../../widget/snackbar_error.dart';
import '../../widget/stroke_text.dart';
import 'inspection_add_pages.dart';

class InspectionEditedPages extends StatefulWidget {
  const InspectionEditedPages({Key? key, required this.cowData})
      : super(key: key);
  final Cow cowData;

  @override
  State<InspectionEditedPages> createState() => _InspectionEditedPagesState();
}

class _InspectionEditedPagesState extends State<InspectionEditedPages> {
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
  ];

  List<String> key = [
    'type',
    'grade',
    'gender',
    'weight',
    'age',
    'arrival',
    'placeNumber',
    'hospitalId',
    'disease',
    'dateCome',
  ];

  DataDateTime dateTime = DataDateTime(DateTime.now());

  @override
  void initState() {
    dateTime.dateTime = widget.cowData.dateCome;
    super.initState();
  }

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
                  text: 'UBAH DATA PEMERIKSAAN',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  widget.cowData.id,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  RowInputs(
                    titleText: 'Jenis Sapi',
                    hintText: widget.cowData.type,
                    controller: controller[0],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Grade',
                    hintText: widget.cowData.grade,
                    controller: controller[1],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Sex',
                    hintText: widget.cowData.gender,
                    controller: controller[2],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Bobot',
                    hintText: widget.cowData.weight.toString(),
                    controller: controller[3],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Umur',
                    hintText: widget.cowData.age.toString(),
                    controller: controller[4],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Kedatangan',
                    hintText: widget.cowData.arrival.toString(),
                    controller: controller[5],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'No Kandang',
                    hintText: widget.cowData.placeNumber.toString(),
                    controller: controller[6],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'No Hospital',
                    hintText: widget.cowData.hospitalId,
                    controller: controller[7],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Gejala',
                    hintText: widget.cowData.disease,
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
                  text: '  Ubah  ',
                  onTap: () {
                    bool valid = false;

                    Map<String, dynamic> updateBuffer = {};

                    for (int i = 0; i < controller.length; i++) {
                      if (controller[i].text.isNotEmpty) {
                        updateBuffer[key[i]] = controller[i].text;
                        valid = true;
                      }
                    }

                    try {
                      for (int i = 3; i < 6; i++) {
                        if (controller[i].text.isNotEmpty) {
                          updateBuffer[key[i]] = int.parse(controller[i].text);
                        }
                      }
                    } catch (e) {
                      valid = false;
                      snackbarError(context, message: 'Kolom tidak valid');
                    }

                    if (dateTime.dateTime != widget.cowData.dateCome) {
                      valid = true;
                      updateBuffer[key[9]] = dateTime.dateTime.toString();
                    }

                    if (valid) {
                      handler
                          .updateCowData(updateBuffer, widget.cowData.id)
                          .then((value) {
                        if (value['bool']) {
                          snackbarSuccess(context,
                              message: 'Berhasi Mengubah Data');
                          context
                              .read<CowProvider>()
                              .updateData(widget.cowData.id, updateBuffer);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          snackbarError(context,
                              message:
                                  'Ada Masalah Saat Mengubah Data, ${value['message']}');
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
