import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchData() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/users');

      List<Map<String, dynamic>> data = List.from(response.data);

      return data;
    } catch (error) {
      throw error;
    }
  }

  Future<List<Map<String, dynamic>>> fetchData1() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');

      List<Map<String, dynamic>> data = List.from(response.data);

      return data;
    } catch (error) {
      throw error;
    }
  }
}
