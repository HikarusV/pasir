import 'package:flutter/material.dart';
import 'package:pasir/presentation/pages/inspection/inspection_add_pages.dart';
import 'package:pasir/presentation/widget/cow_card.dart';
import 'package:pasir/presentation/widget/icons_custom.dart';
import 'package:pasir/presentation/widget/stroke_text.dart';
import 'package:provider/provider.dart';

import '../../../data/model/cow.dart';
import '../../provider/cow_provider.dart';
import 'diagnosa_detailed_pages.dart';

class DiagnosaPages extends StatelessWidget {
  const DiagnosaPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff82C5BE),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Row(
              children: [
                Icon(
                  Icons.house,
                  size: 26,
                ),
                SizedBox(
                  width: 4,
                ),
                StrokeText(
                  text: 'DIAGNOSA KESEHATAN',
                  size: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: 0,
                          top: 0,
                          child: Image.asset('assets/images/icon_lup.png',
                              scale: 0.7),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Masukan Eartag',
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Container(
                  width: 38,
                  height: 38,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/icon2.png'),
                      // fit: BoxFit.fitHeight,
                    ),
                    border: Border.all(
                        width: 3,
                        color: const Color(0xFF2A6265),
                        strokeAlign: BorderSide.strokeAlignOutside),
                  ),
                ),
              ],
            ),
            // GAP Notification
            Container(),
            // GAP Notification
            Consumer<CowProvider>(builder: (context, value, child) {
              if (value.cowState == ResultState.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.cowDataList.length,
                  itemBuilder: (context, index) {
                    return CowCard(
                      targetPages: DiagnosaDetailedPages(
                          cowData: value.cowDataList[index]),
                      cowData: value.cowDataList[index],
                    );
                  },
                );
              } else if (value.cowState == ResultState.loading) {
                return const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (value.cowState == ResultState.error) {
                return const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text('Ada Yang Tidak Beres'),
                  ),
                );
              } else if (value.cowState == ResultState.noData) {
                return const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      'Data kosong',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text('Default Value'),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}