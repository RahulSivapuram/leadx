import 'package:dio/dio.dart';
import 'package:leadx/constants.dart';

class AuthService {
  Future<Map<String, dynamic>?> signin(String mobileNumber) async {
    Dio dio = Dio();

    final response = await dio.post("${Constants.baseUrl}/login",
        data: {"mobileNumber": mobileNumber});

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  Future<Map<String, dynamic>?> signup(Map<String, dynamic> data) async {
    Dio dio = Dio();

    final response =
        await dio.post("${Constants.baseUrl}/register", data: data);

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }
}
