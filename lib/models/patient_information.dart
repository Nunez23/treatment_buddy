import 'package:equatable/equatable.dart';

class PatientInformation extends Equatable {
  final String id;
  final String name;
  final String age;
  final String gender;
  final String phoneNumber;
  final String address;
  final String weight;
  final String height;
  final String bmi;
  final String diagnosis;
  final String medicine;
  final String treatmentBuddy;

  const PatientInformation({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.address,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.diagnosis,
    required this.medicine,
    required this.treatmentBuddy,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        age,
        gender,
        phoneNumber,
        address,
        weight,
        height,
        bmi,
        diagnosis,
        medicine,
        treatmentBuddy,
      ];
}
