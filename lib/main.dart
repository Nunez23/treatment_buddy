import 'package:flutter/material.dart';
import 'ui/patient_information/patient_information.page.dart';

void main() {
  runApp(const TreatmentApp());
}

class TreatmentApp extends StatelessWidget {
  const TreatmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treatment Buddy',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PatientListPage(),
    );
  }
}
