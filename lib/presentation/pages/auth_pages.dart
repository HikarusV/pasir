import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pasir/presentation/pages/home_page.dart';
import 'package:pasir/presentation/pages/login_page.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class AuthPages extends StatelessWidget {
  const AuthPages({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final dataAccount = context.watch<AccountProv>();
          dataAccount.getCurentUser();

          return const HomePages();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ada yang error!!'),
          );
        } else {
          return const LoginPages();
        }
      },
    );
  }
}
