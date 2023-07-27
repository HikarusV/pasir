import 'package:flutter/material.dart';
import 'package:pasir/presentation/pages/inspection/inspection_add_pages.dart';

class RowDateInputs extends StatefulWidget {
  const RowDateInputs(
      {Key? key,
      this.hintText = 'Title',
      this.titleText = 'Masukkan',
      required this.dateTime})
      : super(key: key);
  final String hintText;
  final String titleText;
  final DataDateTime dateTime;

  @override
  State<RowDateInputs> createState() => _RowDateInputsState();
}

class _RowDateInputsState extends State<RowDateInputs> {
  late DateTime tanggalMasuk;

  @override
  void initState() {
    tanggalMasuk = widget.dateTime.dateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            widget.titleText,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${tanggalMasuk.day}/${tanggalMasuk.month}/${tanggalMasuk.year}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime? result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2030),
                        );

                        setState(() {
                          tanggalMasuk = result ?? tanggalMasuk;
                          widget.dateTime.dateTime = tanggalMasuk;
                        });
                      },
                      child: Image.asset('assets/images/calendar.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
