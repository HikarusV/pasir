import 'package:flutter/material.dart';
import 'package:pasir/presentation/provider/auth_provider.dart';
import 'package:pasir/presentation/widget/button_custom.dart';
import 'package:provider/provider.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff82C5BE),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 88,
              height: 88,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(90),
                image: const DecorationImage(
                  image: AssetImage('assets/images/icon2.png'),
                  scale: 0.6,
                  // fit: BoxFit.fitHeight,
                ),
                border: Border.all(
                    width: 6,
                    color: const Color(0xFF2A6265),
                    strokeAlign: BorderSide.strokeAlignOutside),
              ),
            ),
            const SizedBox(
              height: 41,
            ),
            Text(
              'FullName',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Container(
              height: 1,
              width: 270,
              margin: const EdgeInsets.only(top: 14),
              color: Colors.black,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Job',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Container(
              height: 1,
              width: 270,
              margin: const EdgeInsets.only(top: 14),
              color: Colors.black,
            ),
            SizedBox(
              height: 64,
            ),
            ButtonCustom(
              text: 'Kembali',
              onTap: () => Navigator.pop(context),
            ),
            SizedBox(
              height: 12,
            ),
            ButtonCustom(
              text: ' Logout ',
              onTap: () {
                context
                    .read<AccountProv>()
                    .logOut()
                    .then((value) => Navigator.pop(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
