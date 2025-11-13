import 'package:flutter/material.dart';
import '../domain/models/doctor.dart';

class DoctorProfileWidget extends StatelessWidget {
  final Doctor doctor;
  const DoctorProfileWidget({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  doctor.image,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    color: Colors.grey.shade300,
                    width: 100,
                    height: 100,
                    child: const Icon(Icons.person, size: 40),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(doctor.speciality, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF357A7B))),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
