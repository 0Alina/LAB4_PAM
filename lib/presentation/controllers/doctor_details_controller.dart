import 'package:get/get.dart';
import '../../domain/usecases/get_doctor_details_usecase.dart';
import '../../data/api_service.dart';

class DoctorDetailsController extends GetxController {
  var appointment = {}.obs;
  var timing = [].obs;
  var locations = [].obs;

  late final GetDoctorDetailsUseCase getDoctorDetailsUseCase;

  @override
  void onInit() {
    super.onInit();
    final apiService = ApiService(baseUrl: 'https://test-api-jlbn.onrender.com/v5');
    getDoctorDetailsUseCase = GetDoctorDetailsUseCase(apiService);
    loadDoctorDetails();
  }

  Future<void> loadDoctorDetails() async {
    final data = await getDoctorDetailsUseCase.execute();

    // Appointment
    final appointmentData = data['appointment'] ?? {};
    final hospital = appointmentData['hospital'] ?? {};

    appointment.value = {
      'type': appointmentData['type'] ?? '',
      'fee': "${appointmentData['currency'] ?? ''} ${appointmentData['fee'] ?? ''}",
      'hospital': hospital,
      'available_days': appointmentData['available_days'] ?? [],
    };

    // Timing
    timing.value = data['timing'] ?? [];

    // Locations
    locations.value = data['locations'] ?? [];
  }
}
