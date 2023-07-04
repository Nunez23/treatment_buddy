import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BloodPressure extends Equatable {
  final String id;
  final int systolic;
  final int diastolic;
  final DateTime timestamp;

  const BloodPressure({
    required this.id,
    required this.systolic,
    required this.diastolic,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, systolic, diastolic, timestamp];

  factory BloodPressure.data(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BloodPressure(
      id: data['id'],
      systolic: data['systolic'] as int,
      diastolic: data['diastolic'] as int,
      timestamp: DateTime.parse(data['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'systolic': systolic,
      'diastolic': diastolic,
      'timestamp': timestamp.toIso8601String(),
    };
  }

}
