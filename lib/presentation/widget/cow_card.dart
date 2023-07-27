import 'package:flutter/material.dart';
import 'package:pasir/presentation/pages/inspection/inspection_detailed_pages.dart';

import '../../data/model/cow.dart';

class CowCard extends StatelessWidget {
  const CowCard({Key? key, required this.targetPages, required this.cowData})
      : super(key: key);
  final Widget targetPages;
  final Cow cowData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cowData.id,
                  style: const TextStyle(
                    color: Color(0xFF2A6265),
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Jenis Sapi : ${cowData.type}',
                  style: const TextStyle(
                    color: Color(0xFF82C5BE),
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Grade : ${cowData.grade}',
                  style: const TextStyle(
                    color: Color(0xFF82C5BE),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => targetPages,
                  )),
              child: const Text('Detailed'),
            ),
          )
        ],
      ),
    );
  }
}
