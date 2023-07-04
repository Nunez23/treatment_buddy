import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/medical_history.dart';

class MedicalHistoryService {
  final CollectionReference medCollection =
      FirebaseFirestore.instance.collection('medical_history');

  Future<List<MedicalHistory>> getMedicalHistory(String userId) async {
    try {
      final querySnapshot =
          await medCollection.where('userId', isEqualTo: userId).get();
      final medicalHistoryList = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return MedicalHistory(
          id: doc.id,
          userId: data['userId'],
          medicine: data['medicine'],
          diagnosis: data['diagnosis'],
          treatmentBuddy: data['treatmentBuddy'],
        );
      }).toList();
      return medicalHistoryList;
    } catch (e) {
      if (kDebugMode) {
        print('Error retrieving medical history: $e');
      }
      return [];
    }
  }

  Future<void> addMedicalHistory(MedicalHistory medHistory) async {
    try {
      await medCollection.add({
        'userId': medHistory.userId,
        'diagnosis': medHistory.diagnosis,
        'medicine': medHistory.medicine,
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error adding medical history: $e');
      }
    }
  }

  Future<void> deleteMedicalHistory(String historyId) async {
    await medCollection.doc(historyId).delete();
  }
}
