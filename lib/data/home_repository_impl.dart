import '../domain/models/doctor.dart';
import '../domain/models/speciality.dart';
import '../domain/models/featured_service.dart';
import '../domain/models/medicine.dart';
import 'api_service.dart';

class HomeRepositoryImpl {
  final ApiService apiService;

  HomeRepositoryImpl({required this.apiService});

  Future<List<Doctor>> fetchDoctors() async {
    final data = await apiService.fetchHomeData();
    final doctorsJson = data['specialists'] as List;
    return doctorsJson.map((json) => Doctor.fromJsonApi(json)).toList();
  }

  Future<List<Speciality>> fetchSpecialities() async {
    final data = await apiService.fetchHomeData();
    final specialitiesJson = data['specialities'] as List;
    return specialitiesJson.map((json) => Speciality.fromJsonApi(json)).toList();
  }

  Future<List<FeaturedService>> fetchFeaturedServices() async {
    final data = await apiService.fetchHomeData();
    final actionsJson = data['actions'] as List;
    return actionsJson.map((json) => FeaturedService.fromJsonApi(json)).toList();
  }

  Future<List<Medicine>> fetchMedicines() async {
    final data = await apiService.fetchHomeData();
    final medicinesJson = data['medicines'] as List? ?? [];
    return medicinesJson.map((json) => Medicine.fromJsonApi(json)).toList();
  }
}
