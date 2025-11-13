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
    final apiService = ApiService(baseUrl: 'https://test-api-jlbn.onrender.com');
    getDoctorDetailsUseCase = GetDoctorDetailsUseCase(apiService);
    loadDoctorDetails();
  }

  Future<void> loadDoctorDetails() async {
    final data = await getDoctorDetailsUseCase.execute();
    appointment.value = data['appointment'] ?? {};
    timing.value = data['timing'] ?? [];
    locations.value = data['locations'] ?? [];
  }
}
