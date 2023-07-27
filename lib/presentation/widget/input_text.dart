import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({Key? key, this.text = "username", this.controller})
      : super(key: key);
  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xFF2A6265),
                  ),
                ),
              ),
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}
