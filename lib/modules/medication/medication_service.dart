import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/medication.dart';

class MedicationService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<List<Medication>> getMedications(String userId) async {
    final querySnapshot = await _fs
        .collection('medications')
        .where('userId', isEqualTo: userId)
        .get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return Medication(
        id: doc.id,
        name: data['name'],
        dosage: data['dosage'],
        patientId: data['userId'],
        frequency: data['frequency'],
        startDate: (data['startDate'] as Timestamp).toDate(),
        endDate: (data['endDate'] as Timestamp).toDate(),
      );
    }).toList();
  }

  Future<void> addMedication(Medication medication) async {
    await _fs.collection('medications').add({
      'userId': medication.patientId,
      'name': medication.name,
      'dosage': medication.dosage,
      'frequency': medication.frequency,
      'startDate': medication.startDate,
      'endDate': medication.endDate,
    });
  }

  Future<void> deleteMedication(String medicationId) async {
    await _fs.collection('medications').doc(medicationId).delete();
  }
}
