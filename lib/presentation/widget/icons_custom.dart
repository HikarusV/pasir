import 'package:flutter/material.dart';

class IconsCustom extends StatelessWidget {
  const IconsCustom({
    Key? key,
    this.text = 'Text',
    this.alignment,
    this.keys = 'icon1',
    this.onTap,
  }) : super(key: key);
  final String text;
  final Alignment? alignment;
  final String keys;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                image: AssetImage('assets/images/$keys.png'),
                // fit: BoxFit.fitHeight,
              ),
              border: Border.all(
                  width: 3,
                  color: const Color(0xFF2A6265),
                  strokeAlign: BorderSide.strokeAlignOutside),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
