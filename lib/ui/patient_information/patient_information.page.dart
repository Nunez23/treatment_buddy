import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient information')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Center(
            child: Text(
              '${faker.person.firstName()} ${faker.person.lastName()}',
            ),
          );
        },
      ),
    );
  }
}
