import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({Key? key, this.text = 'text', this.onTap})
      : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xff2A6265),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
