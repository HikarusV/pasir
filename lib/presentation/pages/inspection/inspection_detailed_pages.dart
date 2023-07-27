import 'package:flutter/material.dart';
import 'package:pasir/main.dart';
import 'package:pasir/presentation/widget/button_custom.dart';
import 'package:pasir/presentation/widget/stroke_text.dart';
import 'package:provider/provider.dart';

import '../../../data/model/cow.dart';
import '../../provider/cow_provider.dart';
import 'inspection_edited_pages.dart';

class InspectionDetailedPages extends StatelessWidget {
  const InspectionDetailedPages({Key? key, required this.cowData})
      : super(key: key);
  final Cow cowData;

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
                  text: 'DETAIL PEMERIKSAAN',
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Eartag',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.id}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Jenis Sapi',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.type}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Grade',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.grade}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Sex',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.gender}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Bobot',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.weight}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Umur',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.age}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Kedatangan',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.arrival}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'No Kandang',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.placeNumber}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'No Hospital',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.hospitalId}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Gejala',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.disease}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Tanggal Masuk',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                      Expanded(
                          flex: 3,
                          child: Text(
                            ': ${cowData.dateCome.day}/${cowData.dateCome.month}/${cowData.dateCome.year}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              ButtonCustom(
                text: '  Ubah  ',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InspectionEditedPages(
                        cowData: cowData,
                      ),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonCustom(
                text: ' Hapus ',
                onTap: () {
                  bool confirm = false;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        alignment: Alignment.center,
                        child: Container(
                          height: 120,
                          width: 250,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: 100,
                                  width: 250,
                                  child: const Text('Apakah anda yakin?'),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonCustom(
                                      text: 'Ya',
                                      onTap: () {
                                        confirm = true;
                                        Navigator.pop(context);
                                      },
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    ButtonCustom(
                                      text: 'Tidak',
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).then((value) {
                    if (confirm) {
                      handler.deleteCowData(cowData.id);
                      Navigator.pop(context);
                      context.read<CowProvider>().deletedData(cowData.id);
                    }
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonCustom(
                text: 'Kembali',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
