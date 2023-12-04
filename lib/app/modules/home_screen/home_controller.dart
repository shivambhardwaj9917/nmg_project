import 'package:get/get.dart';

import '../../services/api_service.dart';

class DataController extends GetxController {
  final ApiService _apiService = ApiService();
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> responseData = <Map<String, dynamic>>[].obs;

  Future<void> fetchData() async {
    try {
      isLoading.value = true;
      final data = await _apiService.fetchData();
      responseData.assignAll(data);
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
