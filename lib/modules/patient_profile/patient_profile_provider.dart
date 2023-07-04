import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treatment_buddy/modules/patient_profile/patient_profile_service.dart';

import '../../models/patient_information.dart';

final patientProfileProvider = Provider<PatientProfileProvider>((ref) {
  final patientProfileService = PatientProfileService();

  Future<PatientInformation> getPatientProfile(String userId) async {
    final profile = await patientProfileService.getPatientProfile(userId);
    return profile;
  }

  Future<void> updatePatientProfile(PatientInformation patientProfile) async {
    await patientProfileService.updatePatientProfile(patientProfile);
  }

  return PatientProfileProvider(
    getPatientProfile: getPatientProfile,
    updatePatientProfile: updatePatientProfile,
  );
});

class PatientProfileProvider {
  final Future<PatientInformation> Function(String) getPatientProfile;
  final Future<void> Function(PatientInformation) updatePatientProfile;

  PatientProfileProvider({
    required this.getPatientProfile,
    required this.updatePatientProfile,
  });
}
