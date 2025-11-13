import 'package:get/get.dart';
import '../../domain/usecases/get_home_data_usecase.dart';
import '../../domain/models/doctor.dart';
import '../../domain/models/speciality.dart';
import '../../domain/models/featured_service.dart';
import '../../domain/models/medicine.dart';

class HomeController extends GetxController {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeController({required this.getHomeDataUseCase});

  var doctors = <Doctor>[].obs;
  var specialities = <Speciality>[].obs;
  var featuredServices = <FeaturedService>[].obs;
  var medicines = <Medicine>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final data = await getHomeDataUseCase.execute();

      doctors.value = (data['specialists'] as List)
          .map((d) => Doctor.fromJsonApi(d))
          .toList();

      specialities.value = (data['specialities'] as List)
          .map((s) => Speciality.fromJsonApi(s))
          .toList();

      featuredServices.value = (data['actions'] as List)
          .map((f) => FeaturedService.fromJsonApi(f))
          .toList();

      medicines.value = (data['medicines'] as List? ?? [])
          .map((m) => Medicine.fromJsonApi(m))
          .toList();
    } catch (e) {
      print('Error loading home data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
