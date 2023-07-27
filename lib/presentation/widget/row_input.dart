import 'package:flutter/material.dart';

class RowInputs extends StatelessWidget {
  const RowInputs(
      {Key? key,
      this.hintText = 'Title',
      this.titleText = 'Masukkan',
      this.controller})
      : super(key: key);
  final String hintText;
  final String titleText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            titleText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
