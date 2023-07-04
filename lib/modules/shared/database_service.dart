import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/blood_pressure.dart';
import '../../models/clinic.dart';
import '../../models/medical_history.dart';
import '../../models/medication.dart';

class DatabaseService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<void> addMedication(Medication medication) async {
    await _fs
        .collection('medications')
        .doc(medication.id)
        .set(medication.toJson());
  }

  Future<void> updateMedication(Medication medication) async {
    await _fs
        .collection('medications')
        .doc(medication.id)
        .update(medication.toJson());
  }

  Future<void> deleteMedication(String medicationId) async {
    await _fs.collection('medications').doc(medicationId).delete();
  }

  Future<List> getMedications(String userId) async {
    final snapshot = await _fs
        .collection('medications')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => Medication.fromJson(doc.data())).toList();
  }

  Future<void> addMedicalHistory(MedicalHistory medicalHistory) async {
    await _fs
        .collection('medical_histories')
        .doc(medicalHistory.id)
        .set(medicalHistory.toJson());
  }

  Future<void> updateMedicalHistory(MedicalHistory medicalHistory) async {
    await _fs
        .collection('medical_histories')
        .doc(medicalHistory.id)
        .update(medicalHistory.toJson());
  }

  Future<void> deleteMedicalHistory(String historyId) async {
    await _fs.collection('medical_histories').doc(historyId).delete();
  }

  Future<List> getMedicalHistories(String userId) async {
    final snapshot = await _fs
        .collection('medical_histories')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs
        .map((doc) => MedicalHistory.fromJson(doc.data()))
        .toList();
  }

  Future<void> addBloodPressure(BloodPressure bloodPressure) async {
    await _fs
        .collection('blood_pressures')
        .doc(bloodPressure.id)
        .set(bloodPressure.toJson());
  }

  Future<void> updateBloodPressure(BloodPressure bloodPressure) async {
    await _fs
        .collection('blood_pressures')
        .doc(bloodPressure.id)
        .update(bloodPressure.toJson());
  }

  Future<void> deleteBloodPressure(String pressureId) async {
    await _fs.collection('blood_pressures').doc(pressureId).delete();
  }

  Future<List> getBloodPressures(String userId) async {
    final snapshot = await _fs
        .collection('blood_pressures')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => BloodPressure.data(doc)).toList();
  }

  Future<void> addClinic(Clinic clinic) async {
    await _fs.collection('clinics').doc(clinic.id).set(clinic.toJson());
  }

  Future<void> updateClinic(Clinic clinic) async {
    await _fs.collection('clinics').doc(clinic.id).update(clinic.toJson());
  }

  Future<void> deleteClinic(String clinicId) async {
    await _fs.collection('clinics').doc(clinicId).delete();
  }

  Future<List> getClinics(String userId) async {
    final snapshot = await _fs
        .collection('clinics')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((doc) => Clinic.fromJson(doc.data())).toList();
  }
}
