import 'package:equatable/equatable.dart';

class Medication extends Equatable {
  final String id;
  final String name;
  final String dosage;
  final String frequency;
  final String patientId;
  final DateTime endDate;
  final DateTime startDate;

  const Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.endDate,
    required this.startDate,
    required this.patientId,
    required this.frequency,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'],
      name: json['name'],
      dosage: json['dosage'],
      frequency: json['frequency'],
      patientId: json['patientId'],
      endDate: DateTime.parse(json['endDate']),
      startDate: DateTime.parse(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'frequency': frequency,
      'patientId': patientId,
      'endDate': endDate.toIso8601String(),
      'startDate': startDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, name, dosage];
}
