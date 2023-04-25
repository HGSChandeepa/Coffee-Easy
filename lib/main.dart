import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newappdemo/models/userdata.dart';
import 'package:newappdemo/screens/wrapper.dart';
import 'package:newappdemo/services/auth.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //here in the stream provider the value is the returning val
    return StreamProvider<UserData?>.value(
      initialData: UserData(uid: ""),
      value: AuthService().user,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
