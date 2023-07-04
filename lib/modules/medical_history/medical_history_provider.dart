import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/medical_history.dart';
import 'medical_history_service.dart';

final medicalHistoryProvider = Provider<MedicalHistoryProvider>((ref) {
  final medService = MedicalHistoryService();

  Future<List<MedicalHistory>> getMedicalHistories(String userId) async {
    final medicalHistories = await medService.getMedicalHistory(userId);
    return medicalHistories;
  }

  Future<void> addMedicalHistory(MedicalHistory medicalHistory) async {
    await medService.addMedicalHistory(medicalHistory);
  }

  Future<void> deleteMedicalHistory(String historyId) async {
    await medService.deleteMedicalHistory(historyId);
  }

  return MedicalHistoryProvider(
    getMedicalHistories: getMedicalHistories,
    addMedicalHistory: addMedicalHistory,
    deleteMedicalHistory: deleteMedicalHistory,
  );
});

class MedicalHistoryProvider {
  final Future<List<MedicalHistory>> Function(String) getMedicalHistories;
  final Future<void> Function(MedicalHistory) addMedicalHistory;
  final Future<void> Function(String) deleteMedicalHistory;

  MedicalHistoryProvider({
    required this.getMedicalHistories,
    required this.addMedicalHistory,
    required this.deleteMedicalHistory,
  });
}
