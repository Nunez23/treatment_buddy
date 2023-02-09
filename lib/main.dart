import 'package:flutter/material.dart';

import 'ui/patient_information/patient_information.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treatment Buddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PatientListPage(),
    );
  }
}
