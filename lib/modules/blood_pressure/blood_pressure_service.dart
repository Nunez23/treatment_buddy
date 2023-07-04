import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../../models/blood_pressure.dart';

class BloodPressureService {
  final CollectionReference _readings =
  FirebaseFirestore.instance.collection('bloodPressureReadings');
  final bpCollection = FirebaseFirestore.instance.collection('bloodPressure');

  final id = const Uuid().v4();

  void addBloodPressureReading(int systolic, int diastolic) async {
    try {
      final timestamp = DateTime.now();
      final newReading = BloodPressure(
        id: id,
        systolic: systolic,
        diastolic: diastolic,
        timestamp: timestamp,
      );
      await _readings.add(newReading);
      // Calculation of the average blood pressure
      final readingsSnapshot = await _readings.get();
      final readings =
      readingsSnapshot.docs.map((doc) => BloodPressure.data(doc)).toList();
      final averageSystolic = readings
          .map((reading) => reading.systolic)
          .reduce((sum, value) => sum + value) ~/
          readings.length;
      final averageDiastolic = readings
          .map((reading) => reading.diastolic)
          .reduce((sum, value) => sum + value) ~/
          readings.length;
      if (kDebugMode) {
        print('Average Blood Pressure: $averageSystolic/$averageDiastolic');
      }

      await bpCollection.doc(newReading.id).set({
        'systolic': newReading.systolic,
        'diastolic': newReading.diastolic,
        'timestamp': newReading.timestamp,
      });

      // todo: send a notification to patient
      // NotificationService.sendNotification('Blood Pressure Reading Added', 'Your blood pressure reading has been successfully added.');
    } catch (e) {
      // todo: implement error handling here
    }
  }

  void deleteBloodPressureReading() async {
    try {
      await bpCollection.doc(id).delete();
      // print('Blood pressure reading deleted successfully');
    } catch (e) {
      // Perform any necessary error handling
    }
  }

  Future<List<BloodPressure>> getBloodPressureReadings() async {
    try {
      final snapshot = await bpCollection.get();
      final readings = snapshot.docs.map((doc) {
        final data = doc.data();
        return BloodPressure(
          id: doc.id,
          systolic: data['systolic'],
          diastolic: data['diastolic'],
          timestamp: data['timestamp'],
        );
      }).toList();
      return readings;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
}
