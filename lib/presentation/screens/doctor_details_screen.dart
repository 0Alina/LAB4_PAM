import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../domain/models/doctor.dart';
import '../../widgets/doctor_appointment_widget.dart';
import '../../widgets/doctor_header_widget.dart';
import '../../widgets/doctor_location_widget.dart';
import '../../widgets/doctor_profile_widget.dart';
import '../../widgets/doctor_tab_bar_widget.dart';
import '../../widgets/doctor_timing_widget.dart';
import '../controllers/doctor_details_controller.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    // Inițializează controller doar pentru acest ecran
    final controller = Get.put(DoctorDetailsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: DoctorHeaderWidget(doctor: doctor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorProfileWidget(doctor: doctor),
              const SizedBox(height: 12),
              const DoctorTabBarWidget(),
              const SizedBox(height: 10),
              const DoctorAppointmentWidget(),
              const SizedBox(height: 16),
              const DoctorTimingWidget(),
              const SizedBox(height: 16),
              const DoctorLocationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
