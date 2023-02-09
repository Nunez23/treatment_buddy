import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:treatment_buddy/data/patient_information.dart';

class PatientListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient information')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              faker.person.firstName() + ' ' + faker.person.lastName(),
            ),
          );
        },
      ),
    );
  }
}
