import '../domain/models/doctor.dart';
import '../domain/models/featured_service.dart';
import '../domain/models/speciality.dart';

abstract class HomeRepository {
  Future<List<Doctor>> getDoctors();
  Future<List<Speciality>> getSpecialities();
  Future<List<FeaturedService>> getFeaturedServices();
}
