import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treatment_buddy/models/blood_pressure.dart';

import 'blood_pressure_service.dart';

final bloodPressureProvider = Provider<BloodPressureProvider>((ref) {
  final bloodPressureService = BloodPressureService();

  Future<List<BloodPressure>> getBloodPressureReadings(String userId) async {
    final bloodPressureReadings =
        await bloodPressureService.getBloodPressureReadings();
    return bloodPressureReadings;
  }

  Future<void> addBloodPressureReading(BloodPressure bp) async {
    bloodPressureService.addBloodPressureReading(bp.diastolic, bp.systolic);
  }

  Future<void> deleteBloodPressureReading(String readingId) async {
    bloodPressureService.deleteBloodPressureReading();
  }

  return BloodPressureProvider(
    getBloodPressureReadings: getBloodPressureReadings,
    addBloodPressureReading: addBloodPressureReading,
    deleteBloodPressureReading: deleteBloodPressureReading,
  );
});

class BloodPressureProvider {
  final Future<List<BloodPressure>> Function(String) getBloodPressureReadings;
  final Future<void> Function(BloodPressure) addBloodPressureReading;
  final Future<void> Function(String) deleteBloodPressureReading;

  BloodPressureProvider({
    required this.getBloodPressureReadings,
    required this.addBloodPressureReading,
    required this.deleteBloodPressureReading,
  });
}
