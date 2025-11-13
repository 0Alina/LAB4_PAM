import 'package:flutter/material.dart';
import '../domain/models/doctor.dart';
import '../presentation/screens/doctor_details_screen.dart';

class SpecialistsWidget extends StatelessWidget {
  final List<Doctor> doctors;
  const SpecialistsWidget({super.key, required this.doctors});

  Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DoctorDetailsScreen(doctor: doctor)),
          );
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  doctor.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(color: Colors.grey.shade300, height: 180, child: const Icon(Icons.person)),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor.speciality, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                    const SizedBox(height: 2),
                    Text(doctor.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(doctor.rating.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text("Specialists", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Spacer(),
            Text("View all >", style: TextStyle(fontSize: 14, color: Colors.teal, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: doctors.map((doctor) => _buildDoctorCard(context, doctor)).toList(),
          ),
        ),
      ],
    );
  }
}
