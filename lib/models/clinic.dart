import 'package:equatable/equatable.dart';

class Clinic extends Equatable {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final DateTime nextAppointment;

  const Clinic({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.nextAppointment,
  });

  @override
  List<Object?> get props => [id, name, address, phoneNumber, nextAppointment];

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      nextAppointment: DateTime.parse(json['nextAppointment']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'nextAppointment': nextAppointment,
    };
  }
}
