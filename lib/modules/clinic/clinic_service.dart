import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/clinic.dart';

class ClinicService {
  final CollectionReference clinicCollection =
      FirebaseFirestore.instance.collection('clinics');

  Future<List<Clinic>> getClinics() async {
    try {
      final snapshot = await clinicCollection.get();
      final clinics = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Clinic(
          id: doc.id,
          name: data['name'],
          address: data['address'],
          phoneNumber: data['phoneNumber'],
          nextAppointment: data['nextAppointment'].toDate(),
        );
      }).toList();
      return clinics;
    } catch (e) {
      print('Error retrieving clinics: $e');
      return [];
    }
  }
}
