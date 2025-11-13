import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/doctor.dart';
import '../../widgets/doctor_tab_bar_widget.dart';
import '../controllers/doctor_details_controller.dart';
import '../../widgets/doctor_appointment_widget.dart';
import '../../widgets/doctor_location_widget.dart';
import '../../widgets/doctor_timing_widget.dart';
import '../../widgets/doctor_header_widget.dart';
import '../../widgets/doctor_profile_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    // Initialize controller if not already
    final DoctorDetailsController controller = Get.put(DoctorDetailsController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: DoctorHeaderWidget(doctor: doctor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // Doctor profile
            DoctorProfileWidget(doctor: doctor),
            const SizedBox(height: 16),

            // Tab bar
            const DoctorTabBarWidget(),
            const SizedBox(height: 16),

            // Appointment
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: DoctorAppointmentWidget(),
            ),

            const SizedBox(height: 16),

            // Timing
            const DoctorTimingWidget(),

            const SizedBox(height: 16),

            // Locations
            const DoctorLocationWidget(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
