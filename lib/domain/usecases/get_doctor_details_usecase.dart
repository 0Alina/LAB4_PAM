import '../../data/api_service.dart';

class GetDoctorDetailsUseCase {
  final ApiService apiService;

  GetDoctorDetailsUseCase(this.apiService);

  Future<Map<String, dynamic>> execute() async {
    // nu mai trebuie doctorName, API-ul nu îl folosește
    return await apiService.fetchDoctorDetails();
  }
}
