import 'package:flutter/material.dart';

class RowInputArea extends StatelessWidget {
  const RowInputArea(
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              titleText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  controller: controller,
                  minLines: 6,
                  maxLines: 6,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 6,
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
