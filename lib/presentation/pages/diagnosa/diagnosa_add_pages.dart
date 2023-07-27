import 'package:flutter/material.dart';
import 'package:pasir/data/model/diagnosa.dart';
import 'package:pasir/main.dart';
import 'package:pasir/presentation/widget/button_custom.dart';
import 'package:pasir/presentation/widget/row_input_area.dart';
import 'package:provider/provider.dart';

import '../../provider/cow_provider.dart';
import '../../widget/row_date_input.dart';
import '../../widget/row_input.dart';
import '../../widget/snackbar_error.dart';
import '../../widget/stroke_text.dart';

class DiagnosaAddPages extends StatefulWidget {
  const DiagnosaAddPages({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<DiagnosaAddPages> createState() => _DiagnosaAddPagesState();
}

class _DiagnosaAddPagesState extends State<DiagnosaAddPages> {
  TextEditingController diagnosa = TextEditingController();
  TextEditingController petuas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  RowInputArea(
                      titleText: 'Dianosa',
                      hintText: 'Diagnosa penyakit',
                      controller: diagnosa),
                  const SizedBox(
                    height: 12,
                  ),
                  RowInputs(
                    titleText: 'Nama petugas',
                    hintText: 'Nama',
                    controller: petuas,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ButtonCustom(
                  text: ' Simpan ',
                  onTap: () {
                    if (petuas.text.isNotEmpty && diagnosa.text.isNotEmpty) {
                      handler
                          .addNewDiagnosis(
                              Diagnosa(
                                  diagnosa: diagnosa.text,
                                  officer: petuas.text),
                              widget.id)
                          .then((value) {
                        if (value['bool']) {
                          snackbarSuccess(context,
                              message: 'Berhasi Menambah Diagnosa');
                          context
                              .read<CowProvider>()
                              .addDiagnosisData(widget.id, value['data']);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          snackbarError(context,
                              message:
                                  'Ada Masalah Saat Menambah Diagnosa, ${value['message']}');
                        }

                        Navigator.pop(context);
                      });
                    } else {
                      snackbarError(context,
                          message: 'Semua kolom wajib diisi');
                    }

                    showDialog(
                      context: context,
                      builder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
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
