import 'package:flutter/material.dart';
import '../domain/models/doctor.dart';

class DoctorHeaderWidget extends StatelessWidget {
  final Doctor doctor;
  const DoctorHeaderWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doctor.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(doctor.speciality, // ← aici a fost specialization
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
