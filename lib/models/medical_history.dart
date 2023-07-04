import 'package:equatable/equatable.dart';

class MedicalHistory extends Equatable {
  final String id;
  final String userId;
  final String diagnosis;
  final String medicine;
  final String treatmentBuddy;

  const MedicalHistory({
    required this.id,
    required this.userId,
    required this.diagnosis,
    required this.medicine,
    required this.treatmentBuddy,
  });

  factory MedicalHistory.fromJson(Map<String, dynamic> json) {
    return MedicalHistory(
      id: json['id'],
      userId: json['userId'],
      diagnosis: json['diagnosis'],
      medicine: json['medicine'],
      treatmentBuddy: json['treatmentBuddy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'diagnosis': diagnosis,
      'medicine': medicine,
      'treatmentBuddy': treatmentBuddy,
    };
  }

  @override
  List<Object?> get props => [id, userId, diagnosis, medicine];
}
