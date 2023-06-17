import 'package:dhis_map/services/session.dart';
import 'package:dhis_map/views/dhismap.dart';
import 'package:flutter/material.dart';

Future main() async {
   await SessionPref.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DHIS2',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MapScreen(),
    );
  }
}

