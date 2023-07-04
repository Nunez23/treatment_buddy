import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/patient_information.dart';

class PatientProfileService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<PatientInformation> getPatientProfile(String userId) async {
    final snapshot = await _fs.collection('patient_profiles').doc(userId).get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      return PatientInformation(
        id: snapshot.id,
        name: data['name'],
        age: data['age'],
        gender: data['gender'],
        phoneNumber: data['phoneNumber'],
        address: data['address'],
        weight: data['weight'],
        height: data['height'],
        bmi: data['bmi'],
        diagnosis: data['diagnosis'],
        medicine: data['medicine'],
        treatmentBuddy: data['treatmentBuddy'],
      );
    } else {
      throw Exception('Patient profile not found');
    }
  }

  Future<void> updatePatientProfile(PatientInformation pp) async {
    await _fs.collection('patient_profiles').doc(pp.id).set({
      'name': pp.name,
      'age': pp.age,
      'gender': pp.gender,
      'phoneNumber': pp.phoneNumber,
      'address': pp.address,
      'weight': pp.weight,
      'height': pp.height,
      'bmi': pp.bmi,
      'diagnosis': pp.diagnosis,
      'medicine': pp.medicine,
      'treatmentBuddy': pp.treatmentBuddy,
    });
  }
}
