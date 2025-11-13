import '../../data/api_service.dart';

class GetHomeDataUseCase {
  final ApiService apiService;

  GetHomeDataUseCase(this.apiService);

  Future<Map<String, dynamic>> execute() async {
    return await apiService.fetchHomeData();
  }
}
