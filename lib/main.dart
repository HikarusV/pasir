import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pasir/common/firestore/firestore_handler.dart';
import 'package:pasir/presentation/pages/auth_pages.dart';
import 'package:pasir/presentation/provider/auth_provider.dart';
import 'package:pasir/presentation/provider/cow_provider.dart';
import 'package:provider/provider.dart';

late FirestoreHandler handler;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  handler = FirestoreHandler(FirebaseDatabase.instance.ref());

  // databaseReference
  //     .once()
  //     .then((value) => print('=== Data : ${value.snapshot.value}'));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AccountProv>(
        create: (context) => AccountProv(),
      ),
      ChangeNotifierProvider<CowProvider>(
        create: (context) => CowProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.happyMonkeyTextTheme(),
      ),
      home: const AuthPages(),
    );
  }
}
