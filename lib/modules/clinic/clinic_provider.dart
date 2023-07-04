import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/clinic.dart';
import 'clinic_service.dart';

final clinicProvider = Provider<ClinicProvider>((ref) {
  final clinicService = ClinicService();

  Future<List<Clinic>> getClinics() async {
    final clinics = await clinicService.getClinics();
    return clinics;
  }

  return ClinicProvider(getClinics: getClinics);
});

class ClinicProvider {
  final Future<List<Clinic>> Function() getClinics;

  ClinicProvider({
    required this.getClinics,
  });
}
