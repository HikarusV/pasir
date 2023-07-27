import 'package:flutter/material.dart';
import 'package:pasir/presentation/widget/button_custom.dart';
import 'package:pasir/presentation/widget/stroke_text.dart';

import '../../../data/model/cow.dart';
import 'diagnosa_add_pages.dart';

class DiagnosaDetailedPages extends StatelessWidget {
  const DiagnosaDetailedPages({Key? key, required this.cowData})
      : super(key: key);
  final Cow cowData;

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
                  text: 'DETAIL KESEHATAN',
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
                  cowData.diagnosa != null
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Diagnosa',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Text(
                                      ': ${cowData.diagnosa!.diagnosa}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ))
                              ],
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              cowData.diagnosa == null
                  ? Column(
                      children: [
                        ButtonCustom(
                          text: '  Tambah Diagnosa  ',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiagnosaAddPages(
                                  id: cowData.id,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    )
                  : Container(),
              ButtonCustom(
                text: '            Kembali             ',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
