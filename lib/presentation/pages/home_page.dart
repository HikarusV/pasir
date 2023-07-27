import 'package:flutter/material.dart';
import 'package:pasir/presentation/pages/diagnosa/diagnosa_pages.dart';
import 'package:pasir/presentation/pages/profile_pages.dart';
import 'package:pasir/presentation/pages/record/record_pages.dart';
import 'package:pasir/presentation/widget/icons_custom.dart';

import '../widget/stroke_text.dart';
import 'inspection/inspection_pages.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff82C5BE),
      body: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              color: Colors.amber,
              child: Image.asset('assets/images/cow.png', scale: 1.8),
            ),
          ),
          Positioned(
            top: 60,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const StrokeText(
                    size: 22,
                    text: 'CATATAN PEMERIKSAAN RUTIN SAPI',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 350,
                    width: MediaQuery.of(context).size.width - 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: IconsCustom(
                            text: 'Profile',
                            keys: 'icon2',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePages(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconsCustom(
                                text: 'Catatan\nPemeriksaan',
                                keys: 'icon3',
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const InspectionPages(),
                                    )),
                              ),
                              IconsCustom(
                                text: 'Diagnosa\nKesehatan',
                                keys: 'icon1',
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DiagnosaPages(),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconsCustom(
                            text: 'Rekam Medis',
                            keys: 'icon4',
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RecordPages(),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
