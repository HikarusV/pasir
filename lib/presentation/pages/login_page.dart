import 'package:flutter/material.dart';
import 'package:pasir/main.dart';
import 'package:pasir/presentation/provider/auth_provider.dart';
import 'package:pasir/presentation/widget/input_text.dart';
import 'package:pasir/presentation/widget/password_field.dart';
import 'package:pasir/presentation/widget/stroke_text.dart';
import 'package:provider/provider.dart';

import '../widget/button_custom.dart';
import '../widget/snackbar_error.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

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
                    text: 'LOGIN',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InputText(
                    controller: email,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  PasswordField(
                    controller: password,
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  ButtonCustom(
                    text: 'Login',
                    onTap: () {
                      context
                          .read<AccountProv>()
                          .signInMailPass(email.text, password.text)
                          .then((value) {
                        handler.userInit(value.user!.uid, value.user!.email!);
                        Navigator.pop(context);
                      }).onError((error, stackTrace) {
                        String message = error.toString();
                        if (message.contains('firebase_auth/unknown')) {
                          message = 'Semua kolom harus di isi';
                        } else if (message
                            .contains('firebase_auth/invalid-email')) {
                          message = "Format Email Salah";
                        } else if (message
                            .contains('firebase_auth/user-not-found')) {
                          message =
                              "User tidak ditemukan, periksa kembali alamat email atau User mungkin telah dihapus";
                        } else if (message
                            .contains('firebase_auth/wrong-password')) {
                          message = "Password salah, silahkan coba lagi";
                        } else if (message.contains(
                            'Unable to establish connection on channel.')) {
                          message = "Harap isi semua kolom";
                        }
                        // else {
                        //   print(message + "====");
                        // }

                        Navigator.pop(context);
                        snackbarError(context, duration: 5, message: message);
                      });
                      showDialog(
                        context: context,
                        builder: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    },
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
