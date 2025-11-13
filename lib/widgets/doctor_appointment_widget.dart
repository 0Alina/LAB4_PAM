import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/controllers/doctor_details_controller.dart';


class DoctorAppointmentWidget extends StatefulWidget {
  const DoctorAppointmentWidget({super.key});

  @override
  State<DoctorAppointmentWidget> createState() =>
      _DoctorAppointmentWidgetState();
}

class _DoctorAppointmentWidgetState extends State<DoctorAppointmentWidget> {
  int selectedDayIndex = 0;
  int selectedSlotIndex = -1;

  final controller = Get.find<DoctorDetailsController>();

  final Color lightGreen = const Color(0xFFD8F3F4);
  final Color darkGreen = const Color(0xFF357A7B);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.appointment.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      final days = List<Map<String, dynamic>>.from(controller.appointment['days']);
      final slots = List<String>.from(controller.appointment['slots']);
      final price = controller.appointment['price'];
      final clinicName = controller.appointment['clinicName'];
      final clinicLocation = controller.appointment['clinicLocation'];
      final additionalClinics = controller.appointment['additionalClinics'];
      final waitTime = controller.appointment['waitTime'];

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'In-Clinic Appointment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: darkGreen,
                    ),
                  ),
                ],
              ),
            ),

            // Clinic info
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clinicName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          clinicLocation,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: darkGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    additionalClinics,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            // Wait time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                waitTime,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
              ),
            ),

            Divider(color: Colors.grey.shade300, thickness: 1),
            const SizedBox(height: 8),

            // Days horizontal list
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10,
                    left: 16,
                    right: 16,
                    child: Container(height: 3, color: lightGreen),
                  ),
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: days.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      final day = days[index];
                      bool isSelected = selectedDayIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDayIndex = index;
                            selectedSlotIndex = -1;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  day['day']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  day['slots']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: day['slots']!.toLowerCase().contains('no slot')
                                        ? Colors.grey.shade700
                                        : Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Container(
                              height: 3,
                              width: isSelected
                                  ? day['day']!.length * 8.0 + day['slots']!.length * 6.0
                                  : 0,
                              color: darkGreen,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Slots horizontal list
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: slots.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  bool isSelected = selectedSlotIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSlotIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: lightGreen,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: isSelected ? darkGreen : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        slots[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: darkGreen,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }
}
